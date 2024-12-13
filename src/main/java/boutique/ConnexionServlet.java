package boutique;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ConnexionServlet")
public class ConnexionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProduitDAO produitDAO;

    public ConnexionServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Email reçu : " + email);
        System.out.println("Mot de passe reçu : " + password);

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM utilisateurs WHERE email = ? AND mot_de_passe = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setString(1, email);
                pstmt.setString(2, password);

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    System.out.println("Utilisateur trouvé !");

                    boolean isBlocked = rs.getBoolean("is_blocked");
                    String role = rs.getString("role");

                    if (isBlocked) {
                        System.out.println("Utilisateur bloqué !");
                        // Passer un message d'erreur spécifique
                        request.setAttribute("errorMessage", "Vous êtes bloqué par l'administrateur.");
                        request.getRequestDispatcher("/connexion.jsp").forward(request, response);
                        return;
                    }

                    HttpSession session = request.getSession();
                    System.out.println("ID utilisateur : " + session.getAttribute("utilisateur_id"));
                    System.out.println("Nom utilisateur : " + session.getAttribute("utilisateur_nom"));
                    session.setAttribute("utilisateur_id", rs.getInt("ID"));
                    session.setAttribute("utilisateur_nom", rs.getString("nom"));
                    session.setAttribute("role", rs.getString("role"));
                    if (role.equalsIgnoreCase("admin")) {
                        response.sendRedirect("admin/Gestion_Utilisateur");

                    }else if(role.equalsIgnoreCase("utilisateur")) {
                    response.sendRedirect("Interface_Client.jsp");

                } }else {
                    System.out.println("Utilisateur introuvable !");
                    request.setAttribute("errorMessage", "Identifiants incorrects. Veuillez réessayer.");
                    request.getRequestDispatcher("/connexion.jsp").forward(request, response);
                }
                }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur de connexion à la base de données.");
        }
    }

}


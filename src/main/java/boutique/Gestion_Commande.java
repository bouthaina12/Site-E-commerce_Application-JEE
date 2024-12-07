package boutique;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 */
@WebServlet("/admin/Gestion_Commande")
public class Gestion_Commande extends HttpServlet {
    private CommandeDAO commandeDAO;

    @Override
    public void init() throws ServletException {
        try {
            commandeDAO = new CommandeDAO();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Impossible d'initialiser CommandeDAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("details".equals(action)) {
            // Afficher les détails d'une commande spécifique
            int commandeId = Integer.parseInt(request.getParameter("commandeId"));
            
            // Récupérer les détails de la commande
            Commande commande = commandeDAO.getCommandeById(commandeId);
            List<OrderDetails> details = commandeDAO.getOrderDetailsByCommandeId(commandeId);

            // Passer les données à la JSP
            request.setAttribute("commande", commande);
            request.setAttribute("details", details);

            // Rediriger vers une nouvelle page JSP
            request.getRequestDispatcher("/Detail_Commande.jsp").forward(request, response);
        } else {
            // Récupérer la liste des commandes en cours
            List<Commande> commandes = commandeDAO.getAllCommandesEncours();

            // Passer les commandes à la JSP
            request.setAttribute("commandes", commandes);
            request.getRequestDispatcher("/Gestion_Commandes.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("updateStatus".equals(action)) {
            int commandeId = Integer.parseInt(request.getParameter("commandeId"));
            String newStatus = "livree";

            // Mettre à jour le statut
            commandeDAO.updateCommandeStatus(commandeId, newStatus);

            // Rediriger
            response.sendRedirect("Gestion_Commande");
        }
    }
}

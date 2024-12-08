

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import boutique.Panier;

/**
 * Servlet implementation class Gestion_Panier
 */
@WebServlet("/Gestion_Panier")
public class Gestion_Panier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Gestion_Panier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int produitId = Integer.parseInt(request.getParameter("produitId"));
        int quantity = 1; // Default quantite is 1

        Panier panier = (Panier) session.getAttribute("Panier");
        if (panier == null) {
            panier = new Panier();
        }

        panier.addProduct(produitId, quantity);

        // Save the updated cart back in the session
        session.setAttribute("Panier", panier);

        // Redirect to the products page
        response.sendRedirect("Interface_Client.jsp");
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Panier panier = (Panier) session.getAttribute("Panier");

        if (panier == null) {
            panier = new Panier();
            session.setAttribute("Panier", panier);
        }

        // Récupérer l'action (updateQuantite ou supprimer)
        String action = request.getParameter("action");

        if ("updateQunatite".equals(action)) {
            int produitId = Integer.parseInt(request.getParameter("produit_id"));

            // Mettre à jour la quantité
            int quantite = Integer.parseInt(request.getParameter("quantity"));
            if (quantite > 0) {
                panier.updateProduct(produitId, quantite);
            } else {
                panier.removeProduct(produitId); // Si quantité est 0, supprimer le produit
            }
        } else if ("supprimer".equals(action)) {
             int produitId = Integer.parseInt(request.getParameter("produit_id"));

            // Supprimer le produit
            panier.removeProduct(produitId);
        }else if ("vider".equals(action)) {
            // Supprimer le produit
            panier.clear();
        }

        // Enregistrer le panier mis à jour dans la session
        session.setAttribute("Panier", panier);

        // Rediriger vers la page du panier
        response.sendRedirect("Panier.jsp");
    }

}

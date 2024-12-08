package boutique;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 */
@WebServlet("/Gestion_Commande")
public class Gestion_Commande extends HttpServlet {
    private CommandeDAO commandeDAO;
    private ProduitDAO produitDAO;
    private  double totalPrice = 0.0;



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
        }
        else {
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
        
        
        // Passer une Commande 
        if ("valider".equals(action)) {
            HttpSession session = request.getSession();
            Panier panier = (Panier) session.getAttribute("Panier");

                int utilisateur_id = Integer.parseInt(request.getParameter("utilisateur_id"));

                // Créer une nouvelle commande
                Commande commande = new Commande();
                commande.setClientId(utilisateur_id);
                commande.setDateCommande(new java.sql.Timestamp(System.currentTimeMillis()));

                commande.setStatut("en cours");

                // Ajouter la commande et récupérer l'ID
                int commandeId = commandeDAO.ajouterCommande(commande);

                // Récapitulatif et prix total
                ProduitDAO produitDAO = new ProduitDAO();
                

                // Créer les détails de commande
                for (Map.Entry<Integer, Integer> entry : panier.getProducts().entrySet()) {
                    int productId = entry.getKey();
                    int quantity = entry.getValue();

                    Produit produit = produitDAO.getProduitById(productId);

                    if (produit != null) {
                        double subtotal = produit.getPrix() * quantity;
                        totalPrice += subtotal;

                        OrderDetails detail = new OrderDetails();
                        detail.setCommandeId(commandeId);
                        detail.setProduitId(productId);
                        detail.setQuantite(quantity);
                        detail.setPrixTotal(subtotal);

                        try {
                            commandeDAO.ajouterOrderDetail(detail);
                        } catch (SQLException e) {
                            e.printStackTrace();
                            throw new ServletException("Erreur lors de l'ajout d'un détail de commande.", e);
                        }
                    }
                }
                // Vider le panier
                panier.clear();
                session.setAttribute("Panier", panier);
              
                // Récupérer les détails de la commande pour le récapitulatif
                List<OrderDetails> details = commandeDAO.getOrderDetailsByCommandeId(commandeId);

                // Passer les données à la JSP
                request.setAttribute("commande", commande);
                request.setAttribute("details", details);
                request.setAttribute("PrixTotal", totalPrice);
              

                // Transférer vers la page de confirmation
                request.getRequestDispatcher("/confirmation.jsp").forward(request, response);

              
            }
        
        
        if ("detail_historique".equals(action)) {
            // Afficher les détails d'une commande spécifique
            int commandeId = Integer.parseInt(request.getParameter("commandeId"));
            
            // Récupérer les détails de la commande
            Commande commande = commandeDAO.getCommandeById(commandeId);
            List<OrderDetails> details = commandeDAO.getOrderDetailsByCommandeId(commandeId);

            // Passer les données à la JSP
            request.setAttribute("commande", commande);
            request.setAttribute("details", details);


            // Rediriger vers une nouvelle page JSP
            request.getRequestDispatcher("/Detail_Historique.jsp").forward(request, response);
        }
        }
}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%@ page import="boutique.Panier" %>
<%@ page import="boutique.ProduitDAO" %>
<%@ page import="boutique.Produit" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Panier</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="design.css">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"></head>
<body>
<%@ include file="menuClient.jsp" %>

<div class="container mt-4">
    <h1>Votre Panier</h1>
    <%
        Panier panier = (Panier) session.getAttribute("Panier");
        ProduitDAO produitDAO = new ProduitDAO();
        double totalPrice = 0.0;

        if (panier == null || panier.getProducts().isEmpty()) {
    %>
        <p>Votre panier est vide.</p>
    <% 
        } else {
    %>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Produit</th>
                    <th>Description</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                    <th>Sous-total</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Map.Entry<Integer, Integer> entry : panier.getProducts().entrySet()) {
                        int productId = entry.getKey();
                        int quantity = entry.getValue();
                        Produit produit = produitDAO.getProduitById(productId);

                        if (produit != null) {
                            double subtotal = produit.getPrix() * quantity;
                            totalPrice += subtotal;
                %>
                    <tr>
                        <td><%= produit.getNom() %></td>  
                        <td><%= produit.getDescription() %></td>
                        <td><%= produit.getPrix() %> TND</td>
                        <td>
                            <form action="Gestion_Panier" method="post" class="d-inline">
                                <input type="hidden" name="produit_id" value="<%= productId %>">
                                <input type="hidden" name="action" value="updateQunatite">  
                                <input type="number" name="quantity" value="<%= quantity %>" min="1" class="form-control" style="width: 80px; display: inline;">
                                <button type="submit" class="btn btn-primary btn-sm">Mettre à jour</button>
                            </form>
                        </td>
                        <td><%= subtotal %> TND</td>
                        <td>
                            <form action="Gestion_Panier" method="post" class="d-inline">
                                <input type="hidden" name="produit_id" value="<%= productId %>">
                                <input type="hidden" name="action" value="supprimer"> 
                                <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <div class="text-end">
            <h3>Total : <%= totalPrice %> TND</h3>
        </div>
        <div class="text-end mt-3">
            <form action="Gestion_Panier" method="post">
               <input type="hidden" name="action" value="vider">
                
               <button type="submit" class="btn btn-warning">Vider le panier</button>
            </form>
            <br>
           <form action="Gestion_Commande" method="post">
               <input type="hidden" name="action" value="valider">
               <input type="hidden" name="utilisateur_id" value="<%=session.getAttribute("utilisateur_id") %>">
               <button type="submit" class="btn btn-warning">Valider</button>
            </form>       
         </div>
    <% 
        }
    %>
</div>

</body>


</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List" %>
<%@ page import="boutique.Produit" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Produits</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
</head>
<body>
	<header>
	    <%@ include file="admin_header.jsp" %>
		
	</header>
	<br>
    <div class="container mt-5">
        <h1 class="text-center mb-4">Gestion des Produits</h1>

        <!-- Formulaire d'ajout -->
        <form action="Gestion_Produit" method="POST" enctype="multipart/form-data" class="mb-4">
            <input type="hidden" name="action" value="add">
            <div class="row g-3">
                <div class="col-md-4">
                    <input type="text" name="nom" class="form-control" placeholder="Nom" required>
                </div>
                <div class="col-md-4">
                  <select id="categorie" name="categorie" class="form-control" required>
                      <option value="" disabled selected>Choisissez une catégorie</option>
                      <option value="hommes" >hommes</option>
                      <option value="femmes" >femmes</option>
                      <option value="enfants" >enfants</option>
                      <option value="accessoires" >accessoires</option>
        
                  </select>               
                </div>
                <div class="col-md-4">
                    <input type="number" name="prix" step="0.01"  min="0" class="form-control" placeholder="Prix TND" required>
                </div>
                <div class="col-md-6">
                    <textarea name="description" class="form-control" placeholder="Description" required></textarea>
                </div>
                <div class="col-md-3">
                    <input type="file" name="image" class="form-control" required>
                </div>
                <div class="col-md-3">
                    <input type="number" name="stock"  min="0" class="form-control" placeholder="Stock" required>
                </div>
                <div class="col-md-12 text-center">
                    <button type="submit" class="btn btn-success">Ajouter Produit</button>
                </div>
            </div>
        </form>

        <!-- Tableau d'affichage -->
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Catégorie</th>
                    <th>Stock</th>
                   
                </tr>
            </thead>
            <tbody>
              <%
            // Récupérer la liste des produits depuis les attributs de la requête
            List<boutique.Produit> produits = (List<boutique.Produit>) request.getAttribute("Produits");
            
            if (produits != null && !produits.isEmpty()) {
                for (boutique.Produit produit : produits) {
        %>
        <tr>
            <td><%= produit.getId() %></td>
            <td><%= produit.getNom() %></td>
            <td><%= produit.getCategorie() %></td>  
            <td><%= produit.getStock() %></td>
            <td>
                <!-- Bouton Supprimer -->
            
                <form action="Gestion_Produit" method="POST" style="display:inline;">
                    <input type="hidden" name="id" value="<%= produit.getId() %>">
                    <input type="hidden" name="action" value="delete">
                    <button type="submit" class="btn btn-danger">Supprimer</button>
                </form>
                
                 <!-- Bouton Modifier -->
                <form action="Gestion_Produit" method="GET" style="display:inline;">
                    <input type="hidden" name="id" value="<%= produit.getId() %>">
                    <input type="hidden" name="action" value="edit">
                    <button type="submit" class="btn btn-primary">Modifier</button>
                </form>
                
              <!-- Bouton Afficher Détails -->
                <form action="Gestion_Produit" method="GET" style="display:inline;">
                    <input type="hidden" name="id" value="<%= produit.getId() %>">
                    <input type="hidden" name="action" value="detail">
                    <button type="submit" class="btn btn-info">Afficher Détails</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">Aucun produit disponible.</td>
        </tr>
        <%
            }
        %>
            </tbody>
        </table>
    </div>
</body>
</html>

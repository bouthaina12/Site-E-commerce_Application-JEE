<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="boutique.Produit" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Produits</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="design.css">
    
    
</head>
	<header>
		<%@ include file="admin_header.jsp" %>
		
	</header>
<body>
<%
    // Récupérer le produit transmis par la servlet
    Produit produit = (Produit) request.getAttribute("produit");

    // Vérifier si le produit existe
    if (produit == null) {
%>
    <div class="container mt-5">
        <div class="alert alert-danger text-center" role="alert">
            <h2>Erreur : Produit non trouvé</h2>
            <p>Le produit demandé n'existe pas ou n'a pas été transmis correctement.</p>
            <a href="Gestion_Produits.jsp" class="btn btn-secondary">Retour à la gestion des produits</a>
        </div>
    </div>
<%
        return; // Arrêter l'exécution si le produit est null
    }
%>

<div class="container mt-5">
    <h2 class="text-center mb-4"> Details de produit</h2>
    <form action="Gestion_Produit"   enctype="multipart/form-data">
       
        <!-- ID -->
        <div class="mb-3">
            <label for="id" class="form-label">ID :</label>
            <p class="form-control" ><%= produit.getId() %></p>
        </div>
        <!-- Nom -->
        <div class="mb-3">
            <label for="nom" class="form-label">Nom :</label>
            <p class="form-control" ><%= produit.getNom() %></p>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label for="description" class="form-label">Description :</label>
            <p class="form-control"><%= produit.getDescription() %></p>
        </div>

        <!-- Prix -->
        <div class="mb-3">
            <label for="prix" class="form-label">Prix :</label>
            <p class="form-control" ><%= produit.getPrix() %></p>
        </div>

        <!-- Catégorie -->
        <div class="mb-3">
            <label for="categorie" class="form-label">Catégorie :</label>
            <p class="form-control" ><%= produit.getCategorie() %></p>
           
        </div>

        <!-- Stock -->
        <div class="mb-3">
            <label for="stock" class="form-label">Stock :</label>
            <p class="form-control" ><%= produit.getStock() %></p>

        </div>

 <!-- Image -->
<div class="mb-3">
    <label for="image" class="form-label">Image:</label>
    <!-- Afficher l'ancienne URL  -->
    <div class="mb-2">
    <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" alt="Image du produit" width="200">
        
    </div>

</div>
        <!-- Bouton de soumission -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Retour</button>
        </div>
    </form>
</div>


</body>
</html>
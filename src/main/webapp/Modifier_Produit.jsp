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
    
</head>
<body>
	<header>
		<%@ include file="admin_header.jsp" %>
		
	</header>
	<br>
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
    <h2 class="text-center mb-4">Modifier le produit</h2>
    <form action="Gestion_Produit" method="POST" enctype="multipart/form-data">
        <!-- Champ caché pour transmettre l'ID -->
        <input type="text" name="id" value="<%= produit.getId() %>">

        <!-- Nom -->
        <div class="mb-3">
            <label for="nom" class="form-label">Nom :</label>
            <input type="text" class="form-control" id="nom" name="nom" value="<%= produit.getNom() %>" required>
            <div class="invalid-feedback">Veuillez entrer un nom.</div>
        </div>

        <!-- Description -->
        <div class="mb-3">
            <label for="description" class="form-label">Description :</label>
            <textarea class="form-control" id="description" name="description" rows="3" required><%= produit.getDescription() %></textarea>
            <div class="invalid-feedback">Veuillez entrer une description.</div>
        </div>

        <!-- Prix -->
        <div class="mb-3">
            <label for="prix" class="form-label">Prix :</label>
            <input type="number" class="form-control" id="prix" name="prix" step="0.01" value="<%= produit.getPrix() %>" required>
            <div class="invalid-feedback">Veuillez entrer un prix valide.</div>
        </div>

        <!-- Catégorie -->
        <div class="mb-3">
            <label for="categorie" class="form-label">Catégorie :</label>
                  <select id="categorie" name="categorie" class="form-control" required>
                      <option value="<%= produit.getCategorie() %>" ><%= produit.getCategorie() %></option>
                      <option value="hommes" >hommes</option>
                      <option value="femmes" >femmes</option>
                      <option value="enfants" >enfants</option>
                      <option value="accessoires" >accessoires</option>
        
                  </select>
               
        <div class="invalid-feedback">Veuillez selectionner une catégorie.</div>
        </div>

        <!-- Stock -->
        <div class="mb-3">
            <label for="stock" class="form-label">Stock :</label>
            <input type="number" class="form-control" id="stock" name="stock" value="<%= produit.getStock() %>" required>
            <div class="invalid-feedback">Veuillez entrer une quantité de stock valide.</div>
        </div>

 <!-- Image -->
<div class="mb-3">
    <label for="image" class="form-label">Image (URL) :</label>
    <!-- Afficher l'ancienne URL  -->
    <div class="mb-2">
        <input type="text" name="ancienne_image" value="<%= produit.getImage() %>">
        
    </div>
    <!-- Champ fichier pour télécharger une nouvelle image -->
    <input type="file" class="form-control" id="image" name="image">
    <div class="invalid-feedback">Veuillez télécharger une image si nécessaire.</div>

</div>

        <!-- Action -->
        <input type="hidden" name="action" value="update">

        <!-- Bouton de soumission -->
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Enregistrer</button>
        </div>
    </form>
</div>


</body>
</html>
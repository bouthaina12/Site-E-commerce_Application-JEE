<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="boutique.Produit" %>
<%@ page import="boutique.ProduitDAO" %>

<!DOCTYPE html>
<html lang="fr">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Boutique en ligne</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="design.css">
   
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@include file="menu.jsp"%>
  
   
</head>
<body>
   
 <!-- Description de la boutique -->
   <div class="store-description">
       <h1>Bienvenue dans notre boutique en ligne !</h1>
       <p>Découvrez une large sélection de produits de qualité, adaptés à tous les styles et toutes les catégories. Faites votre shopping en toute simplicité et ajoutez vos articles au panier. Pour finaliser votre achat, n'oubliez pas de vous inscrire !</p>
   </div>
   <!-- Affichage des produits par catégorie -->
    <div class="container mt-4">

        <!-- Section Hommes -->
        <div class="category-section">
            <h2><b>Hommes</b></h2>
            <div class="product-list">
               <%! 
                     ProduitDAO produitDAO = new ProduitDAO();
                      %>
               <% List<Produit> productsHommes = produitDAO.getProduitsParCategorie("hommes");

                   for (Produit produit : productsHommes) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                       <h4><b><%= produit.getNom() %></b></h4>
                        <p><%= produit.getDescription() %></p>
                        <p style="color: #006400;">Prix : <%= produit.getPrix() %> TND</p>
                        <p style="color:#0000FF;">Qauntité en stock : <%= produit.getStock() %> pièces</p>
                        
                        
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Section Femmes -->
        <div class="category-section">
            <h2><b>Femmes</b></h2>
            <div class="product-list">
                <% 
                List<Produit> productsFemmes = produitDAO.getProduitsParCategorie("femmes");

                   for (Produit produit : productsFemmes) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                        <h4><b><%= produit.getNom() %></b></h4>
                        <p><%= produit.getDescription() %></p>
                        <p style="color: #006400;">Prix : <%= produit.getPrix() %> TND</p>
                        <p style="color:#0000FF;">Qauntité en stock : <%= produit.getStock() %> pièces</p>    
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Section Enfants -->
        <div class="category-section">
            <h2><b>Enfants</b></h2>
            <div class="product-list">
                <%  

                List<Produit> productsEnfants = produitDAO.getProduitsParCategorie("enfants");

                   for (Produit produit : productsEnfants) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                       <h4><b><%= produit.getNom() %></b></h4>
                        <p><%= produit.getDescription() %></p>
                        <p style="color: #006400;">Prix : <%= produit.getPrix() %> TND</p>
                        <p style="color:#0000FF;">Qauntité en stock : <%= produit.getStock() %> pièces</p>
                        
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Section Accessoires -->
        <div class="category-section">
            <h2><b>Accessoires</b></h2>
            <div class="product-list">
                <% List<Produit> productsAccessoires = produitDAO.getProduitsParCategorie("accessoires");

                   for (Produit produit : productsAccessoires) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                       <h4><b><%= produit.getNom() %></b></h4>
                        <p><%= produit.getDescription() %></p>
                        <p style="color: #006400;">Prix : <%= produit.getPrix() %> TND</p>
                        <p style="color:#0000FF;">Qauntité en stock : <%= produit.getStock() %> pièces</p>
                        
                        
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

    </div>

   <div id="signup-message" class="signup-message">
       <p>Pour ajouter des articles au panier, vous devez d'abord vous inscrire ou vous connecter !</p>
       <button onclick="closeMessage()">Fermer</button>
   </div>
   <script>
       function addToCart(productId) {
           var isLoggedIn = false; // À définir selon l'état de connexion
           if (!isLoggedIn) {
               document.getElementById("signup-message").style.display = "block";
           } else {
               // Ajouter au panier (logique à implémenter)
           }
       }
       function closeMessage() {
           document.getElementById("signup-message").style.display = "none";
       }
   </script>
<%@include file="footer.jsp"%>

</body>
<style>
/* En-tête professionnel */


       /* Style général */
       body {
           font-family: Arial, sans-serif;
           margin: 0;
           padding: 0;
           background-color: #f4f4f4;
       }
       
       /* Description de la boutique */
       .store-description {
           text-align: center;
           margin: 20px;
       }
       .store-description h1 {
           color: #333;
       }
       .store-description p {
           color: #555;
           font-size: 16px;
       }
       /* Affichage des produits par catégorie */
       .category-section {
           padding: 20px;
           margin-bottom: 30px;
           background-color: #fff;
           border-radius: 10px;
           box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
       }
       .category-section h2 {
           text-align: center;
           color: #333;
       }
       .product-list {
           display: flex;
           flex-wrap: wrap;
           justify-content: space-evenly;
           gap: 20px;
           padding: 20px;
       }
     /* Carte produit carrée */
		.product {
		    background-color: white;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    width: 300px; /* Largeur fixe de la carte */
		    height: 550px; /* Hauteur égale à la largeur pour un carré */
		    display: flex;
		    flex-direction: column;
		    align-items: center; /* Centrer horizontalement les éléments */
		    justify-content: space-between; /* Répartir verticalement les éléments */
		    text-align: center;
		    padding: 15px;
		    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
		}
		
		/* Taille fixe pour les images dans la carte */
		.product-image {
		    width: 80%; /* Largeur relative à la carte */
		    height: 80%; /* Hauteur proportionnelle pour rester carrée */
		    object-fit: cover; /* Recadre les images pour remplir l'espace sans déformation */
		    border-radius: 5px;
		}
		
		/* Bouton Ajouter au panier */
		.add-to-cart-btn {
		    padding: 8px 15px;
		    background-color: #007bff;
		    color: white;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    font-size: 12px;
		}
		
		.add-to-cart-btn:hover {
		    background-color: #0056b3;
		}
       /* Message d'alerte pour l'inscription */
       .signup-message {
           display: none;
           position: fixed;
           top: 20%;
           left: 50%;
           transform: translateX(-50%);
           background-color: #f8d7da;
           color: #721c24;
           border: 1px solid #f5c6cb;
           padding: 20px;
           border-radius: 5px;
           box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
       }
       .signup-message button {
           background-color: #dc3545;
           color: white;
           padding: 5px 10px;
           border: none;
           border-radius: 5px;
           cursor: pointer;
       }</style>
</html>
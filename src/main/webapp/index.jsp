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
            <h2>Hommes</h2>
            <div class="product-list">
               <%! 
                     ProduitDAO produitDAO = new ProduitDAO();
                      %>
               <% List<Produit> productsHommes = produitDAO.getProduitsParCategorie("hommes");

                   for (Produit produit : productsHommes) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                        <h3><%= produit.getNom() %></h3>
                        <p><%= produit.getDescription() %></p>
                        <p>Prix : <%= produit.getPrix() %> TND</p>
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Section Femmes -->
        <div class="category-section">
            <h2>Femmes</h2>
            <div class="product-list">
                <% 
                List<Produit> productsFemmes = produitDAO.getProduitsParCategorie("femmes");

                   for (Produit produit : productsFemmes) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                        <h3><%= produit.getNom() %></h3>
                        <p><%= produit.getDescription() %></p>
                        <p>Prix : <%= produit.getPrix() %> TND</p>
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Section Enfants -->
        <div class="category-section">
            <h2>Enfants</h2>
            <div class="product-list">
                <%  

                List<Produit> productsEnfants = produitDAO.getProduitsParCategorie("enfants");

                   for (Produit produit : productsEnfants) { %>
                    <div class="produit">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                        <h3><%= produit.getNom() %></h3>
                        <p><%= produit.getDescription() %></p>
                        <p>Prix : <%= produit.getPrix() %> TND</p>
                        <button class="add-to-cart-btn" onclick="addToCart('<%= produit.getId() %>')">Ajouter au panier</button>
                    </div>
                <% } %>
            </div>
        </div>

        <!-- Section Accessoires -->
        <div class="category-section">
            <h2>Accessoires</h2>
            <div class="product-list">
                <% List<Produit> productsAccessoires = produitDAO.getProduitsParCategorie("accessoires");

                   for (Produit produit : productsAccessoires) { %>
                    <div class="product">
                        <img src="<%=request.getContextPath()%>/<%= produit.getImage() %>" class="product-image">
                        <h3><%= produit.getNom() %></h3>
                        <p><%= produit.getDescription() %></p>
                        <p>Prix : <%= produit.getPrix() %> TND</p>
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
</html>
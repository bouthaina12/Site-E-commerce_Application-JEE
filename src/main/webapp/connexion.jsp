<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Se connecter</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="design.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<%@include file="head.jsp"%>
</head>
<body>
<div class="container">
    <div id="signup-message" class="alert alert-danger text-center" style="display: none;">
        <p>Vous êtes bloqué par l'administrateur.</p>
        <button class="btn btn-danger btn-sm" onclick="closeMessage()">Fermer</button>
    </div>

    <div class="card w-50 mx-auto my-5">
        <div class="card-header text-center">Se connecter</div>
        <div class="card-body">
     <!-- Afficher un message d'erreur si présent -->
            <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null) { %>
                <div class="alert alert-danger" role="alert">
                    <%= errorMessage %>
                </div>
            <% } %>
            <form action="ConnexionServlet" method="post">
                <div class="form-group">
                    <label>Adresse Email</label> 
                    <input type="email" name="email" class="form-control" placeholder="Entrer votre email">
                </div>
                <div class="form-group">
                    <label>Mot de passe</label> 
                    <input type="password" name="password" class="form-control" placeholder="*****">
                </div>
                <br>
                <div class="text-center">
                    <button type="submit" class="btn btn-primary">Se connecter</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function closeMessage() {
        document.getElementById("signup-message").style.display = "none";
    }
</script>
</body>
</html>
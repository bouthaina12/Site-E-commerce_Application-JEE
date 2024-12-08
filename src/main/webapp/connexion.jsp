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
        <div class="card w-50 mx-auto my-5">
            <div class="card-header text-center">Se connecter</div>
            <div class="card-body">
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
</body>
</html>
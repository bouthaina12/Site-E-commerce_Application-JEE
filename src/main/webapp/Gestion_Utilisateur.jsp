<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="boutique.utilisateur" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Gestion utilisateurs </title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

	<header>
		<%@ include file="admin_header.jsp" %>
		
	</header>
	<br>

	 <div class="container mt-5">
        <h2 class="text-center">Liste des  utilisateurs</h2>
       <table class="table table-striped table-bordered mt-3">
        <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Rôle</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<utilisateur> users = (List<utilisateur>) request.getAttribute("utilisateurs"); // Retrieve the list
                if (users != null) {
                    for (utilisateur user : users) {
            %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getNom() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getRole() %></td>
                <td><%= user.isBlocked() ? "Bloqué" : "Actif" %></td>
                 <td>
                                <form action="Gestion_Utilisateur" method="POST" style="display:inline;">
                                    <input type="hidden" name="Id" value="<%= user.getId() %>">
                                    <input type="hidden" name="action" value="block">
                                    <button type="submit" class="btn btn-warning">Bloquer</button>
                                </form>

                                <form action="Gestion_Utilisateur" method="POST" style="display:inline;">
                                    <input type="hidden" name="Id" value="<%= user.getId() %>">
                                    <input type="hidden" name="action" value="unblock">
                                    <button type="submit" class="btn btn-success">Débloquer</button>
                                </form>

                                <form action="Gestion_Utilisateur" method="POST" style="display:inline;">
                                    <input type="hidden" name="Id" value="<%= user.getId() %>">
                                    <input type="hidden" name="action" value="delete">
                                    <button type="submit" class="btn btn-danger">Supprimer</button>
                                </form>
                 </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">Aucun utilisateur trouvé.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    	</div>
</body>
</html>

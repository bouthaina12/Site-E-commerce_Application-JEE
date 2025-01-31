<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="boutique.Commande" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Commandes</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       <link rel="stylesheet" href="design.css">
       
</head>
<header>
    <%@ include file="admin_header.jsp" %>

</header>
<br>
<body>
    <div class="container mt-5">
    <h2 class="text-center">Liste des Commandes</h2>

    <!-- Liste déroulante pour filtrer les commandes -->
    <div class="mb-3">
        <form method="GET" action="Gestion_Commande">
            <label for="statut" class="form-label">Filtrer par statut :</label>
            <select name="statut" id="statut" class="form-select" onchange="this.form.submit()">
                <option value="">Tous</option>
                <option value="en cours" <%= "en cours".equals(request.getParameter("statut")) ? "selected" : "" %>>Commandes en cours</option>
                <option value="livree" <%= "livree".equals(request.getParameter("statut")) ? "selected" : "" %>>Commandes livrées</option>
            </select>
        </form>
    </div>

    <table class="table table-striped table-bordered mt-3">
        <thead>
            <tr>
                <th>ID</th>
                <th>Client</th>
                <th>Date</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
    // Récupérer la liste des commandes depuis la requête
    List<Commande> commandes = (List<Commande>) request.getAttribute("commandes");
    if (commandes != null && !commandes.isEmpty()) { // Vérifier si la liste n'est pas vide
        for (Commande commande : commandes) {
%>
        <tr>
            <td><%= commande.getId() %></td>
            <td><%= commande.getClientId() %></td>
            <td><%= commande.getDateCommande() %></td>
            <td><%= commande.getStatut() %></td>
            <td>
                <% 
                    // Afficher le bouton "Marquer comme livrée" uniquement si le statut est "en cours"
                    if ("en cours".equals(commande.getStatut())) { 
                %>
                <form method="POST" action="Gestion_Commande" style="display:inline;">
                    <input type="hidden" name="commandeId" value="<%= commande.getId() %>">
                    <input type="hidden" name="action" value="updateStatus">
                    <button type="submit" class="btn btn-success btn-sm">Marquer comme livrée</button>
                </form>
                <% 
                    } 
                %>
                <a href="Gestion_Commande?action=details&commandeId=<%= commande.getId() %>" 
                   class="btn btn-info btn-sm">Afficher Détails</a>
            </td>
        </tr>
<%
        }
    } else { 
%>
        <tr>
            <td colspan="5" class="text-center">Aucune commande trouvée</td>
        </tr>
<%
    } 
%>

        </tbody>
    </table>
</div>

</body>
</html>

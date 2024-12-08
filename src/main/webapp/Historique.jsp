<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="boutique.Commande" %>
<%@ page import="boutique.CommandeDAO" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historique Commandes</title>
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       <link rel="stylesheet" href="design.css">
       
</head>
	<header>
	    <%@ include file="menuClient.jsp" %>
		
	</header>
	<br>
<body>
    <div class="container mt-5">
        <h2 class="text-center"> Mes  Commandes </h2>
       <table class="table table-striped table-bordered mt-3">
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Statut</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%   CommandeDAO commandeDAO = new CommandeDAO();
                      int clientid = (int) session.getAttribute("utilisateur_id");
                      System.out.println(clientid );
                    // Récupérer la liste des commandes depuis la requête
                    List<Commande> commandes = commandeDAO.getAllCommandes(clientid);
                    if (commandes != null) {
                        for (Commande commande : commandes) {
                %>
                <tr>
                    <td><%= commande.getDateCommande() %></td>
                    <td><%= commande.getStatut() %></td>
                    <td>
                    
                       
                          <form action="Gestion_Commande" method="post" class="d-inline">
                                <input type="hidden" name="commandeId" value="<%= commande.getId() %>">
                                <input type="hidden" name="action" value="detail_historique"> 
                                <button type="submit" class="btn btn-danger btn-sm">Afficher details</button>
                            </form>
                    </td>
                </tr>
                <% 
                        }
                    } else { 
                %>
                <tr>
                    <td colspan="3" class="text-center">Aucune commande trouvée</td>
                </tr>
                <% 
                    } 
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="boutique.OrderDetails" %>
<%@ page import="boutique.Commande" %>
<%@ page import="boutique.Produit" %>
<%@ page import="boutique.ProduitDAO" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>historique</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="design.css">
    
</head>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
	<header>
	    <%@ include file="menuClient.jsp" %>
		
</header>
	<br>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Mes Commandes</h2>

        <%
            Commande commande = (Commande) request.getAttribute("commande");

            List<OrderDetails> details = (List<OrderDetails>) request.getAttribute("details");
        %>

        <h4>Date de commande: <%= commande.getDateCommande() %></h4>
        

        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>Nom de Produit</th>
                    <th>Quantité</th>
                    <th>Prix</th>
                </tr>
            </thead>
            <tbody>
                <%! double total;%>
            	<%ProduitDAO produitDAO=new ProduitDAO();	

                Produit produit;
                    if (details != null && !details.isEmpty()) {
                    	total=0.0;
                        for (OrderDetails detail : details) {
                        	produit=produitDAO.getProduitById(detail.getProduitId());
                        	total+=detail.getPrixTotal();
                %>
                <tr>
                    <td><%= produit.getNom() %></td>
                    <td><%= detail.getQuantite() %></td>
                    <td><%= detail.getPrixTotal() %></td>
                </tr>
                
                <%
                        }%>
                   <tr>
                     <td colspan="2" style="background-color: lightgray"><b>TOTAL(DT)</b></td>
                   
                    <td colspan="1"  style="background-color:lightgray"><%=total %></td>
                  
                </tr>
                   <%  }else {
                %>
                 <tr>
                    <td colspan="3" class="text-center"></td>
                </tr>
            
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

<link rel="stylesheet" href="menucss.css">


<nav class="navbar navbar-expand-md navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a href="#" class="navbar-brand fw-bold">
            <i class="bi bi-person-circle me-2"></i>
                <%
                    String clientNom = (String) session.getAttribute("utilisateur_nom");
                
              
                %>
                <%= clientNom %>
                
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="Interface_Client.jsp" class="nav-link">Acceuil</a>
                </li>

                <li class="nav-item">
                    <a href="Panier.jsp" class="nav-link">Panier</a>
                </li>
                <li class="nav-item">
                    <a href="Historique.jsp" class="nav-link">Historique</a>
                </li>
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link">Se déconnecter</a>
                    
                </li>

            </ul>
        </div>
    </div>
</nav> 

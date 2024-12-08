<nav class="navbar navbar-expand-md navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a href="#" class="navbar-brand fw-bold">
            <i class="bi bi-person-circle me-2"></i>Interface Admin
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/admin/Gestion_Utilisateur" class="nav-link">Utilisateurs</a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/admin/Gestion_Produit" class="nav-link">Produits</a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/Gestion_Commande" class="nav-link">Commandes</a>
                </li>
                <li class="nav-item">
                    <a href="<%=request.getContextPath()%>/connexion.jsp" class="nav-link">Se déconnecter</a>
                </li>
            </ul>
        </div>
    </div>
</nav>



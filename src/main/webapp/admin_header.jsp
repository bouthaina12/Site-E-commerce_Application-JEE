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
                    <a href="<%=request.getContextPath()%>/admin/Gestion_Commande" class="nav-link">Commandes</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<style>
    /* En-tête professionnel */
    .navbar {
        background-color: #2C3E50; /* Couleur neutre professionnelle */
        border-bottom: 3px solid #3498DB; /* Ligne décorative */
    }

    .navbar-brand {
        font-size: 1.5rem;
        color: #ECF0F1; /* Couleur texte */
        text-transform: uppercase;
    }

    .navbar-brand:hover {
        color: #3498DB; /* Effet au survol */
        text-decoration: none;
    }

    .nav-link {
        color: #ECF0F1; /* Texte des liens */
        font-size: 1rem;
        margin-left: 15px;
        transition: all 0.3s ease;
    }

    .nav-link:hover {
        color: #3498DB; /* Couleur au survol */
        text-decoration: none;
    }

    .nav-link.active {
        font-weight: bold;
        color: #1ABC9C; /* Indicateur actif */
    }

    /* Mobile */
    .navbar-toggler {
        border-color: #ECF0F1;
    }

    .navbar-toggler-icon {
        background-color: #ECF0F1;
    }

    /* Ombre subtile */
    .shadow-sm {
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
</style>

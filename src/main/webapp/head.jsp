<link rel="stylesheet" href="design.css">

<nav class="navbar navbar-expand-md navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a href="#" class="navbar-brand fw-bold">
           <i class="bi bi-shop me-2"></i>Boutique en ligne
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link">Acceuil</a>
                </li>

            </ul>
        </div>
    </div>
</nav>
<style>
.navbar {
    background-color: rgb(0, 0, 0); /* Couleur neutre professionnelle */
    border-bottom: 3px solid #3498DB; /* Ligne décorative */
    height: 100px; /* Augmentation de la hauteur */
    display: flex;
    align-items: center; /* Centrer verticalement les éléments */
    padding: 30px;
}

/* Logo de la barre de navigation */
.navbar-brand {
    font-size: 1.5rem;
    color: #ECF0F1; /* Couleur texte */
    text-transform: uppercase;
}

/* Effet au survol */
.navbar-brand:hover {
    color: #3498DB;
    text-decoration: none;
}

/* Liens dans la barre de navigation */
.nav-link {
    color: #ECF0F1; /* Texte des liens */
    font-size: 1rem;
    margin-left: 15px;
    font-weight: bold; /* Texte en gras */
    transition: all 0.3s ease;
}

/* Effet au survol des liens */
.nav-link:hover {
    color: #3498DB; /* Couleur au survol */
    text-decoration: none;
}

/* Lien actif */
.nav-link.active {
    font-weight: bold; /* En gras pour le lien actif */
    color: #1ABC9C; /* Indicateur actif */
}

/* Bouton pour mobile */
.navbar-toggler {
    border-color: #ECF0F1;
}

/* Icône du toggler pour mobile */
.navbar-toggler-icon {
    background-color: #ECF0F1;
}

/* Ombre subtile */
.shadow-sm {
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}</style>
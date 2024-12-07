package boutique;


public class OrderDetails {
    private int id;              
    private int commandeId;       
    private int produitId;        
    private int quantite;        
    private Double  prixTotal; 

    // Constructeurs
    public OrderDetails() {
        // Constructeur par défaut
    }

    public OrderDetails(int id, int commandeId, int produitId, int quantite, Double prixTotal) {
        this.id = id;
        this.commandeId = commandeId;
        this.produitId = produitId;
        this.quantite = quantite;
        this.prixTotal = prixTotal;
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCommandeId() {
        return commandeId;
    }

    public void setCommandeId(int commandeId) {
        this.commandeId = commandeId;
    }

    public int getProduitId() {
        return produitId;
    }

    public void setProduitId(int produitId) {
        this.produitId = produitId;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        if (quantite <= 0) {
            throw new IllegalArgumentException("La quantité doit être supérieure à 0.");
        }
        this.quantite = quantite;
    }

    public Double getPrixTotal() {
        return prixTotal;
    }

	public void setPrixTotal(Double prixTotal) {
		this.prixTotal = prixTotal;
	}

  

   
}

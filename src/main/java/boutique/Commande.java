package boutique;

import java.security.Timestamp;

public class Commande {
    private int id;
    private int clientId;
    private java.sql.Timestamp dateCommande;
    private String statut;

    // Getters et Setters
    public int getId() {
        return id;
    }
 
	public void setId(int id) {
        this.id = id;
    }
    public int getClientId() {
        return clientId;
    }
    public void setClientId(int clientId) {
        this.clientId = clientId;
    }
    public java.sql.Timestamp getDateCommande() {
        return dateCommande;
    }
    public void setDateCommande(java.sql.Timestamp timestamp) {
        this.dateCommande = timestamp;
    }
    public String getStatut() {
        return statut;
    }
    public void setStatut(String statut) {
        this.statut = statut;
    }
}

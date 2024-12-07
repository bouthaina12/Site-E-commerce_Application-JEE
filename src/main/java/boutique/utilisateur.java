package boutique;

public class utilisateur {
	private int id;
    private String nom;
    private String email;
    private String mot_de_passe;
    private String role;
    private boolean isBlocked;

public utilisateur(int id, String nom, String email, String mot_de_passe,String role, boolean isBlocked) {
    this.id = id;
    this.nom = nom;
    this.email = email;
    this.mot_de_passe=mot_de_passe;
    this.role = role;
    this.isBlocked = isBlocked;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getNom() {
	return nom;
}

public void setNom(String nom) {
	this.nom = nom;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getMot_de_passe() {
	return mot_de_passe;
}

public void setMot_de_passe(String mot_de_passe) {
	this.mot_de_passe = mot_de_passe;
}

public String getRole() {
	return role;
}

public void setRole(String role) {
	this.role = role;
}

public boolean isBlocked() {
	return isBlocked;
}

public void setBlocked(boolean isBlocked) {
	this.isBlocked = isBlocked;
}}
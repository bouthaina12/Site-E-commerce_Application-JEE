package boutique;



import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProduitDAO {
	   // Méthode pour récupérer un produit par ID
    public Produit getProduitById(int produitId) {
        Produit produit = null;

        // Requête SQL pour sélectionner un produit par son ID
        String sql = "SELECT * FROM products WHERE id = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Définir l'ID du produit dans la requête préparée
            pstmt.setInt(1, produitId);

            // Exécuter la requête
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Créer un objet Produit avec les données récupérées
                    produit = new Produit();
                    produit.setId(rs.getInt("id"));
                    produit.setNom(rs.getString("nom"));
                    produit.setDescription(rs.getString("description"));
                    produit.setPrix(rs.getDouble("prix"));
                    produit.setImage(rs.getString("image"));
                    produit.setCategorie(rs.getString("categorie"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return produit;
    }
	   // Méthode pour récupérer les produits par catégorie
	   public List<Produit> getProduitsParCategorie(String category) {
		   String GET_PRODUCTS_BY_CATEGORY_QUERY ="SELECT * FROM products WHERE categorie = ? AND stock > 0";
	       List<Produit> productList = new ArrayList<>();
	      
	       try (Connection connection = DatabaseConnection.getConnection();
	            PreparedStatement stmt = connection.prepareStatement(GET_PRODUCTS_BY_CATEGORY_QUERY)) {
	          
	           stmt.setString(1, category);
	           try (ResultSet rs = stmt.executeQuery()) {
	               while (rs.next()) {
	                   int id = rs.getInt("id");
	                   String nom = rs.getString("nom");
	                   String description = rs.getString("description");
	                   double prix = rs.getDouble("prix");
	                   String image = rs.getString("image");
	                   int stock = rs.getInt("stock");
	                   String categorie = rs.getString("categorie");

	                   Produit product = new Produit(id, nom, description, prix, image,categorie,stock);
	                   productList.add(product);
	               }
	           }
	       } catch (SQLException e) {
	           e.printStackTrace();
	       }
	      
	       return productList;
	   }

    // Récupérer tous les produits
    public List<Produit> getAllProducts() {
        List<Produit> produits = new ArrayList<>();
        String query = "SELECT * FROM products";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Produit produit = new Produit(
                    rs.getInt("id"),
                    rs.getString("nom"),
                    rs.getString("description"),
                    rs.getDouble("prix"),
                    rs.getString("image"),
                    rs.getString("categorie"),
                    rs.getInt("stock")
                );
                produits.add(produit);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produits;
    }

    // Ajouter un produit
    public void addProduct(Produit produit) {
        String query = "INSERT INTO products (nom, description, prix, image, categorie, stock) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, produit.getNom());
            stmt.setString(2, produit.getDescription());
            stmt.setDouble(3, produit.getPrix());
            stmt.setString(4, produit.getImage());
            stmt.setString(5, produit.getCategorie());
            stmt.setInt(6, produit.getStock());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Mettre à jour un produit
    public void updateProduct(Produit produit) {
        String query = "UPDATE products SET nom = ?, description = ?, prix = ?,image=?, categorie = ?, stock = ? WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {

            stmt.setString(1, produit.getNom());
            stmt.setString(2, produit.getDescription());
            stmt.setDouble(3, produit.getPrix());
            stmt.setString(4, produit.getImage());
            stmt.setString(5, produit.getCategorie());
            stmt.setInt(6, produit.getStock());
            stmt.setInt(7, produit.getId());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Supprimer un produit
    public void deleteProduct(int id) {
        String query = "DELETE FROM products WHERE id = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
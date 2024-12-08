package boutique;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommandeDAO {
    private Connection connection;

    public CommandeDAO() throws SQLException {
        connection = DatabaseConnection.getConnection();
    }
    public int ajouterCommande(Commande commande) {
        String sql = "INSERT INTO orders (utilisateur_id, statut) VALUES (?, ?)";
        int generatedId = -1; // ID de la commande insérée

        try (
            PreparedStatement statement = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {

            // Paramètres pour l'insertion
            statement.setInt(1, commande.getClientId()); // utilisateur_id
            statement.setString(2, commande.getStatut()); // statut

            // Exécuter la requête
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        generatedId = generatedKeys.getInt(1); // Récupérer l'ID généré
                        System.out.println("Commande insérée avec succès avec ID : " + generatedId);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de l'insertion de la commande : " + e.getMessage());
        }

        return generatedId; // Retourner l'ID généré
    }


    // Récupérer toutes les commandes
    public List<Commande> getAllCommandesEncours() {
        List<Commande> commandes = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders where statut='en cours'";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Commande commande = new Commande();
                commande.setId(rs.getInt("id"));
                commande.setClientId(rs.getInt("utilisateur_id"));
                commande.setDateCommande(rs.getTimestamp("date"));
                commande.setStatut(rs.getString("statut"));
                commandes.add(commande);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commandes;
    }

    // Récupérer toutes les commandes
    public List<Commande> getAllCommandes(int clientid) {
        List<Commande> commandes = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders where utilisateur_id=?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, clientid);

            ResultSet rs = statement.executeQuery();


            while (rs.next()) {
                Commande commande = new Commande();
                commande.setId(rs.getInt("id"));
                commande.setClientId(rs.getInt("utilisateur_id"));
                commande.setDateCommande(rs.getTimestamp("date"));
                commande.setStatut(rs.getString("statut"));
                commandes.add(commande);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commandes;
    }
    // Mettre à jour le statut d'une commande
    public void updateCommandeStatus(int commandeId, String newStatus) {
        try {
            String query = "UPDATE orders SET statut = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, newStatus);
            statement.setInt(2, commandeId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Commande getCommandeById(int Id) {
        Commande commande = new Commande();
        String query = "SELECT * FROM orders WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, Id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                commande.setId(rs.getInt("id"));
                commande.setClientId(rs.getInt("utilisateur_id"));
                commande.setDateCommande(rs.getTimestamp("date"));
                commande.setStatut(rs.getString("statut"));
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commande;
    }
    
    public void ajouterOrderDetail(OrderDetails detail) throws SQLException {
        String sql = "INSERT INTO order_details (commande_id, produit_id, quantite, prix_total) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, detail.getCommandeId());
            pstmt.setInt(2, detail.getProduitId());
            pstmt.setInt(3, detail.getQuantite());
            pstmt.setDouble(4, detail.getPrixTotal());

            pstmt.executeUpdate();
        }
    }
    public List<OrderDetails> getOrderDetailsByCommandeId(int commandeId) {
        List<OrderDetails> details = new ArrayList<>();
        String query = "SELECT * FROM order_details WHERE commande_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, commandeId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                details.add(new OrderDetails(
                    rs.getInt("id"),
                    rs.getInt("commande_id"),
                    rs.getInt("produit_id"),
                    rs.getInt("quantite"),
                    rs.getDouble("prix_total")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return details;
    }
}


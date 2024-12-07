package boutique;

import java.sql.Connection;
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
    public List<Commande> getAllCommandesEncours1() {
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

    public Commande getCommandeById(int commandeId) {
        Commande commande = new Commande();
        String query = "SELECT * FROM orders WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, commandeId);
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


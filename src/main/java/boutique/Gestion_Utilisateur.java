package boutique;

import java.beans.Statement;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Gestion_Utilisateur
 */@WebServlet("/admin/Gestion_Utilisateur")
 public class Gestion_Utilisateur extends HttpServlet {
		
		private static final long serialVersionUID = 1L;
		
		//récuperer la liste des utilisateurs
		private List<utilisateur> getUsersFromDatabase() {
		    List<utilisateur> utilisateurs = new ArrayList<>();
		    String query = "SELECT id, nom, email, mot_de_passe, role, is_blocked FROM utilisateurs";
		   
		    try (Connection connection = DatabaseConnection.getConnection();
		         PreparedStatement stmt = connection.prepareStatement(query)) {
		        ResultSet rs = stmt.executeQuery();
		       
		        while (rs.next()) {
		            utilisateur utilisateur = new utilisateur(
		                rs.getInt("id"),
		                rs.getString("nom"),
		                rs.getString("email"),
		                rs.getString("mot_de_passe"),
		                rs.getString("role"),
		                rs.getBoolean("is_blocked")
		            );
		            utilisateurs.add(utilisateur);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return utilisateurs;
		}
		
	   public Gestion_Utilisateur() {
	       super();
	   }
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// Fetch all users using the new method
		    List<utilisateur> utilisateurs = getUsersFromDatabase();
		   
		    if (utilisateurs.isEmpty()) {
		        System.out.println("No users found in the database.");
		    } else {
		        System.out.println("Users found: " + utilisateurs.size());
		    }
		    request.setAttribute("utilisateurs", utilisateurs);
		    // Forward to JSP
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/Gestion_Utilisateur.jsp");
		    dispatcher.forward(request, response);
		}
		/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    String action = request.getParameter("action"); // Action: block, unblock, delete
		    int Id = Integer.parseInt(request.getParameter("Id"));
		   
		    String query = null;
		    // Determine action
		    if ("delete".equalsIgnoreCase(action)) {
		        query = "DELETE FROM utilisateurs WHERE id = ?";
		    } else if ("block".equalsIgnoreCase(action)) {
		        query = "UPDATE utilisateurs SET is_blocked = TRUE WHERE id = ?";
		    } else if ("unblock".equalsIgnoreCase(action)) {
		        query = "UPDATE utilisateurs SET is_blocked = FALSE WHERE id = ?";
		    }
		    try (Connection connection = DatabaseConnection.getConnection();
		         PreparedStatement statement = connection.prepareStatement(query)) {
		        statement.setInt(1, Id);
		        statement.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    // Fetch the updated list of users and set it as a request attribute
		    List<utilisateur> utilisateurs = getUsersFromDatabase();
		    request.setAttribute("utilisateurs", utilisateurs);
		    // Forward the request to the same page (JSP) with the updated list
		    RequestDispatcher dispatcher = request.getRequestDispatcher("/Gestion_Utilisateur.jsp");
		    dispatcher.forward(request, response);
		}
	}

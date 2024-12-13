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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/admin/Gestion_Produit")
@MultipartConfig // Pour gérer l'upload de fichiers
public class Gestion_Produit extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private  ProduitDAO produitDAO = new ProduitDAO();

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
      
      
	  String action = request.getParameter("action");
      List<Produit> produits = produitDAO.getAllProducts();
      request.setAttribute("Produits", produits);
     if(action!=null) {
    	 int id = Integer.parseInt(request.getParameter("id"));
         Produit produit = null;

         // Rechercher le produit par ID
         for (Produit p : produits) {
             if (p.getId() == id) {
                 produit = p;
                 break;
             }
         }
     
      if ("edit".equalsIgnoreCase(action)) {
          

              request.setAttribute("produit", produit);
              RequestDispatcher dispatcher = request.getRequestDispatcher("/Modifier_Produit.jsp");
              dispatcher.forward(request, response);
              return; 
          
      }
      if ("detail".equalsIgnoreCase(action)) {
          

          request.setAttribute("produit", produit);
          RequestDispatcher dispatcher = request.getRequestDispatcher("/Detail_Produit.jsp");
          dispatcher.forward(request, response);
          return; 
      
  }}
      RequestDispatcher dispatcher = request.getRequestDispatcher("/Gestion_Produits.jsp");
      dispatcher.forward(request, response);
  }
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String action = request.getParameter("action");

      if ("add".equalsIgnoreCase(action)) {
          addProduct(request, response);
      } else if ("update".equalsIgnoreCase(action)) {
          updateProduct(request, response);

           }
      else if ("delete".equalsIgnoreCase(action)) {
          deleteProduct(request, response);
      } 
      List<Produit> produits = produitDAO.getAllProducts();

      request.setAttribute("Produits", produits);
      RequestDispatcher dispatcher = request.getRequestDispatcher("/Gestion_Produits.jsp");
      dispatcher.forward(request, response);
  }

  private void addProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      String nom = request.getParameter("nom");
      String description = request.getParameter("description");
      double prix = Double.parseDouble(request.getParameter("prix"));
      String categorie = request.getParameter("categorie");
      int stock = Integer.parseInt(request.getParameter("stock"));

      Part imagePart = request.getPart("image");
      String imageName = imagePart.getSubmittedFileName();
      String uploadPath = getServletContext().getRealPath("/uploads/");

      File uploadDir = new File(uploadPath);
      if (!uploadDir.exists()) {
          uploadDir.mkdirs();
      }
      imagePart.write(uploadPath + File.separator + imageName);

      Produit produit = new Produit(0, nom, description, prix, "uploads/" + imageName, categorie, stock);
      produitDAO.addProduct(produit);
   

  }

  private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      int id = Integer.parseInt(request.getParameter("id"));
      if (id <= 0) {
          throw new IllegalArgumentException("ID du produit invalide pour la modification");
      }
      else  {
    	  System.out.println(id);
      }
      String nom = request.getParameter("nom");
      String description = request.getParameter("description");
      double prix = Double.parseDouble(request.getParameter("prix"));
      String categorie = request.getParameter("categorie");
      int stock = Integer.parseInt(request.getParameter("stock"));
      // Récupérer l'ancienne URL de l'image
      String ancienneImage = request.getParameter("ancienne_image");

      // Vérifier si un nouveau fichier a été téléchargé
      Part imagePart = request.getPart("image");
      String imageName = imagePart.getSubmittedFileName();
      String imageUrl;

      if (imageName != null && !imageName.isEmpty()) {
          // Un nouveau fichier a été téléchargé
          String uploadPath = getServletContext().getRealPath("/uploads/");
          File uploadDir = new File(uploadPath);
          if (!uploadDir.exists()) {
              uploadDir.mkdirs();
          }
          imagePart.write(uploadPath + File.separator + imageName);
          imageUrl = "uploads/" + imageName;
      } else {
          // Aucun nouveau fichier téléchargé, utiliser l'ancienne URL
          imageUrl = ancienneImage;
      }
      Produit produit = new Produit(id, nom, description, prix,imageUrl, categorie, stock);
      produitDAO.updateProduct(produit);

      
  }

  private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
      int id = Integer.parseInt(request.getParameter("id"));
      produitDAO.deleteProduct(id);


  }}

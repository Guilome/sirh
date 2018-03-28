package dev.sgp.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditerCollaborateurController
 */
public class EditerCollaborateurController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String errorMsg = "";
		if (matricule == null || titre == null || prenom == null || nom == null) {
			if(matricule == null){
				errorMsg = "matricule";
			}
			if(titre == null){
				errorMsg += ", titre";
			}
			if( prenom == null){
				errorMsg += ", prenom";
				
			}
			if(nom == null){
				errorMsg += ", nom";
			}
			errorMsg += " non présent";
			resp.sendError(400, errorMsg);
		}
		else{		
			resp.setStatus(201);
			resp.setContentType("text/html");
			// code HTML ecrit dans le corps de la reponse
			resp.getWriter().write("<h1>Edition de collaborateur</h1>"
			+"<p>matricule="+matricule+",titre="+titre+",nom="+nom+",prenom="+prenom+"</p>");
		}
	}
}

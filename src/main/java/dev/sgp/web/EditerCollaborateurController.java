package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

/**
 * Servlet implementation class EditerCollaborateurController
 */
public class EditerCollaborateurController extends HttpServlet {
	

	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private List<Departement> departements = new DepartementService().listerDepartements(); 

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Collaborateur collabEditer = null;
		List<Collaborateur> listeCollaborateurs = collabService.listerCollaborateurs();
		for (Collaborateur collaborateur : listeCollaborateurs) {
			if (collaborateur.getMatricule() == request.getAttribute("collaEdit")) {
				collabEditer = collaborateur;
			}
		}
		request.setAttribute("colladEditer", collabEditer);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateur.jsp");
		dispatcher.forward(request, response);
	}
}

package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
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
 * Servlet implementation class CreerCollaborateurController
 */
public class CreerCollaborateurController extends HttpServlet {

	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private Integer compteur = 0;
	private List<Departement> departements = new DepartementService().listerDepartements(); 

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/collab/creerCollaborateur.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Collaborateur collaborateur = new Collaborateur();
		ZonedDateTime dateCrea = ZonedDateTime.now();
		String nom = request.getParameter("inputNom");
		String prenom = request.getParameter("inputPrenom");
		String dateStr = request.getParameter("inputNaissance");
		String adresse = request.getParameter("inputAddresse");
		String numSecSoc = request.getParameter("inputNumSociale");
		String error = "";
		if (nom == ""){
			error += "Le nom";
			compteur ++;
		}
		if (prenom == ""){
			if (compteur >= 1) {
				error += ", le prenom";				
			}else{
				error += "Le prenom";
			}
			compteur ++;
		}
		if( dateStr == "" ){
			if (compteur >= 1) {
				error += ", la date";				
			}else{
				error += "La date";
			}
			compteur ++;
		}
		if( adresse == "" ){
			if (compteur >= 1) {
				error += ", l'adresse";				
			}else{
				error += "L'adresse";
			}
			compteur ++;
		}
		if (numSecSoc == "" || numSecSoc.length() != 15){
			if (compteur >= 1) {
				error += ", le numero de sécurité sociale";				
			}else{
				error += "Le numero de sécurité sociale";
			}
			compteur ++;
		}else {
			collaborateur.setNom(nom);
			collaborateur.setPrenom(prenom);	
			LocalDate date = LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			collaborateur.setDateDeNaissance(date);
			collaborateur.setAdresse(adresse);
			collaborateur.setNumeroSecuriteSociale(numSecSoc);	
			// Information generer de manière automatique
			collaborateur.setActif(true);
			collaborateur.setPhoto("/image/logo.jpg");
			collaborateur.setMailPro(prenom + "." + nom + "@societe.com");
			collaborateur.setDateHeureCreation(dateCrea);

			collabService.sauvegarderCollaborateur(collaborateur);
			request.setAttribute("collaborateurs", collabService);
			request.setAttribute("departements",departements);
			RequestDispatcher redirect = this.getServletContext().getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp");
			redirect.forward(request, response);
		}
		if (compteur > 1) {
			error += " sont incorrect";
		} else{
			error += " est incorrect";
		}
		response.sendError(400, error);
	}
}

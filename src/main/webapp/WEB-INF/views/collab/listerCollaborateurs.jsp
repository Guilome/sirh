<%@page language="java" pageEncoding="UTF-8"%>
<%@ page import = "dev.sgp.entite.Collaborateur,dev.sgp.service.CollaborateurService,java.util.List,dev.sgp.entite.Departement"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>SPG</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/lumen/bootstrap.min.css" rel="stylesheet" integrity="sha384-0LGTKb8NPx8fBKaojW3qF+Qo2Yhhs/mBrVHMYjPV8V/o4ZAmZ1cpGI2OeQab16T2" crossorigin="anonymous">
  </head>
  <body>
    <div class="container-fluid">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="index.jsp"><img src="<%=request.getContextPath()%>/image/logo.png" class="rounded"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="lister">Collaborateurs <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="statistiques.html">Statistiques</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="activites.html">Activités</a>
            </li>
          </ul>
        </div>
      </nav>
      <div class="row justify-content-end mt-2 p-2">
        <div class=".col-auto">
          <a href='creer'><button type="submit" class="btn btn-primary">Ajouter un nouveau collaborateur</button></a>
        </div>
      </div>
      <header>
        <h1>Les collaborateurs</h1>
      </header>
      <section>
        <div class="row">
          <div class="col-3">
            <label for="textRecherche">Rechercher un nom ou un prénom  qui commence par : </label>
          </div>
          <div class="col-3">
            <div class="input-group">
              <input type="text" class="form-control" id="textRecherche" aria-describedby="inputGroup-sizing-default">
            </div>
          </div>
          <div class="col-3">
            <button type="submit" class="btn btn-primary">Rechercher</button>
          </div>
          <div class="col-3">
            <div class="form-group">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">Voir les collaborateurs désactivés</label>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
        	<label class="col-3" for="">Filtrer par département :</label>
			<div class="col-5 input-group">
  				<select class="custom-select" id="inputGroupSelect04">
			    <option selected>Tous</option>
  				<%
            	List<Departement> departements = (List<Departement>)request.getAttribute("departements");
        		for(Departement departement : departements){
				%>
    			<option value="<%=departement.getId()%>"><%=departement.getNom()%></option>
    			<% } %>
  				</select>
  				<div class="input-group-append">
    				<button class="btn btn-outline-primary" type="submit">Selectionner</button>
  				</div>
			</div>
          </div>
      </section>
      <section>
        <div class="row">
			<%
			CollaborateurService collabs = (CollaborateurService)request.getAttribute("collaborateurs");
			List<Collaborateur> collaborateurs = collabs.listerCollaborateurs();
			for(Collaborateur collaborateur : collaborateurs){
			%>
			    <div class="col-lg-4 col-sm-12 col-md-6">
			      <h4><label><%= collaborateur.getNom()%></label> <label><%= collaborateur.getPrenom()%></label></h4>
			      <div class="media">
			        <img class="align-self-start mr-3" src="<%=request.getContextPath()%><%=collaborateur.getPhoto()%>" alt="Generic placeholder image">
			        <div class="media-body">
			          <label>Matricule : </label><label> <%=collaborateur.getMatricule()%></label><br/>
			          <label>Adresse : </label><label> <%=collaborateur.getAdresse()%></label><br/>
			          <label>Email : </label><label> <%=collaborateur.getMailPro()%></label><br/>
			          <label>Securité Sociale : </label><label> <%=collaborateur.getNumeroSecuriteSociale()%></label><br/>
			          <a href="editer?matricule=<%= collaborateur.getMatricule()%>" class="btn btn-primary">Éditer</a>
			        </div>
			      </div>
			<%
			}			
			%>
        </div>
      </section>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>

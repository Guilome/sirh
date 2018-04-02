<%@page language="java" pageEncoding="UTF-8"%>
<%@ page import = "dev.sgp.entite.Collaborateur,dev.sgp.service.CollaborateurService,java.util.List,dev.sgp.entite.Departement,java.time.LocalDate"%>
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
	    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="lister"><img src="<%=request.getContextPath()%>/image/logo.png" class="rounded"></a>
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
    <div class="container-fluid">
    <%
		Collaborateur editCollab = (Collaborateur)request.getAttribute("colladEditer");
    %>
      <div class="row justify-content-end mt-2 p-2">
        <div class=".col-auto">
          <a href='lister'><button type="submit" class="btn btn-primary">Liste des collaborateurs</button></a>
        </div>
      </div>
      <div class="row justify-content-center mt-2 pt-5">
        <div class="col-lg-4  col-md-3">
          <img src="<%=request.getContextPath()%><%=editCollab.getPhoto()%>" class="img-fluid" alt="Responsive image">
        </div>
        <div class="col-lg-4 col-md-3">
          <form>
            <div class="row">
              <h1><label><%= editCollab.getNom()%></label> <label><%= editCollab.getPrenom()%></label> - <label><%= editCollab.getMatricule()%></label></h1>
              <div class="form-group ml-5 pt-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="gridCheck">
                  <label class="form-check-label" for="gridCheck">Désactiver</label>
                </div>
              </div>
            </div>
            <div id="accordion">
              <div class="card">
                <div class="card-header" id="headingOne">
                  <h5 class="mb-0">
                    <button class="btn btn-link collapsed"  type="button" data-toggle="collapse" data-target="#idenite" aria-expanded="false" aria-controls="idenite">
                      Identité
                    </button>
                  </h5>
                </div>
                <div id="idenite" class="collapse" aria-labelledby="headingOne" data-parent="#accordion">
                  <div class="card-body">
                    <!-- Civilité -->
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <label class="input-group-text" for="inputCivilité">Civilité</label>
                      </div>
                      <select class="custom-select" id="inputCivilité">
                        <option selected disabled hidden></option>
                        <option value="1">Monsieur</option>
                        <option value="2">Madame</option>
                      </select>
                    </div>
                    <!-- Nom/Prénom -->
                    <div class="form-row">
                      <div class="form-group col-md-6">
                        <label for="inputNom">Nom</label>
                        <input type="text" class="form-control" id="inputNom" placeholder="Nom" readonly="readonly" value="<%= editCollab.getNom()%>">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="inputPrenom">Prénom</label>
                        <input type="text" class="form-control" id="inputPrenom" placeholder="Prénom" readonly="readonly" value="<%= editCollab.getPrenom()%>">
                      </div>
                    </div>
                    <!-- Date de Naissance -->
                    <div class="form-group">
                      <label for="inputNaissance">Date de naissance</label>
                      <input type="date" class="form-control" id="inputNaissance" placeholder="" readonly="readonly" value="<%= editCollab.getDateDeNaissance()%>">
                    </div>
                    <!-- Adresse -->
                    <div class="form-group">
                      <label for="inputAddresse">Adresse</label>
                      <input type="text" class="form-control" id="inputAddresse" placeholder="" readonly="readonly" value="<%= editCollab.getAdresse()%>">
                    </div>
                    <!-- Numéro de sécurité sociale -->
                    <div class="form-group">
                      <label for="inputNumSociale">Numéro de sécurité sociale</label>
                      <input type="text" class="form-control" id="inputNumSociale" readonly="readonly" value="<%= editCollab.getNumeroSecuriteSociale()%>">
                    </div>
                    <!-- Téléphone -->
                    <div class="form-group">
                      <label for="inputNaissance">Téléphone</label>
                      <input type="tel" class="form-control" id="inputTelephone" placeholder="">
                    </div>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header" id="headingTwo">
                  <h5 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#departement" aria-expanded="false" aria-controls="collapseThree">
                      Poste
                    </button>
                  </h5>
                </div>
                <div id="departement" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                  <div class="card-body">
                    <!-- Département -->
                    <label class="col-5" for="">Filtrer par département :</label>
					<div class="col-8 input-group">
  						<select class="custom-select" id="inputGroupSelect04">
  						<%
            			List<Departement> departements = (List<Departement>)request.getAttribute("listerDepartement");
        				for(Departement departement : departements){
						%>
    					<option value="<%=departement.getId()%>"><%=departement.getNom()%></option>
    					<% } %>
  						</select>
  						<div class="input-group-append">
    						<button class="btn btn-outline-primary" type="submit">Selectionner</button>
  						</div>
					</div>
                    <!-- Nom du poste -->
                    <div class="form-group">
                      <label for="inputNom">Nom du poste</label>
                      <input type="text" class="form-control" id="inputNomPoste" placeholder="Nom Poste">

                    </div>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header" id="headingThree">
                  <h5 class="mb-0">
                    <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#coordoneeBanque" aria-expanded="false" aria-controls="collapseThree">
                      Coordonées Bancaire
                    </button>
                  </h5>
                </div>
                <div id="coordoneeBanque" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                  <div class="card-body">
                    <!-- IBAN -->
                    <div class="form-group">
                      <label for="inputNom">IBAN</label>
                      <input type="text" class="form-control" id="inputIBAN" placeholder="IBAN">

                    </div>
                    <!-- BIC -->
                    <div class="form-group">
                      <label for="inputNom">BIC</label>
                      <input type="text" class="form-control" id="inputBIC" placeholder="BIC">

                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row justify-content-end mt-2 p-1">
              <div class=".col-auto">
                <button type="button" class="btn btn-primary">Sauvegarder</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
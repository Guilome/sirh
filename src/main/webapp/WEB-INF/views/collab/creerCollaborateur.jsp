<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import = "dev.sgp.entite.Collaborateur"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title></title>
    <link href="https://maxcdn.bootstrapcdn.com/bootswatch/4.0.0/lumen/bootstrap.min.css" rel="stylesheet" integrity="sha384-0LGTKb8NPx8fBKaojW3qF+Qo2Yhhs/mBrVHMYjPV8V/o4ZAmZ1cpGI2OeQab16T2" crossorigin="anonymous">
  </head>
  <body onload="setModal(),setDonnee()">
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
    <div class="container-fluid">
      <div class="row justify-content-end mt-2 p-2">
        <div class=".col-auto">
          <a href='lister'><button type="submit" class="btn btn-primary">Liste des collaborateurs</button></a>
        </div>
      </div>
      <header>
        <h1>Nouveau Collaborateur</h1>
      </header>
      <form method="POST" action="<%=request.getContextPath()%>/collaborateurs/creer">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputNom">Nom</label>
            <input type="text" class="form-control" name="inputNom" id="inputNom" placeholder="Nom">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPrenom">Prénom</label>
            <input type="text" class="form-control" name="inputPrenom" id="inputPrenom" placeholder="Prénom">
          </div>
        </div>
        <div class="form-group">
          <label for="inputNaissance">Date de naissance</label>
          <input type="date" class="form-control" name="inputNaissance" id="inputNaissance" placeholder="">
        </div>
        <div class="form-group">
          <label for="inputAddresse">Adresse</label>
          <input type="text" class="form-control" name="inputAddresse" id="inputAddresse" placeholder="">
        </div>
        <div class="form-group">
          <label for="inputNumSociale">Numéro de sécurité sociale</label>
          <input type="number" class="form-control" name="inputNumSociale" id="inputNumSociale">
        </div>
      </div>
      <button type="button" name="creation" id="creation"class="btn btn-primary p-2" data-toggle="modal" data-target="#exampleModal">
        Créer
      </button>

      <!-- Modal -->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Création d'un nouveau collaborateur</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
			  <p>Vous êtes sur le point de creer un nouveau collaborateur</p>
              <p>Nom : <label id='nom'/></p>
              <p>Prénom : <label id='prenom'/></p>
              <p>Date de naissance : <label id='date'/></p>
              <p>Adresse : <label id='adresse'/></p>
              <p>Numéro de Sécurité sociale : <label id='numero'/></p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
              <button type="submit" class="btn btn-success" id="validation" data-dismiss="modal" onclick="validerForm()">Valider</button>
            </div>
          </div>
        </div>
      </div>
    </form>
    <script type="text/javascript">
    function validerForm() {
    	document.forms[0].submit();	
    }
    </script>
    <script src="<%=request.getContextPath()%>/js/modal.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
  </body>
</html>
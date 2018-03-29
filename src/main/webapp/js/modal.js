function setModal(){
  document.querySelector('#creation').addEventListener('click', function(evt){
  document.getElementById('nom').innerText = document.querySelector("#inputNom").value;
  document.getElementById('prenom').innerText = document.querySelector("#inputPrenom").value;
  document.getElementById('date').innerText = document.querySelector("#inputNaissance").value;
  document.getElementById('adresse').innerText = document.querySelector("#inputAddresse").value;
  document.getElementById('numero').innerText = document.querySelector("#inputNumSociale").value;
  })
}

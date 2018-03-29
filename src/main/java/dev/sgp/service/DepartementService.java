/**
 * 
 */
package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;
import dev.sgp.entite.Departement;

/**
 * @author GOBERT Guillaume
 *
 */
public class DepartementService {
	
	List<Departement> listeDepartements = new ArrayList<>();
	
	public List<Departement> listerDepartements() {
		listeDepartements.add(new Departement(1,"Comptabilite"));
		listeDepartements.add(new Departement(2,"Ressources Humaines"));
		listeDepartements.add(new Departement(3,"Informatique"));
		listeDepartements.add(new Departement(4,"Administratif"));		
		return listeDepartements;
	}
}

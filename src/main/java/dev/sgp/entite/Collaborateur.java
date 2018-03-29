/**
 * 
 */
package dev.sgp.entite;

import java.time.LocalDate;
import java.time.ZonedDateTime;

/**
 * @author GOBERT Guillaume
 *
 */
public class Collaborateur {
	
	private static Integer compteur = 0;
	private Integer matricule;
	private String nom;
	private String prenom;
	private LocalDate dateDeNaissance;
	private String adresse;
	private String numeroSecuriteSociale;
	private String mailPro;
	private String photo;	
	private ZonedDateTime dateHeureCreation;
	private Boolean actif;
	private String intitulePoste;
	private Departement departement;
	private String banque;
	private String iban;
	private String bic;
	
	/**
	 * Constructeur
	 */
	public Collaborateur() {
		this.setMatricule(compteur);
		compteur++;
	}

	/** Getter
	 * @return the matricule
	 */
	public Integer getMatricule() {
		return matricule;
	}

	/** Setter
	 * @param matricule the matricule to set
	 */
	public void setMatricule(Integer matricule) {
		this.matricule = matricule;
	}

	/** Getter
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}

	/** Setter
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}

	/** Getter
	 * @return the prenom
	 */
	public String getPrenom() {
		return prenom;
	}

	/** Setter
	 * @param prenom the prenom to set
	 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	/** Getter
	 * @return the dateDeNaissance
	 */
	public LocalDate getDateDeNaissance() {
		return dateDeNaissance;
	}

	/** Setter
	 * @param dateDeNaissance the dateDeNaissance to set
	 */
	public void setDateDeNaissance(LocalDate dateDeNaissance) {
		this.dateDeNaissance = dateDeNaissance;
	}

	/** Getter
	 * @return the adresse
	 */
	public String getAdresse() {
		return adresse;
	}

	/** Setter
	 * @param adresse the adresse to set
	 */
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	/** Getter
	 * @return the numeroSecuriteSociale
	 */
	public String getNumeroSecuriteSociale() {
		return numeroSecuriteSociale;
	}

	/** Setter
	 * @param numeroSecuriteSociale the numeroSecuriteSociale to set
	 */
	public void setNumeroSecuriteSociale(String numeroSecuriteSociale) {
		this.numeroSecuriteSociale = numeroSecuriteSociale;
	}

	/** Getter
	 * @return the mailPro
	 */
	public String getMailPro() {
		return mailPro;
	}

	/** Setter
	 * @param mailPro the mailPro to set
	 */
	public void setMailPro(String mailPro) {
		this.mailPro = mailPro;
	}

	/** Getter
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}

	/** Setter
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}

	/** Getter
	 * @return the dateHeureCréation
	 */
	public ZonedDateTime getDateHeureCréation() {
		return dateHeureCreation;
	}

	/** Setter
	 * @param dateHeureCréation the dateHeureCréation to set
	 */
	public void setDateHeureCreation(ZonedDateTime dateHeureCréation) {
		this.dateHeureCreation = dateHeureCréation;
	}

	/** Getter
	 * @return the actif
	 */
	public Boolean getActif() {
		return actif;
	}

	/** Setter
	 * @param actif the actif to set
	 */
	public void setActif(Boolean actif) {
		this.actif = actif;
	}

	/** Getter
	 * @return the intitulePoste
	 */
	public String getIntitulePoste() {
		return intitulePoste;
	}

	/** Setter
	 * @param intitulePoste the intitulePoste to set
	 */
	public void setIntitulePoste(String intitulePoste) {
		this.intitulePoste = intitulePoste;
	}

	/** Getter
	 * @return the departement
	 */
	public Departement getDepartement() {
		return departement;
	}

	/** Setter
	 * @param departement the departement to set
	 */
	public void setDepartement(Departement departement) {
		this.departement = departement;
	}

	/** Getter
	 * @return the banque
	 */
	public String getBanque() {
		return banque;
	}

	/** Setter
	 * @param banque the banque to set
	 */
	public void setBanque(String banque) {
		this.banque = banque;
	}

	/** Getter
	 * @return the iban
	 */
	public String getIban() {
		return iban;
	}

	/** Setter
	 * @param iban the iban to set
	 */
	public void setIban(String iban) {
		this.iban = iban;
	}

	/** Getter
	 * @return the bic
	 */
	public String getBic() {
		return bic;
	}

	/** Setter
	 * @param bic the bic to set
	 */
	public void setBic(String bic) {
		this.bic = bic;
	}
	
	
}


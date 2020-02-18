package rm.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "komentarai")
public class Komentarai {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
private int komentaro_id;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "patiekalo_id")
	private Patiekalai patiekalas;
	private String komentaras;
	private String userName;
	private String date;
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private int ivertinimas;
	public int getKomentaro_id() {
		return komentaro_id;
	}
	public void setKomentaro_id(int komentaro_id) {
		this.komentaro_id = komentaro_id;
	}
	public Patiekalai getPatiekalas() {
		return patiekalas;
	}
	public void setPatiekalas(Patiekalai patiekalas) {
		this.patiekalas = patiekalas;
	}
	public String getKomentaras() {
		return komentaras;
	}
	public void setKomentaras(String komentaras) {
		this.komentaras = komentaras;
	}
	public int getIvertinimas() {
		return ivertinimas;
	}
	public void setIvertinimas(int ivertinimas) {
		this.ivertinimas = ivertinimas;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}

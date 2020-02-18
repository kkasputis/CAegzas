package rm.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name = "patiekalai")
public class Patiekalai {
	
	@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String pavadinimas;
	private String aprasymas;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "patiekalas", orphanRemoval = false)
	private List<Komentarai> komentarai = new ArrayList<>();
	
	@Transient
	private MultipartFile image;
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPavadinimas() {
		return pavadinimas;
	}
	public void setPavadinimas(String pavadinimas) {
		this.pavadinimas = pavadinimas;
	}
	public String getAprasymas() {
		return aprasymas;
	}
	public void setAprasymas(String aprasymas) {
		this.aprasymas = aprasymas;
	}
	public List<Komentarai> getKomentarai() {
		return komentarai;
	}
	public void setKomentarai(List<Komentarai> komentarai) {
		this.komentarai = komentarai;
	}
	
}

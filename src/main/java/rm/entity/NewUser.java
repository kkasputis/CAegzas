package rm.entity;

import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

public class NewUser {
	private String username;
	private String password;
	@Transient
	private MultipartFile userImage;
	@Transient
	private String oldPassword;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public MultipartFile getUserImage() {
		return userImage;
	}
	public void setUserImage(MultipartFile userImage) {
		this.userImage = userImage;
	}
	public String getOldPassword() {
		return oldPassword;
	}
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

}

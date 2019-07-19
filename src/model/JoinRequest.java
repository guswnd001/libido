package model;

import java.sql.Timestamp;
import java.util.Map;

public class JoinRequest {

	private String name;
	private String birth;
	private String id;
	private String password;
	private String passwdCheck;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;
	private String address1;
	private String address2;
	private String zipcode;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswdCheck() {
		return passwdCheck;
	}

	public void setPasswdCheck(String passwdCheck) {
		this.passwdCheck = passwdCheck;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	
	
	//////////////////////////////////////////////////////////////////////////////////////////
	public boolean isPasswordEqualToConfirm() {
		return password != null && password.equals(passwdCheck);
	}
	
	private void checkEmpty(Map<String, Boolean> errors, String value, String fieldName) {
		if (value == null || value.isEmpty()) {
			errors.put(fieldName, Boolean.TRUE);
		}
	}
	
	public void validate(Map<String, Boolean> errors) {
		checkEmpty(errors, name, "name");
		checkEmpty(errors, birth, "birth");
		checkEmpty(errors, id, "id");
		checkEmpty(errors, password, "password");
		checkEmpty(errors, passwdCheck, "passwdCheck");
		checkEmpty(errors, email, "email");
		checkEmpty(errors, tel1, "tel1");
		checkEmpty(errors, tel2, "tel2");
		checkEmpty(errors, tel3, "tel3");
		
		if (!errors.containsKey("passwdCheck")) {
			if (!isPasswordEqualToConfirm()) {
				errors.put("notMatch", Boolean.TRUE);
			}
		}
	}
	//////////////////////////////////////////////////////////////////////////////////////////
	
}

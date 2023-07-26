package cn.techtutorial.model;

public class Comfirm {
private int cmid;
private String name;
private String email;
private String address;
private String phone;

public Comfirm() {

}

public Comfirm(int cmid, String name, String email, String address, String phone) {
	super();
	this.cmid = cmid;
	this.name = name;
	this.email = email;
	this.address = address;
	this.phone = phone;
}

public int getCmid() {
	return cmid;
}

public void setCmid(int cmid) {
	this.cmid = cmid;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

}

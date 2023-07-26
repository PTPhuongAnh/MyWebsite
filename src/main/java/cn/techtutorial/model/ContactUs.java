package cn.techtutorial.model;

public class ContactUs {
private int id;
private String email;
private String subject;
private String content;

public ContactUs() {
	super();
}

public ContactUs(int id, String email, String subject, String content) {
	super();
	this.id = id;
	this.email = email;
	this.subject = subject;
	this.content = content;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getSubject() {
	return subject;
}

public void setSubject(String subject) {
	this.subject = subject;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}


}

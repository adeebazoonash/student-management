package com.usermgmt.model;

import java.util.Date;

public class Report {
	private String firstName;
	
	private String lastName;
	
	private String email;
	
	private String activity;
	
	private Date date;
	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		if (activity.equalsIgnoreCase("ADDED_USER") || activity.equalsIgnoreCase("REGISTERED")) {
			activity = "ADDED OR REGISTERED";
		}
		this.activity = activity;
	}
	
	

}

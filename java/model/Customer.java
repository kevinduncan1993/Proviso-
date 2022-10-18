package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Customer {
	private int customerID;
	private String firstName;
	private String lastName;
	private String email;
	private String phoneNumber;
	
	public Customer(ResultSet data) throws SQLException{
		data.next();
		this.customerID = data.getInt(1);
		this.firstName = data.getString(2);
		this.lastName = data.getString(3);
		this.email = data.getString(4);
		this.phoneNumber = data.getString(6);
	}
	
	public int getCustomerID() {
		return this.customerID;
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public String getLastName() {
		return this.lastName;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public String getPhoneNumber() {
		return this.phoneNumber;
	}
}
	
	

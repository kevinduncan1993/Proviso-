package model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Location {
	private String address;
	private String city;
	private String state;
	private String zip;
	private String phone;
	
	
	public Location(DataManager dataManager, int locationID) throws SQLException{
		ResultSet rs = dataManager.getHotelResultSet(locationID);
		rs.next();
		this.address = rs.getString(1);
		this.city = rs.getString(2);
		this.state = rs.getString(3);
		this.zip = rs.getString(4);
		this.phone = rs.getString(5);
	}
	
	public String getAddress() {
		return this.address;
	}
	
	public String getCityStateZip() {
		return this.city + ", " + this.state + " " + this.zip;
	}
	
	public String getPhone() {
		return this.phone;
	}
}

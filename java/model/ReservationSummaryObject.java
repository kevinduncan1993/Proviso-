package model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReservationSummaryObject {
	private String firstName;
	private String lastName;
	private int reservationID;
	private Date check_in;
	private Date check_out;
	private int earnedPoints;
	private boolean canceled;
	private String roomType;
	private int amount;
	private int numberOfNights;
	
	public ReservationSummaryObject(ResultSet data) throws SQLException{
		data.next();		
		this.firstName = data.getString(1);
		this.lastName = data.getString(2);
		this.reservationID = data.getInt(3);
		this.check_in = data.getDate(4);
		this.check_out = data.getDate(5);
		this.earnedPoints = data.getInt(6);
		this.roomType = data.getString(7);
		this.amount = data.getInt(8);
	}
	
	public String getFirstName() {
		return this.firstName;
	}
	
	public String getLastName() {
		return this.lastName;
	}
	
	public int getReservationID() {
		return this.reservationID;
	}
	
	public Date getCheckIn() {
		return this.check_in;
	}
	
	public Date getCheckOut() {
		return this.check_out;
	}
	
	public int getEarnedPoints() {
		return this.earnedPoints;
	}
	
	public String getRoomType() {
		return this.roomType;
	}
	
	public int getAmount() {
		return this.amount;
	}
	
	public void setNumberOfNights(int nights) {
		this.numberOfNights = nights;
	}
	
	public int getNumberOfNights() {
		return this.numberOfNights;
	}
	
	public String getStayDatesString() {
		String result = getCheckInDayString();
		result += ", ";
		result += this.getCheckInMonthString() + " ";
		result += this.check_in.getDate() + ", ";
		result += (this.check_in.getYear() + 1900) + " - ";
		result += getCheckOutDayString() + ", ";
		result += this.getCheckOutMonthString() + " ";
		result += this.check_out.getDate() + ", ";
		result += (this.check_out.getYear() + 1900);
		return result;
	}
	
	private String getCheckInDayString() {
		switch (this.check_in.getDay()) {
		case 0:return "Sunday";
		case 1:	return "Monday";
		case 2:return "Tuesday";
		case 3: return "Wednesday";
		case 4: return "Thursday";
		case 5: return "Friday";
		case 6: return "Saturday";
		default: return "Error";
		}
	}
	
	private String getCheckInMonthString() {
		switch (this.check_in.getMonth()) {
		case 0:return "January";
		case 1:	return "February";
		case 2:return "March";
		case 3: return "April";
		case 4: return "May";
		case 5: return "June";
		case 6: return "July";
		case 7: return "August";
		case 8: return "September";
		case 9: return "October";
		case 10: return "November";
		case 11: return "December";
		default: return "Error";
		}
	}
	
	private String getCheckOutDayString() {
		switch (this.check_out.getDay()) {
		case 0:return "Sunday";
		case 1:	return "Monday";
		case 2:return "Tuesday";
		case 3: return "Wednesday";
		case 4: return "Thursday";
		case 5: return "Friday";
		case 6: return "Saturday";
		default: return "Error";
		}
	}
	
	private String getCheckOutMonthString() {
		switch (this.check_out.getMonth()) {
		case 0:return "January";
		case 1:	return "February";
		case 2:return "March";
		case 3: return "April";
		case 4: return "May";
		case 5: return "June";
		case 6: return "July";
		case 7: return "August";
		case 8: return "September";
		case 9: return "October";
		case 10: return "November";
		case 11: return "December";
		default: return "Error";
		}
	}
	
	public String getAmountString() {
		int dollars = this.getAmount() / 100;
		String cents = String.valueOf(this.getAmount() % 100);
		if (cents.length() == 1) { cents += "0";} //Always show two digits eg .10 rather than .1
		return "$" + dollars + "." + cents; 
	}
	
 }

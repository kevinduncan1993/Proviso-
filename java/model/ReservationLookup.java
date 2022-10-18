package model;

import java.sql.ResultSet;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReservationLookup {
	boolean validReservation = true;
	String hotel;
	String address;
	String city;
	String state;
	String zipCode;
	String phoneNumber;
	String firstName;
	String lastName;
	Date checkIn;
	Date checkOut;
	int guests;
	String room;
	ArrayList<Integer> features = new ArrayList<Integer>();
	String email;
	
		public ReservationLookup() {
			this.validReservation = false;
		}

		public ReservationLookup(ResultSet data, ResultSet features) throws SQLException {
			data.next();
			this.hotel = data.getString(1);
			this.address = data.getString(2);
			this.city = data.getString(3);
			this.state = data.getString(4);
			this.zipCode = data.getString(5);
			this.phoneNumber = data.getString(6);
			this.firstName = data.getString(7);
			this.lastName = data.getString(8);
			this.checkIn = data.getDate(9);
			this.checkOut = data.getDate(10);
			this.guests = data.getInt(11);
			this.room = data.getString(12);
			this.email = data.getString(13);
			while (features.next()) {
				this.features.add(features.getInt(1));
			}
			
		}
		
		public String getEmail() {
			return this.email;
		}
		
		public String getHotel() {
			return this.hotel;
		}
		
		public String getAddress() {
			return this.address;
		}
		
		public String getCityStateZip() {
			return this.city + ", " + this.state + " " + this.zipCode;
		}
		
		public String getPhoneNumber() {
			return this.phoneNumber;
		}
		
		public String getName() {
			return this.firstName + " " + this.lastName;
		}
		
		private String getCheckInDayString() {
			switch (this.checkIn.getDay()) {
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
			switch (this.checkIn.getMonth()) {
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
		
		public String getCheckIn() {
			return getCheckInDayString() + ", " + getCheckInMonthString() + " " + this.checkIn.getDate() + ", " + (this.checkIn.getYear() + 1900);
		}
		
		private String getCheckOutDayString() {
			switch (this.checkOut.getDay()) {
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
			switch (this.checkOut.getMonth()) {
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
		
		public String getCheckOut() {
			return getCheckOutDayString() + ", " + getCheckOutMonthString() + " " + this.checkOut.getDate() + ", " + (this.checkOut.getYear() + 1900);
		}
		
		public int getGuests() {
			return this.guests;
		}
		
		public String getRoom() {
			return this.room;
		}
		
		public String getWifi() {
			if (features.contains(1)) {
				return "YES";
			}
			else {return "NO";}
		}
		
		public String getBreakfast() {
			if (features.contains(2)) {
				return "YES";
			}
			else {return "NO";}
		}
		
		public String getParking() {
			if (features.contains(3)) {
				return "YES";
			}
			else {return "NO";}
		}
		
		public boolean isValid() {
			return this.validReservation;
		}
}

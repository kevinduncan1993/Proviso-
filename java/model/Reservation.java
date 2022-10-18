package model;

import java.sql.Date;
import java.time.LocalDate;

public class Reservation {
	private Date checkIn;
	private Date checkOut;
	private String location;
	private String roomType;
	private int guests;
	private String nameOnCard;
	private boolean wifi;
	private boolean breakfast;
	private boolean parking;
	private long cardNumber;
	private String exp;
	private int customerId;
	private int reservationID;
	
	public void setReservationID(int n) {
		this.reservationID = n;
	}
	
	public int getReservationID() {
		return this.reservationID;
	}
	
	public void setCheckIn(String checkIn) {
		this.checkIn = Date.valueOf(checkIn);
	}
	
	public Date getCheckIn() {
		return this.checkIn;
	}
	
	public void setCheckOut(String checkOut) {
		this.checkOut = Date.valueOf(checkOut);
	}
	
	public Date getCheckOut() {
		return this.checkOut;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String getLocation() {
		return this.location;
	}
	
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	
	public String getRoomType() {
		return this.roomType;
	}
	
	public void setGuests(int n) {
		this.guests = n;
	}
	
	public int getGuests() {
		return this.guests;
	}
	
	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}
	
	public String getNameOnCard() {
		return this.nameOnCard;
	}
	
	public void setWifi(String wifi) {
		if (wifi == null) {
			this.wifi = false;
		}
		else if (wifi.equals("on")) {
			this.wifi = true;
		}
		else {
			System.out.println("Error determining wifi status");
		}
	}
	
	public boolean getWifi() {
		return this.wifi;
	}
	
	public void setBreakfast(String breakfast) {
		if (breakfast == null) {
			this.breakfast = false;
		}
		else if (breakfast.equals("on")) {
			this.breakfast = true;
		}
		else {
			System.out.println("Error determining breakfast status");
		}
	}
	
	public boolean getBreakfast() {
		return this.breakfast;
	}
	
	public void setParking(String parking) {
		if (parking == null) {
			this.parking = false;
		}
		else if (parking.equals("on")) {
			this.parking = true;
		}
		else {
			System.out.println("Error determining parking status");
		}
	}
	
	public boolean getParking() {
		return this.parking;
	}
	
	public void setCardNumber(String cardNumber) {
		this.cardNumber = Long.valueOf(cardNumber);
	}
	
	public long getCardNumber() {
		return this.cardNumber;
	}
	
	public void setExp(String exp) {
		this.exp = exp;
	}
	
	public String getExp() {
		return this.exp;
	}
	
	public void setCustomerId(int customerID) {
		this.customerId = customerID;
	}
	
	public int getCustomerId() {
		return this.customerId;
	}
	
	public int getNightlyRate() {
		int nightlyRate;
		  switch (this.getRoomType()) {
		  case "Double": nightlyRate = 11550; break;
		  case "Queen":	nightlyRate = 13125; break;
		  case "Double Queen": nightlyRate = 15750; break;
		  case "King": nightlyRate = 17325; break;
		  default: 
			  System.out.println("Error getting room type nightly rate. Input was " + this.getRoomType());
			  nightlyRate = 0;
		  }
		  if (this.getBreakfast()) {
			  nightlyRate += 899;
		  }
		  if (this.getParking()) {
			  nightlyRate += 1999;
		  }
		 return nightlyRate;
	}
	
	public long getHolidaySurcharge() {
		int holidays = 0;
		LocalDate checkIn = this.checkIn.toLocalDate();
		LocalDate checkOut = this.checkOut.toLocalDate();
		while (checkIn.isBefore(checkOut)) {
			if ((checkIn.getDayOfMonth() == 4) && (checkIn.getMonthValue() == 7)) { //Fourth of July
				holidays += 1;
			}
			if ((checkIn.getDayOfMonth() == 24) && (checkIn.getMonthValue() == 12)) { //Christmas Eve
				holidays += 1;
			}
			if ((checkIn.getDayOfMonth() == 31) && (checkIn.getMonthValue() == 12)) { //New Years Eve
				holidays += 1;
			}
			checkIn = checkIn.plusDays(1);
		}
		int baseRate = 0;
		switch (this.getRoomType()) {
		  case "Double": baseRate = 11550; break;
		  case "Queen":	baseRate = 13125; break;
		  case "Double Queen": baseRate = 15750; break;
		  case "King": baseRate = 17325; break;
	}
		return Math.round(holidays * baseRate * .05);
	}
}

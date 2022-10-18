package model;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.ReservationSummaryObject;
import java.sql.PreparedStatement;
import java.sql.Date;
import model.Reservation;
import model.ReservationLookup;

public class DataManager {
	private String dbURL = "";
	private String dbUserName = "";
	private String dbPassword = "";
	private Connection conn = null;
	
	public void setDbURL(String dbURL) {
	    this.dbURL = dbURL;
	    }
	  public String getDbURL() {
	    return dbURL;
	    }

	  public void setDbUserName(String dbUserName) {
	    this.dbUserName = dbUserName;
	    }
	  public String getDbUserName() {
	    return dbUserName;
	    }

	  public void setDbPassword(String dbPassword) {
	    this.dbPassword = dbPassword;
	    }
	  public String getDbPassword() {
	    return dbPassword;
	    }
	  
	  public void setConnection() {
		  Connection conn = null;
		  try {
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  conn = DriverManager.getConnection(getDbURL(),getDbUserName(),getDbPassword());
		  }
		  catch (SQLException e) {
			  System.out.println("Could not connect to DB: " + e.getMessage());
		  }
		  catch (ClassNotFoundException e ) {
			  System.out.println("Class.forName failed");
		  }
		  this.conn = conn;
	  }
	  
	  public void insertHotel(String name, String address, String city, String state, String zipcode, String phoneNumber, int standardKings, int standardQueens, int doubleQueens, int doubleFulls) {
		  try {
			  PreparedStatement stmt;
			  stmt = this.conn.prepareStatement("INSERT INTO hotels (name, address, city, state, zip_code, phone_number, standard_kings, standard_queens, double_queens, double_fulls) VALUES (?, ?, ?, ?, ?, ?, ?,? , ?, ?)");
			  stmt.setString(1, name);
			  stmt.setString(2, address);
			  stmt.setString(3, city);
			  stmt.setString(4, state);
			  stmt.setString(5, zipcode);
			  stmt.setString(6, phoneNumber);
			  stmt.setInt(7, standardKings);
			  stmt.setInt(8, standardQueens);
			  stmt.setInt(9, doubleQueens);
			  stmt.setInt(10, doubleFulls);
			  System.out.println(stmt);
			  stmt.executeUpdate();
		  }
		  catch (SQLException e) {
			  System.out.println("insert failed");
		  }
	  }
	  
	  public byte[] hash(String string) {
		  try {
			  //The following was copied from: https://www.baeldung.com/sha-256-hashing-java
			  MessageDigest digest = MessageDigest.getInstance("SHA3-256");
			  byte[] hashbytes = digest.digest(string.getBytes(StandardCharsets.UTF_8));
			  return hashbytes;
		  } catch (Exception e) {
			  //No exception should occur.
			  return null;
		  }
	  }
	  
	  public String byteToHex(byte[] bytes) {
		  //The following was copied from: https://stackoverflow.com/a/2817883
		  StringBuilder sb = new StringBuilder();
		  for (byte b : bytes) {
			  sb.append(String.format("%02X", b));
		  }
		  return sb.toString();
	  }
	  
	  public boolean isValidLogin(String username, String password) {
		  try {
			  PreparedStatement stmt;
			  stmt = this.conn.prepareStatement("SELECT COUNT(*) FROM customers WHERE email = ? and pword = ?");
			  stmt.setString(1, username);
			  stmt.setString(2, byteToHex(hash(password)));
			  ResultSet result = stmt.executeQuery();
			  result.next();
			  if (result.getInt("count(*)") == 1) {
				  return true;
			  }
		  }
		  catch (SQLException e) {
			  System.out.println("Query failed");
		  }
		  catch (NullPointerException e) {
			  System.out.println("isValidLogin(): No password Provided");
		  }
		  return false;
	  }
	  
	  public boolean insertCustomer(String firstName, String lastName, String email, String pword, String phoneNumber) {
		  try {
			  PreparedStatement stmt;
			  stmt = this.conn.prepareStatement("INSERT INTO customers (first_name, last_name, email, pword, phone_number) VALUES (?,?,?,?,?)");
			  stmt.setString(1, firstName);
			  stmt.setString(2, lastName);
			  stmt.setString(3, email);
			  stmt.setString(4, byteToHex(hash(pword)));
			  stmt.setString(5, phoneNumber);
			  System.out.println(stmt);
			  stmt.executeUpdate();
			  return true;
		  }
		  catch (SQLException e) {
			  System.out.println("insert failed");
			  return false;
		  }
	  }
	  
	  public ReservationSummaryObject getReservationSummary(int reservationID) throws SQLException {
			  PreparedStatement stmt;
			  stmt = this.conn.prepareStatement("select first_name, last_name, reservation_id, check_in, check_out, earned_points, room_type, amount FROM reservations inner join payments on reservations.reservation_id=payments.payment_id inner join customers on reservations.customer_id=customers.customer_id where reservation_id = ?");
			  stmt.setInt(1, reservationID);
			  System.out.println(stmt);
			  ReservationSummaryObject myReservation =  new ReservationSummaryObject(stmt.executeQuery());
			  stmt = this.conn.prepareStatement("SELECT DATEDIFF(?, ?) AS DateDiff");
			  stmt.setDate(2,myReservation.getCheckIn());
			  stmt.setDate(1,myReservation.getCheckOut());
			  ResultSet rs = stmt.executeQuery();
			  rs.next();
			  myReservation.setNumberOfNights(rs.getInt(1));
			  return myReservation;
		 
	  }
	  
	  public ReservationLookup getReservationLookup(int reservationID) {
		  try {
			  PreparedStatement stmt;
			  stmt = this.conn.prepareStatement("select hotels.name, hotels.address, hotels.city, hotels.state, hotels.zip_code, hotels.phone_number, first_name, last_name, check_in, check_out, number_of_guests, room_type, email from reservations  inner join customers on reservations.customer_id=customers.customer_id inner join hotels on reservations.hotel_id=hotels.hotel_id where reservation_id=?");
			  stmt.setInt(1, reservationID);
			  System.out.println(stmt);
			  ResultSet data = stmt.executeQuery();
			  stmt = this.conn.prepareStatement("SELECT feature_id FROM possessed_features WHERE reservation_id = ?");
			  stmt.setInt(1, reservationID);
			  System.out.println(stmt);
			  ResultSet features = stmt.executeQuery();
			  ReservationLookup myReservation = new ReservationLookup(data,features);
		  return myReservation;
		  }
		  catch (SQLException e){
			 ReservationLookup myReservation = new ReservationLookup();
			 return myReservation;
		  }
	  }
	  
	  public Customer getCustomer(String email) throws SQLException{
		  PreparedStatement stmt;
		  stmt = this.conn.prepareStatement("SELECT * FROM customers WHERE email = ?");
		  stmt.setString(1, email);
		  System.out.println(stmt);
		  Customer customer = new Customer(stmt.executeQuery());
		  return customer;
	  }
	  
	  public int getNumberOfNights(Reservation res) throws SQLException {
		  PreparedStatement stmt;
		  stmt = this.conn.prepareStatement("SELECT DATEDIFF(?, ?) AS DateDiff");
		  stmt.setDate(2,res.getCheckIn());
		  stmt.setDate(1,res.getCheckOut());
		  System.out.println(stmt);
		  ResultSet rs = stmt.executeQuery();
		  rs.next();
		  int nights = rs.getInt(1);
		  return nights;
	  }
	  
	  public void setReservation(Reservation res) throws SQLException {
		  //Calculate points
		  PreparedStatement stmt;
		  stmt = this.conn.prepareStatement("SELECT DATEDIFF(?, ?) AS DateDiff");
		  stmt.setDate(2,res.getCheckIn());
		  stmt.setDate(1,res.getCheckOut());
		  System.out.println(stmt);
		  ResultSet rs = stmt.executeQuery();
		  rs.next();
		  int nights = rs.getInt(1);
		  int points = nights * 150;
		  
		  //determine hotelID
		  int hotelID;
		  
		  if (res.getLocation().equals("Omaha")) {hotelID = 6;}
		  else if (res.getLocation().equals("Lincoln")) {hotelID = 3;}
		  else if (res.getLocation().equals("Scottsbluff")) {hotelID = 7;}
		  else if (res.getLocation().equals("O'Niell")) {hotelID = 5;}
		  else if (res.getLocation().equals("Kearney")) {hotelID = 2;}
		  else if (res.getLocation().equals("North Platte")) {hotelID = 4;}
		  else if (res.getLocation().equals("South Sioux City")) {hotelID = 8;}
		  else if (res.getLocation().equals("Bellevue")) {hotelID = 1;}
		  else {hotelID = 0;}
		  
		  
		  //Insert reservation
		  stmt = this.conn.prepareStatement("INSERT INTO reservations (customer_id, hotel_id, number_of_guests, check_in, check_out, earned_points, room_type) VALUES (?,?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
		  stmt.setInt(1, res.getCustomerId());
		  stmt.setInt(2, hotelID);
		  stmt.setInt(3, res.getGuests());
		  stmt.setDate(4, res.getCheckIn());
		  stmt.setDate(5, res.getCheckOut());
		  stmt.setInt(6, points);
		  stmt.setString(7, res.getRoomType());
		  System.out.println(stmt);
		  stmt.executeUpdate();
		  rs = stmt.getGeneratedKeys();
		  rs.next();
		  int reservationID = rs.getInt(1);
		  res.setReservationID(reservationID);
		  
		  //Calculate amount
		  int nightlyRate;
		  switch (res.getRoomType()) {
		  case "Double": nightlyRate = 11550; break;
		  case "Queen":	nightlyRate = 13125; break;
		  case "Double Queen": nightlyRate = 15750; break;
		  case "King": nightlyRate = 17325; break;
		  default: 
			  System.out.println("Error getting room type nightly rate. Input was " + res.getRoomType());
			  nightlyRate = 0;
		  }
		  if (res.getBreakfast()) {
			  nightlyRate += 899;
		  }
		  if (res.getParking()) {
			  nightlyRate += 1999;
		  }
		  int amount = nightlyRate * nights;
		  if (res.getWifi()) {
			  amount += 1299;
		  }
		  amount += res.getHolidaySurcharge();
		  
		  //Insert Payment
		  stmt = this.conn.prepareStatement("INSERT INTO payments (name_on_card, expiration, card_number, transaction_time, amount) VALUES (?,?,?,CURRENT_DATE,?)");
		  stmt.setString(1, res.getNameOnCard());
		  stmt.setString(2,res.getExp());
		  stmt.setLong(3, res.getCardNumber());
		  stmt.setInt(4,amount);
		  System.out.println(stmt);
		  stmt.executeUpdate();
		  
		  //Insert possessed features
		  if (res.getBreakfast()) {
			  stmt = this.conn.prepareStatement("INSERT INTO possessed_features (reservation_id, feature_id) VALUES (?,?)");
			  stmt.setInt(1, reservationID);
			  stmt.setInt(2, 2);
			  System.out.println(stmt);
			  stmt.executeUpdate();
		  }
		  if (res.getWifi()) {
			  stmt = this.conn.prepareStatement("INSERT INTO possessed_features (reservation_id, feature_id) VALUES (?,?)");
			  stmt.setInt(1, reservationID);
			  stmt.setInt(2, 1);
			  System.out.println(stmt);
			  stmt.executeUpdate();
		  }
		  if (res.getParking()) {
			  stmt = this.conn.prepareStatement("INSERT INTO possessed_features (reservation_id, feature_id) VALUES (?,?)");
			  stmt.setInt(1, reservationID);
			  stmt.setInt(2, 3);
			  System.out.println(stmt);
			  stmt.executeUpdate();
		  }
	  }
	  
	  public ResultSet getHotelResultSet(int hotelID) throws SQLException{
		  PreparedStatement stmt;
		  stmt = this.conn.prepareStatement("SELECT address, city, state, zip_code, phone_number FROM hotels WHERE hotel_id = ?");
		  stmt.setInt(1, hotelID);
		  System.out.println(stmt);
		  ResultSet rs = stmt.executeQuery();
		  return rs;
	  }
	  
	  
	
}

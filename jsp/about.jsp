<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style><%@include file="../WEB-INF/css/About.css"%></style>
    	<style>
        	* {
          	  font-family: Glacial;
       		}
    	</style>
<title>About</title>
</head>
<style><%@include file="../WEB-INF/css/About.css"%></style>
<style><%@include file="../WEB-INF/css/Main.css"%></style>
<style>
	* {
		font-family: Glacial;
	}
</style>
<title>About Proviso</title>

</head>
<body>

<c:import url="header.jsp" />

<main>

	<div class="main-container">
		<div class='container'>
			<div id='columns'>
				<div class='left-card'>
					<h1>About Proviso</h1>
					<div class ='About'>
						<h3> 
							Proviso is a line of hotels located throughout the state of Nebraska. Proviso provides
							an enormous quantity of rooms to choose from, including single or double bed set ups in
							full, queen, or king sizes. Guests are more than welcome to book any of these rooms with
							us at any time, and indulge in the distinguished accommodations and activities that we
							have to offer.
						</h3>
						<br />
						<img src="img/Exterior-Rendering.jpeg">
					</div>
				</div>
				<div class='right-card'>
					<div class='contact_header'>
						<h1>Contact Us</h1>
						<p>We love questions and feedback - we're always happy to help!<br>Send us a message and we will respond within 24 hours.</p>
					</div>
					<div class='box'> <!-- code source: https://github.com/dwyl/learn-to-send-email-via-google-script-html-no-server/blob/master/README.md -->
						<form class='gform' method='POST' action=
						'https://script.google.com/macros/s/AKfycbyC88eUBvGbrXHwHVQ4lPN7hNRhjeVZmQ1ENP7esTmzAAjr_koN1CZ9wTOZP9KzpXJa/exec'>
							<div class='form-elements'>
								<fieldset>
							    	<label for="name">Full Name</label><br>
							        <input id="name" name="name" type='text' placeholder="Enter your first and last name here"/><br>
							        <label for="email">Email</label><br>
							        <input id="email" name="email" type="email" value=""
							        required placeholder="your.name@email.com"/><br>
							        <label for="telephone">Telephone</label><br>
							        <input id="telephone" name="telephone" type="tel" value=""
							        required placeholder="123-456-7890" pattern='[0-9]{3}-[0-9]{3}-[0-9]{4}'/><br>
							        <label for="message">Message</label><br>
							        <textarea id="message" name="message" rows="10"
							        placeholder="Type message here"></textarea><br>
							    </fieldset>
							    <div class="thankyou_message" style="display:none;">
									<table>
										<tr>
											<td>Thanks for contacting Proviso! We will get back to you soon!</td>
										</tr>
									</table>
						    	</div>
							    <div class=button>
							    	<input type='submit' value='Submit'>
							    </div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class='bottom'>
				<div class='contact-info-grid'>
					<table class='address'>
						<tr>
							<td><img src='img/map-marker-2-24.png'></td>
							<td>
								<p>
									&nbsp;&nbsp;Proviso Customer Service<br>
									&nbsp;&nbsp;1175 Capitol Ave<br>
									&nbsp;&nbsp;Omaha, NE 68102
								</p>
							</td>
						</tr>
					</table>
					<table class='email'>
						<tr>
							<td><img src='img/email-24.png'></td>
							<td><p>&nbsp;&nbsp;customerservice@proviso.com</p></td>
						</tr>
					</table>
					<table class='phone'>
						<tr>
							<td><img src='img/phone-2-24.png'></td>
							<td><p>&nbsp;&nbsp;1-800-555-0001</p></td>
						</tr>
					</table>
					<div class=bottom-img>
						<a target="_blank" href='https://twitter.com/ProvisoHotel'>
							<img src='img/Twitter-Logo.png'>
						</a>
					</div>
					<div class=bottom-img>
						<a target="_blank" href='https://www.instagram.com/provisohotel/'>
							<img src='img/Instagram_icon.png'>
						</a>
					</div>
					<div class=bottom-img>
						<a target="_blank" href='https://www.facebook.com/Proviso-Hotel-and-Suites-103284909200474'>
							<img src='img/fb_logo.png'>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<footer>
<jsp:include page="footer.jsp" />
</footer>

<script data-cfasync="false" type="text/javascript" src="js/contactus-form-submission-handler.js"></script>
</body>
</html>
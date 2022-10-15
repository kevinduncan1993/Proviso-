<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
 <style><%@include file="../WEB-INF/css/landing.css"%></style>
 <style><%@include file="../WEB-INF/css/Main.css"%></style>
<head>
<meta charset="UTF-8">
<title>Proviso Hotel and Suites</title>
</head>
<body>
<c:import url="header.jsp" />
	<div class='landing-container'>
		<div class='top'>
			<div class='overlay'>
				<h1 id='title'>PROVISO</h1>
					<div class="book-now">
						<a href="/Proviso?action=locations" id="book-now-button">See Locations</a>
					</div>
			</div>
		</div>
		<div class='description'>
				<h1>Discover The Beauty Within Nebraska</h1>
					<h2>From Chimney Rock to the downtown streets of Omaha.</h2>
				<p>We have a few Hotel Proviso buildings in downtown Omaha for an amazing view of downtowns attractions along with activities that are a short distance away such as the Durham Museum, The Heartland Park of America with a massive water fountain that bursts with different colors when the sun sets, a view of the Missouri River and Bob Kerrey Pedestrian Bridge, or the Henry Doorley Zoo with the largest indoor desert in a glass dome. We also have some of our hotels in the western
				part of Nebraska for amazing views of Chimney Rock in Bayard, sand dunes, or visiting Fort Robinson State Park and Toadstool Geologic Park.</p>
				<a href="/Proviso?action=DateSelection" id="see-locations-button">Book Now</a>
		</div>
		
		
		<div class="photoSlide" id="landing">			
			<div id="landingCarousel" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="5" aria-label="Slide 6"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="6" aria-label="Slide 7"></button>
			    <button type="button" data-bs-target="#landingCarousel" data-bs-slide-to="7" aria-label="Slide 8"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active" data-bs-interval="10000">
			    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/b.jpeg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso Omaha</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Lincoln.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso Lincoln</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Scottsbluff.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso Scottsbluff</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Oneill.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso O'Neill</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Kearney.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso Kearney</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/northplatte.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso North Platte</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/ssc.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso Bellevue</h5>
			      </div>
			    </div>
			    <div class="carousel-item" data-bs-interval="10000">
			      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/bellevue.jpg">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Proviso South Sioux City</h5>
			      </div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#landingCarousel" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#landingCarousel" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
		
		
		<div class='events'>
			<div class='events-left'>
				<div class='events-top'>
					<h1>Events</h1>
				</div>
				<div class='events-middle'>
					<div class='events-nav'>
						<ul>
		  					<li><button id="weddingbtn" onClick="eventConference()">Weddings</button></li>
		  					<li id='li-middle'><button id="confbtn" onClick="eventConference()">Conferences</button></li>
		  					<li><button id="gatheringsbtn" onClick="eventConference()">Special Gatherings</button></li>
						</ul>
					</div>
				</div>
				<div class='events-bottom'>
					<p id="event-paragraph">For a price, you and your loved one can have a wedding at any one of our Hotel Proviso locations of your choice.</p>
				</div>
			</div>
			<div class='events-right'>
				<img class='event-picture' id='event-picture' alt='event picture' src="${pageContext.request.contextPath}/img/wedding.jpeg">
			</div>
		</div>
	</div>
	
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>	
	
	
	<script>
		document.getElementById('weddingbtn').onclick = function() {
			document.getElementById('event-paragraph').innerHTML = 'For a price, you and your loved one can have a wedding at any one of our Hotel Proviso locations of your choice.';
			document.getElementById('event-picture').src = "${pageContext.request.contextPath}/img/wedding.jpeg";
		}
		document.getElementById('confbtn').onclick = function() {
			document.getElementById('event-paragraph').innerHTML = 'All of our Proviso Hotels offer an outstanding environment for your companies next conference. We have everything up to date along with an amazing staff to make sure everything goes as planned. Whether this is a time of celebration or all business, we have you covered.';
			document.getElementById('event-picture').src = "${pageContext.request.contextPath}/img/conference.jpeg";
		}
		document.getElementById('gatheringsbtn').onclick = function() {
			document.getElementById('event-paragraph').innerHTML = 'We realize that not every event is going to be either a wedding or business related. If you have a group that is looking for a gathering space, whether that is family coming together from across the country or your small businesses next venue, we have multiple rooms among our hotel that can be set to meet your needs. Get in contact with your events cordinator and we can make sure everything is customized to your expecatations. ';
			document.getElementById('event-picture').src = "${pageContext.request.contextPath}/img/special_gathering.jpeg";
		}
		
		var slider_img = document.querySelector('.slider-img');
		var images = ['a.jpeg', 'b.jpeg', 'c.jpeg', 'd.jpeg'];
		var i = 0;
		
		function prev(){
			if(i <= 0) i = images.length;
			i--;
			return setImg();
		}
		
		function next() {
			if(i >= images.length -1) i = -1;
			i++;
			return setImg();
		}
		
		function setImg(){
			document.getElementById('photo-background').style.backgroundImage = 'url("${pageContext.request.contextPath}/img/' + images[i] + '")'; 
		}
	</script>
</body>
</html>

<!-- source for how to format header and footer: https://codebun.com/include-header-and-footer-in-jsp-using-jstl/ -->
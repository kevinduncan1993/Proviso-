<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dataManager" scope="application" class="model.DataManager"/>
<%@ page import="model.Location" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <style><%@include file="../WEB-INF/css/Locations.css"%></style>
    <style><%@include file="../WEB-INF/css/Main.css"%></style>

    	<style>
        	* {
          	  font-family: Glacial;
       		}
    	</style>
<title>Locations</title>
</head>
<body>

	<c:import url="header.jsp" />
	
	<main>
		<div class="main-container">
		
			<div class="main-top">
			
				<div class="select">
					<select id="locations" name="locations" onchange="enableLocation(this)">
						<option disabled hidden selected value="#">Select Location</option>
						<option value="0">All Locations</option>
						<option value="1">Omaha</option>
						<option value="2">Lincoln</option>
						<option value="3">Scottsbluff</option>
						<option value="4">O'Niell</option>
						<option value="5">Kearney</option>
						<option value="6">North Platte</option>
						<option value="7">South Sioux City</option>
						<option value="8">Bellevue</option>
					</select>
				</div>
			</div>
			
			<div class="main-bottom">
			
				<div class="boxes">
					<div class="box" id="omaha">
					<%Location omaha = new Location(dataManager,6); %>
						<div class="box-left">
							<h2>Omaha</h2>
		
							<ul class="address">
								<li><%out.print(omaha.getAddress()); %></li>
								<li><%out.print(omaha.getCityStateZip());%></li>
								<li>USA</li>
								<br>
								<li class="phone"><%out.print(omaha.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="omahaCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#omahaCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#omahaCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#omahaCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#omahaCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/b.jpeg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso Omaha</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/HenryDoorlyZoo.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Henry Doorly Zoo</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/joslyn-art-museum.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Joslyn Art Museum</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Durham.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>The Durham Museum</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#omahaCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#omahaCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="lincoln">
					<%Location lincoln = new Location(dataManager,3); %>
						<div class="box-left">
							<h2>Lincoln</h2>
		
							<ul class="address">
							<li><%out.print(lincoln.getAddress()); %></li>
							<li><%out.print(lincoln.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(lincoln.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="lincolnCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#lincolnCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#lincolnCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#lincolnCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#lincolnCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Lincoln.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso Lincoln</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Capitol.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Capitol Building</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/IMG_7221.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Memorial Stadium</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/IMG_7220.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Sunken Gardens</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#lincolnCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#lincolnCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="scottsbluff">
					<%Location scottsbluff = new Location(dataManager,7); %>
						<div class="box-left">
							<h2>Scottsbluff</h2>
		
							<ul class="address">
							<li><%out.print(scottsbluff.getAddress()); %></li>
							<li><%out.print(scottsbluff.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(scottsbluff.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="scottsbluffCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#scottsbluffCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#scottsbluffCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#scottsbluffCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#scottsbluffCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Scottsbluff.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso Scottsbluff</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/bluffs_monument.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Bluffs Monument</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/lake_minitare.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Lake Minitare</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Legacy.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Legacy of the Plains</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#scottsbluffCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#scottsbluffCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="oneill">
					<%Location oneill = new Location(dataManager,5); %>
						<div class="box-left">
							<h2>O'Neill</h2>
		
							<ul class="address">
							<li><%out.print(oneill.getAddress()); %></li>
							<li><%out.print(oneill.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(oneill.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="oneillCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#oneillCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#oneillCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#oneillCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#oneillCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Oneill.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso O'Neill</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/rowses.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Rowse’s 1+1 Ranch</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/ashfall.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Ashfall Fossil Beds State Historical Park</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/niobrara.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Niobrara State Park</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#oneillCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#oneillCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="kearney">
					<%Location kearney = new Location(dataManager,2); %>
						<div class="box-left">
							<h2>Kearney</h2>
		
							<ul class="address">
							<li><%out.print(kearney.getAddress()); %></li>
							<li><%out.print(kearney.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(kearney.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="kearneyCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#kearneyCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#kearneyCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#kearneyCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#kearneyCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/Kearney.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso Kearney</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/archway.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Great Platte River Road Archway Monument</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/car.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Classic Car Collection</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/art.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Museum of Nebraska Art</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#kearneyCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#kearneyCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="north-platte">
					<%Location northPlatte = new Location(dataManager,4); %>
						<div class="box-left">
							<h2>North Platte</h2>
		
							<ul class="address">
							<li><%out.print(northPlatte.getAddress()); %></li>
							<li><%out.print(northPlatte.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(northPlatte.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="northPlatteCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#northPlatteCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#northPlatteCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#northPlatteCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#northPlatteCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/northplatte.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso North Platte</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/tower.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Golden Spike Tower and Visitor Center</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/fort.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Fort Cody Trading Post</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/up.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Union Pacific Railroad Bailey Yardv</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#northPlatteCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#northPlatteCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="south-sioux-city">
					<%Location ssc = new Location(dataManager,8); %>
						<div class="box-left">
							<h2>South Sioux City</h2>
		
							<ul class="address">
							<li><%out.print(ssc.getAddress()); %></li>
							<li><%out.print(ssc.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(ssc.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="sscCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#sscCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#sscCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#sscCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#sscCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/ssc.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso South Sioux City</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/museum.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Sioux City Public Museum</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/ssc-art.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Sioiux City Art Center</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/lc.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Lewis & Clark Interpretive Center</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#sscCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#sscCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
					<div class="box" id="bellevue">
					<%Location bellevue = new Location(dataManager,1); %>
						<div class="box-left">
							<h2>Bellevue</h2>
		
							<ul class="address">
							<li><%out.print(bellevue.getAddress()); %></li>
							<li><%out.print(bellevue.getCityStateZip());%></li>
							<li>USA</li>
							<br>
							<li><%out.print(bellevue.getPhone()); %></li>
							</ul>
						</div>
						
						<div class="box-right">
						
							<div id="bellevueCarousel" class="carousel slide" data-interval="false">
							  <div class="carousel-indicators">
							    <button type="button" data-bs-target="#bellevueCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							    <button type="button" data-bs-target="#bellevueCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
							    <button type="button" data-bs-target="#bellevueCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
							    <button type="button" data-bs-target="#bellevueCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
							  </div>
							  <div class="carousel-inner">
							    <div class="carousel-item active">
							    	<img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/bellevue.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Proviso Bellevue</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/ff.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Fontenelle Forest</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/sarpy-county-museum.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Sarpy County Museum</h5>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img class="d-block w-100" alt='event picture' src="${pageContext.request.contextPath}/img/walnut.jpg">
							      <div class="carousel-caption d-none d-md-block">
							        <h5>Walnut Creek Recreation Area</h5>
							      </div>
							    </div>
							  </div>
							  <button class="carousel-control-prev" type="button" data-bs-target="#bellevueCarousel" data-bs-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Previous</span>
							  </button>
							  <button class="carousel-control-next" type="button" data-bs-target="#bellevueCarousel" data-bs-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="visually-hidden">Next</span>
							  </button>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>	


    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>	
	
	<script type="text/javascript">
	let box = document.getElementsByClassName("box");
		
		function enableLocation(answer) {
		if(answer.value != 0) {
			if(answer.value == 1) {
				box[0].classList.remove('d-none');
			} else {
				box[0].classList.add('d-none');
			}
			if(answer.value == 2) {
				box[1].classList.remove('d-none');
			} else {
				box[1].classList.add('d-none');
			}
			if(answer.value == 3) {
				box[2].classList.remove('d-none');
			} else {
				box[2].classList.add('d-none');
			}
			if(answer.value == 4) {
				box[3].classList.remove('d-none');
			} else {
				box[3].classList.add('d-none');
			}
			if(answer.value == 5) {
				box[4].classList.remove('d-none');
			} else {
				box[4].classList.add('d-none');
			}
			if(answer.value == 6) {
				box[5].classList.remove('d-none');
			} else {
				box[5].classList.add('d-none');
			}
			if(answer.value == 7) {
				box[6].classList.remove('d-none');
			} else {
				box[6].classList.add('d-none');
			}
			if(answer.value == 8) {
				box[7].classList.remove('d-none');
			} else {
				box[7].classList.add('d-none');
			}
		} else {
			for (var x = 0; x < box.length; x++) {
				console.log(x);
				box[x].classList.remove('d-none');
				}
			}

		};
	</script>

</body>
</html>
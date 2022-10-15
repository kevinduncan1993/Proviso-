<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <style><%@include file="../WEB-INF/css/Rewards.css"%></style>
    	<style>
        	* {
          	  font-family: Glacial;
       		}
    	</style>
<title>Rewards Program</title>
<c:import url="header.jsp" />
</head>
<body>
	<div class='container'>
		<h1>Proviso Rewards</h1>
	</div>
		<table border="1">
			<colspan>
				<col span="1" style="width: 44%;">
				<col span="1" style="width: 14%;">
				<col span="1" style="width: 14%;">
				<col span="1" style="width: 14%;">
				<col span="1" style="width: 14%;">
			</colspan>
			<tr>
				<th><h2>Benefit</h2></th>
				<th>
					<img class="badge" src='img/Member.png' alt='Tier: Member'><br>
					0-999 pts
				</th>
				<th>
					<img class="badge" src='img/Silver.png' alt='Tier: Silver'><br>
					1000-4999 pts
				</th>
				<th>
					<img class="badge" src='img/Gold.png' alt='Tier: Gold'><br>
					5000-9999 pts
				</th>
				<th>
					<img class="badge" src='img/Diamond.png' alt='Tier: Diamond'><br>
					10000+ pts
				</th>
			</tr>
			<tr class="data">
				<td>Accumulate rewards points for each night stayed</td>
				<td><img class="check" src="img/check-mark-member.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-silver.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>
			<tr class="data" id="asterisk1">
				<td>
					Priority access on customer service calls&nbsp;&nbsp;<span style="color: #CC3733">*</span>
					<div id="hidden1">
						Reduce your wait time when calling to speak to an agent.<br>
						Provide your login info over the phone for priority access.
					</div>
				</td>
				<td><img class="check" src="img/check-mark-member.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-silver.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>		
			<tr class="data">
				<td>Free bottled water at check-in</td>
				<td></td>
				<td><img class="check" src="img/check-mark-silver.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>
			<tr class="data" id="asterisk2">
				<td>
					Exclusive discounts for select local <a href="/Proviso?action=locations">attractions</a>
					&nbsp;<span style="color: #CC3733">*</span>
					<div id="hidden2">
						Discounts to vary.<br>
						Please speak to hotel concierge for additional information.
					</div>
				</td>
				<td></td>
				<td><img class="check" src="img/check-mark-silver.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>		
			<tr class="data" id="asterisk3">
				<td>
					Daily Food and Beverage Credit&nbsp;&nbsp;<span style="color: #CC3733">*</span>
					<div id="hidden3">
						Gold Members = $10 per day, per room<br>
						Diamond Members = $15 per day, per room<br>
						Please speak to hotel front desk for additional information.
					</div>
				</td>
				<td></td>
				<td></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>
			<tr class="data" id="asterisk4">
				<td>
					Free WiFi&nbsp;&nbsp;<span style="color: #CC3733">*</span>
					<div id="hidden4">
						This promotion will be credited to member upon checkout.<br>
						Please speak to hotel front desk for additional information.
					</div>				
				</td>
				<td></td>
				<td></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>
			<tr class="data">
				<td>Space-available room upgrades</td>
				<td></td>
				<td></td>
				<td><img class="check" src="img/check-mark-gold.png" alt="checkmark"></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>
			<tr class="data" id="asterisk5">
				<td>
					Fifth night free&nbsp;&nbsp;<span style="color: #CC3733">*</span>
					<div id="hidden5">
						This promotion will be credited to member upon checkout.<br>
						Please speak to hotel front desk for additional information.
					</div>
				</td>
				<td></td>
				<td></td>
				<td></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>
			<tr class="data">
				<td>Exclusive lounge access</td>
				<td></td>
				<td></td>
				<td></td>
				<td><img class="check" src="img/check-mark-diamond.png" alt="checkmark"></td>
			</tr>		
		</table>
<script>
	document.getElementById('asterisk1').onmouseover = function() {
		 document.getElementById("hidden1").style.display = 'block';
	}
	document.getElementById('asterisk1').onmouseout = function() {
		 document.getElementById("hidden1").style.display = "none";
	}
	document.getElementById('asterisk2').onmouseover = function() {
		 document.getElementById("hidden2").style.display = 'block';
	}
	document.getElementById('asterisk2').onmouseout = function() {
		 document.getElementById("hidden2").style.display = "none";
	}
	document.getElementById('asterisk3').onmouseover = function() {
		 document.getElementById("hidden3").style.display = 'block';
	}
	document.getElementById('asterisk3').onmouseout = function() {
		 document.getElementById("hidden3").style.display = "none";
	}
	document.getElementById('asterisk4').onmouseover = function() {
		 document.getElementById("hidden4").style.display = 'block';
	}
	document.getElementById('asterisk4').onmouseout = function() {
		 document.getElementById("hidden4").style.display = "none";
	}
	document.getElementById('asterisk5').onmouseover = function() {
		 document.getElementById("hidden5").style.display = 'block';
	}
	document.getElementById('asterisk5').onmouseout = function() {
		 document.getElementById("hidden5").style.display = "none";
	}
</script>
</body>
<footer>
<jsp:include page="footer.jsp" />
</footer>
</html>
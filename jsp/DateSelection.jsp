<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Date</title>
<style><%@include file="../WEB-INF/css/DateSelection.css"%></style>
<style><%@include file="../WEB-INF/css/Main.css"%></style>
<style>
* {
	font-family: Glacial;
}
</style>
</head>
<body>
<c:import url="header.jsp" />
	<main>
		<div class="main-container">
				<br/>
				<div class="main center">
					<div id="dates-manual-input" class="justify-center">
						<div id="checkin-error" class="error-text justify-right"></div>
						<!-- Check in/out dates -->
						<form action="/Proviso" id="dates-form" class="justify-center">
							<input type="hidden" id="action" name="action" value="RoomChoice">
							<label for="checkin">Check-In:</label>
							<input type="date" id="checkin" name="checkin" oninput="dateSelectManual('checkin')" required>
							<label for="checkout">Check-Out:</label>
							<input type="date" id="checkout" name="checkout" oninput="dateSelectManual('checkout')" required>
						</form>
						<div id="checkout-error" class="error-text justify-left">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</div>
					</div>
					
					<div id="calendar-gui">
						<div id="button-previous-month" class="basic-button month-change-button" onclick="changeMonth('previous')"></div>
					
						<!-- This contains the displayed calendars -->
						<div id="displayed-calendars"></div>
						
						<div id="button-next-month" class="basic-button month-change-button"  onclick="changeMonth('next')"></div>
						
					</div>
					
					<div id="submit-dates-button" class="basic-button" onclick="dateSubmit()">Confirm Dates</div>
				</div>
				<br/>
			<!-- </div>  -->
			
		</div>
	</main>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	
	<script>
		//Initialize.
		let currentDate = new Date();
		let stringCurrentDate =
			currentDate.getFullYear() + '-' +
			(currentDate.getMonth() + 1 + '').padStart(2, "0") + '-' +
			(currentDate.getDate() + '').padStart(2, "0");
		document.getElementById("checkin").setAttribute("min", stringCurrentDate);
		document.getElementById("checkout").setAttribute("min", stringCurrentDate);
		
		let firstDisplayMonth = new Date(currentDate.getFullYear(), currentDate.getMonth());
		
		let checkInDate = "";
		let checkOutDate = "";
		
		const NUMBER_OF_CALENDARS = 2;
		const MAX_WIDTH = 7;
		const MAX_HEIGHT = 6;
		const days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
		
		
		//Returns the a string month based on the number ranging from 0 to 11.
		function monthToString(month) {
			let string = "";
			switch(month) {
			case 0:
				string = "January";
				break;
			case 1:
				string = "February";
				break;
			case 2:
				string = "March";
				break;
			case 3:
				string = "April";
				break;
			case 4:
				string = "May";
				break;
			case 5:
				string = "June";
				break;
			case 6:
				string = "July";
				break;
			case 7:
				string = "August";
				break;
			case 8:
				string = "September";
				break;
			case 9:
				string = "October";
				break;
			case 10:
				string = "November";
				break;
			case 11:
				string = "December";
				break;
			}
			return string;
		}
		
		function initializeCalendars() {
			
			//let date = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth());
			
			//Initialize the calendars.
			for(let c = 0; c < NUMBER_OF_CALENDARS; c++) {
				let date = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth() + c);
				
				//div for entire calendar, which contains the month/year and the gui.
				let calendar = document.createElement("div");
				calendar.classList.add("calendar");
					
					//Display the month and year.
					let stringMonth = document.createElement("div");
					stringMonth.id = "calendar"+(c+1)+"month";
					stringMonth.classList.add("month");
					stringMonth.textContent = monthToString(date.getMonth()) + " " + date.getFullYear();
						
				calendar.appendChild(stringMonth);
					
					//Initialize the table and its spots.
					let tableCalendar = document.createElement("table");
					tableCalendar.id = "calendar"+(c+1)+"dates";
					tableCalendar.classList.add("dates");
						let trDays = document.createElement("tr");
						
						//The first row contains the days of the week.
						for(let i = 0; i < days.length; i++) {
							let tdDay = document.createElement("td");
							tdDay.classList.add("day");
							tdDay.textContent = days[i];
							trDays.appendChild(tdDay);
						}
						
					tableCalendar.appendChild(trDays);
						
						//The remaining rows are reserved for the dates.
						for(let i = 0; i < MAX_HEIGHT; i++) {
							let trWeek = document.createElement("tr");
							
							for(let j = 0; j < MAX_WIDTH; j++) {
								let tdDate = document.createElement("td");
								tdDate.classList.add("date-cell");
								tdDate.classList.add("calendar-space-invisable");
								trWeek.appendChild(tdDate);
							}
							
							tableCalendar.appendChild(trWeek);
						}
				
				calendar.appendChild(tableCalendar);
				
				//Display the calendar.
				let calendarDisplay = document.getElementById("displayed-calendars");
				calendarDisplay.appendChild(calendar);
			}
		}
		
		function updateCalendars() {
			
			//Update the previous month and next month buttons.
			let previousMonthButton = document.getElementById("button-previous-month");
			let previousMonth = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth() - 1);
			previousMonthButton.textContent = monthToString(previousMonth.getMonth()) + " " + previousMonth.getFullYear();
			
			let nextMonthButton = document.getElementById("button-next-month");
			let nextMonth = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth() + NUMBER_OF_CALENDARS);
			nextMonthButton.textContent = monthToString(nextMonth.getMonth()) + " " + nextMonth.getFullYear();
			
			
			//Update the calendrs();
			for(let c = 0; c < NUMBER_OF_CALENDARS; c++) {
				//Get the date for the respective month and year.
				let date = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth() + c);
				let stringMonth = date.getFullYear() + '-' + (date.getMonth() + 1 + '').padStart(2, "0");
				
				//Set the month text.
				let divMonth = document.getElementById("calendar"+(c+1)+"month");
				divMonth.textContent = monthToString(date.getMonth()) + " " + date.getFullYear();
				
				//Get the table calendar.
				let tableCalendar = document.getElementById("calendar"+(c+1)+"dates");
				
				//Skip the first seven td elements because they are the days of the week.
				const tdElements = tableCalendar.getElementsByTagName("td");
				const tdDates = [];
				for(let i = days.length; i < tdElements.length; i++) {
					tdDates.push(tdElements[i]);
				}
				
				//Set all spots that appear before the first day to be invisable.
				let count = 0;
				let column = date.getDay();
				for (; count < column; count++) {
					tdDates[count].id = "";
					tdDates[count].setAttribute("class", "");
					tdDates[count].classList.add("date-cell");
					tdDates[count].classList.add("calendar-space-invisable");
					tdDates[count].removeAttribute("onclick");
					tdDates[count].textContent = "";
				}
				
				//Get the date for the last day of the month.
				let temp = new Date(date.getFullYear(), date.getMonth() + 1, 0);
				let max = temp.getDate();
				
				//Set all the dates.
				for(; count < max + column; count++) {
					let stringDate = stringMonth + "-" + ((count - column + 1) + "").padStart(2, "0");
					
					tdDates[count].id = stringDate;
					tdDates[count].setAttribute("class", "");
					tdDates[count].classList.add("date-cell");
					tdDates[count].classList.add("date");
					tdDates[count].setAttribute("onclick", "dateSelect('"+stringDate+"')");
					
					//Set the date number.
					tdDates[count].textContent = count - column + 1;
					
					//Set whether the date is disabled.
					if(!isValidStringDate(stringDate)) {
						tdDates[count].classList.add("calendar-date-disabled");
					} else {
						tdDates[count].classList.add("calendar-date-enabled");
					}
					
					
					//Determine whether the date should be highlighted.
					if(stringDate.localeCompare(checkInDate) === 0 || stringDate.localeCompare(checkOutDate) === 0) {
						tdDates[count].classList.add("calendar-date-chosen");
					} else if((checkInDate != "" && checkOutDate != "") && (checkInDate.localeCompare(stringDate) < 0 && stringDate.localeCompare(checkOutDate) < 0)) {
						tdDates[count].classList.add("calendar-date-between-chosen");
					}
					
				}
				
				//Set all spots that appear after the last day to be invisable.
				for(; count < MAX_HEIGHT * MAX_WIDTH; count++) {
					tdDates[count].id = "";
					tdDates[count].setAttribute("class", "");
					tdDates[count].removeAttribute("onclick");
					tdDates[count].classList.add("calendar-space-invisable");
					tdDates[count].textContent = "";
				}
			}
		}
		
		//Changes the first month to be displayed.
		function changeMonth(caller) {
			if(caller === "previous") {
				firstDisplayMonth = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth() - 1);
			} else if(caller === "next") {
				firstDisplayMonth = new Date(firstDisplayMonth.getFullYear(), firstDisplayMonth.getMonth() + NUMBER_OF_CALENDARS - 1);
			}
			updateCalendars();
		}
		
		//Updates the checkin and checkout fields to match
		function updateCheckDates() {
			document.getElementById("checkin").value = checkInDate;
			document.getElementById("checkout").value = checkOutDate;
		}
		
		//Sets the dates based on the given string date.
		function setCheckDates(stringDate) {
			if(!isValidStringDate(stringDate)) {
				return;
			}
			
			if(checkInDate !== "" && checkOutDate !== "") {
				if(stringDate.localeCompare(checkInDate) === 0) {
					//If selected date is the current checkin date, then unselect the date.
					checkInDate = "";
				} else if(stringDate.localeCompare(checkOutDate) === 0) {
					//If selected date is the current checkin date, then unselect the date.
					checkOutDate = "";
				} else if(stringDate.localeCompare(checkInDate) < 0) {
					//If selected date is less than the current checkin date, then set the checkin date to the selected date.
					checkInDate = stringDate;
				} else if(stringDate.localeCompare(checkOutDate) < 0) {
					//If selected date is less than the current checkout date, then set the checkout date to the selected date.
					checkOutDate = stringDate;
				} else if(stringDate.localeCompare(checkOutDate) > 0) {
					//If selected date is greater than the current checkout date, then set the checkout date to the selected date.
					checkOutDate = stringDate;
				} else {
					//Uh oh.
					checkInDate = "";
					checkOutDate = "";
				}
			} else if(checkInDate !== "" && checkOutDate === "") {
				if(stringDate.localeCompare(checkInDate) === 0) {
					//If selected date is the current checkin date, then unselect the date.
					checkInDate = "";
				} else if(stringDate.localeCompare(checkInDate) < 0) {
					//If selected date is before checkin date, then checkin date becomes checkout date and checkin date becomes selected date.
					checkOutDate = checkInDate;
					checkInDate = stringDate;
				} else {
					//Otherwise, the checkout date is the selected date.
					checkOutDate = stringDate;
				}
			} else if(checkInDate === "" && checkOutDate !== "") {
				if(stringDate.localeCompare(checkOutDate) === 0) {
					//If selected date is the current checkout date, then unselect the date.
					checkOutDate = "";
				} else if(stringDate.localeCompare(checkOutDate) > 0) {
					//If selected date is after checkout date, then checkout date becomes checkin date and checkin date becomes selected date.
					checkInDate = checkOutDate;
					checkOutDate = stringDate;
				} else {
					//Otherwise, the checkin date is the selected date.
					checkInDate = stringDate;
				}
			} else if(checkInDate === "" && checkOutDate === "") {
				//If neither checkin date nor the checkout date have been selected, then the checkin date is the selected date.
				checkInDate = stringDate;
			} else {
				//Uh oh.
				checkInDate = "";
				checkOutDate = "";
			}
		}
		
		//Selects the date throught the calendar.
		function dateSelect(stringDate) {
			let selectedDateElement = stringDate !== "" ? document.getElementById(stringDate) : null;
			setCheckDates(stringDate);
			
			updateCheckDates()
			updateCalendars();
		}
		
		//Tests if the given string is a date of the format YYYY-MM-DD.
		function isStringDate(stringDate) {
			let parts = date.split("-");
			
			if (parts.length !== 3) {
				return false;
			}
			
			let year = parts[0];
			let month = parts[1];
			let day = parts[2];
			
			if(Number.isInteger(year) && year.length === 4 &&
					Number.isInteger(month) && year.length === 2 &&
					Number.isInteger(day) && year.length === 2
					) {
				return true;
			} else {
				return false;
			}
		}
		
		//Tests if the given string date is later than or equal to today's date.
		function isWithinStringDateRange(stringDate) {
			let stringCurrentDate =
				currentDate.getFullYear() + '-' +
				(currentDate.getMonth() + 1 + '').padStart(2, "0") + '-' +
				(currentDate.getDate() + '').padStart(2, "0");
			if(stringDate.localeCompare(stringCurrentDate) >= 0) {
				return true;
			} else {
				return false;
			}
		}
		
		//Tests whether the given string date is valid.
		function isValidStringDate(stringDate) {
			if(stringDate !== "" && isWithinStringDateRange(stringDate)) {
				return true;
			} else {
				return false;
			}
		}
		
		//Selects the date through the checkin and checkout fields.
		function dateSelectManual(caller) {
			let checkInElement = document.getElementById("checkin");
			let checkOutElement = document.getElementById("checkout");
			let enteredDateElement = document.getElementById(caller);
			let enteredDate = enteredDateElement.value;
			
			if(isValidStringDate(checkInElement.value) && isValidStringDate(checkOutElement.value)) {
				let comparison = checkInElement.value.localeCompare(checkOutElement.value);
				if(comparison < 0) {
					//If the checkin date is less than the checkout date, then accept it.
					checkInDate = checkInElement.value;
					checkOutDate = checkOutElement.value;
				} else if(comparison === 0) {
					//If the checkin date is equal to the checkout date, then reject it.
					enteredDateElement.blur();
					enteredDateElement.value = "";
					enteredDateElement.focus();
					
					checkInDate = checkInElement.value;
					checkOutDate = checkOutElement.value;
				} else {
					//If the checkin date is greater than the checkout date, then swap the dates.
					enteredDateElement.blur();
					let temp = checkInElement.value;
					checkInElement.value = checkOutElement.value;
					checkOutElement.value = temp;
					enteredDateElement.focus();
					
					checkInDate = checkInElement.value;
					checkOutDate = checkOutElement.value;
				}
			} else if(!isValidStringDate(checkInElement.value) && isValidStringDate(checkOutElement.value)) {
				//If only the checkin date is invalid, then do not accept it.
				checkInDate = "";
				checkOutDate = checkOutElement.value;
			} else if(isValidStringDate(checkInElement.value) && !isValidStringDate(checkOutElement.value)) {
				//If only the checkout date is invalid, then do not accept it.
				checkInDate = checkInElement.value;
				checkOutDate = "";
			} else if(!isValidStringDate(checkInElement.value) && !isValidStringDate(checkOutElement.value)) {
				//If both the checkin date and checkout date are invalid, do not accept them.
				checkInDate = "";
				checkOutDate = "";
			} else {
				//Uh oh.
				checkInDate = "";
				checkOutDate = "";
			}
			updateCalendars();
		}
		
		//Submit the chosen dates if they are valid.
		function dateSubmit() {
			let validDates = true;
			let checkinErrorSpace = document.getElementById("checkin-error");
			let checkoutErrorSpace = document.getElementById("checkout-error");
			
			if(!document.getElementById("checkin").checkValidity()) {
				validDates = false;
				checkinErrorSpace.textContent = "Please enter a valid date. ->";
			} else {
				checkinErrorSpace.textContent = "";
			}
			
			
			if(!document.getElementById("checkout").checkValidity()) {
				validDates = false;
				checkoutErrorSpace.textContent += "<- Please enter a valid date.";
			} else {
				checkoutErrorSpace.textContent = "";
			}
			
			if(validDates) {
				checkinErrorSpace.textContent = "";
				checkoutErrorSpace.textContent = "";
				document.getElementById("dates-form").submit();
			}
		}
		
		//Initialize continued.
		initializeCalendars();
		dateSelect(document.getElementById("checkin").value);
		dateSelect(document.getElementById("checkout").value);
		updateCalendars();
	</script>
	
</body>
</html>
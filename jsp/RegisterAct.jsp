<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style><%@include file="../WEB-INF/css/Main.css"%></style>
 <style><%@include file="../WEB-INF/css/register.css"%></style>
<meta charset="UTF-8">
<title>Registration</title>
</head>

<body>	
	<main>
		<div class="register-main-container">
		
			<div class="main-left">
				<h2>Helpful Hints</h2>
				<p>Password must be <span id="min-length-requirement">at least 8 characters long</span> and must include <span id="text-uppercase-requirement">one uppercase</span> and <span id="text-lowercase-requirement">one lowercase</span> letter.</p>
			</div>
			
			
			<div class="main-right">
	   				<h1>Create a Free Account </h1>
	   				<p class="sign-in">Come join our community! Set up your account. Already have one? <a href="/Proviso?action=LoginTest">Sign In</a></p>
	   			
					<form id="registration-form" class="form-inline">
						<input type="hidden" name="action" value="registerAction"/>
						
							<div class="group" >
						    	<label for="firstname"><b>First Name</b></label>
						    	<input type="text" placeholder="Enter First Name" name="firstname" id="firstname" oninput="update()" required>
						     	<label for="Lastname"><b>Last Name</b></label>
						    	<input type="text" placeholder="Enter Last Name" name="lastname" id="lastname" oninput="update()" required>
						   </div>
						   
						    <div class="group"  >
							    <label for="psw"><b>Password</b></label>
							    <input type="password" placeholder="Enter Password" name="psw" id="psw" oninput="update()" minlength='8' required>
							    <label for="psw"><b>Confirm Password</b></label>
							    <input type="password" placeholder="Reenter Password" name="pswre" id="repsw" oninput="update()" minlength='8' required>
						    </div>
						    
						    <div class="group" >
							    <label for="email"><b>Email</b></label>
							    <input type="text" placeholder="Email" name="email" id="email" oninput="update()" required>
							    <label for="email"><b>Confirm Email</b></label>
							    <input type="text" placeholder="Reenter Email" name="email" id="reemail" oninput="update()" required>
						    </div>
						    
						    <div class="group" >
							    <label for="phone"><b>Phone</b></label>
							    <input type="tel" placeholder="Enter Phone" name="phone" id="phone" oninput="update()" required>
							    <label for="phone"><b>Confirm Phone</b></label>
							    <input type="tel" placeholder="Confirm Phone" name="phone" id="rephone" oninput="update()" required>
						    </div>
				    	<p class="terms-of-service">By submitting the form you agree to our <a href="#">Terms Of Service</a></p>
    					<button type="button" class="registerbtn" onclick="sendData()">Join</button>
   					</form>
				</div>
		</div>
	</main>
	
	<script>
		
		let firstName = "";
		let lastName = "";
		let password = "";
		let passwordConfirmation = "";
		let email = "";
		let emailConfirmation = "";
		let phone = "";
		let phoneConfirmation = "";
		
		let isValidFirstName = false;
		let isValidLastName = false;
		let isValidPassword = false;
		let isValidPasswordConfirmation = false;
		let isValidEmail = false;
		let isValidEmailConfirmation = false;
		let isValidPhone = false;
		let isValidPhoneConfirmation = false;
		
		let hasMinLength = false;
		let hasUppercase = false;
		let hasLowercase = false;
		
		let MIN_LENGTH = /.{8,}/;
		let UPPERCASE = /[A-Z]/;
		let LOWERCASE = /[a-z]/;
		let PHONE = /[0-9]{3}-[0-9]{3}-[0-9]{4}/;
		
		function checkFirstName() {
			isValidFirstName = true;
			
			let firstNameInput = document.getElementById("firstname");
			
			if(firstName !== "") {
				firstNameInput.setAttribute("class", "");
			} else {
				firstNameInput.setAttribute("class", "error-border");
				isValidFirstName = false;
			}
		}
		
		function checkLastName() {
			isValidLastName = true;
			
			let lastNameInput = document.getElementById("lastname");
			
			if(lastName !== "") {
				lastNameInput.setAttribute("class", "");
			} else {
				lastNameInput.setAttribute("class", "error-border");
				isValidLastName = false;
			}
		}
		
		function checkPassword() {
			isValidPassword = true;
			hasMinLength = true;
			hasUppercase = true;
			hasLowercase = true;
			
			let errorText = null;
			
			let passwordInput = document.getElementById("psw");
			passwordInput.setAttribute("class", "");
			
			errorText = document.getElementById("min-length-requirement");
			if(MIN_LENGTH.test(password)) {
				errorText.setAttribute("class", "");
			} else {
				passwordInput.setAttribute("class", "error-border");
				errorText.setAttribute("class", "error-text");
				isValidPassword = false;
			}
			
			errorText = document.getElementById("text-uppercase-requirement");
			if(UPPERCASE.test(password)) {
				errorText.setAttribute("class", "");
			} else {
				passwordInput.setAttribute("class", "error-border");
				errorText.setAttribute("class", "error-text");
				isValidPassword = false;
			}
			
			errorText = document.getElementById("text-lowercase-requirement");
			if(LOWERCASE.test(password)) {
				errorText.setAttribute("class", "");
			} else {
				passwordInput.setAttribute("class", "error-border");
				errorText.setAttribute("class", "error-text");
				isValidPassword = false;
			}
		}
		
		function checkPasswordConfirmation() {
			isValidPasswordConfirmation = true;
			
			let passwordConfirmationInput = document.getElementById("repsw");
			
			if(password.localeCompare(passwordConfirmation) === 0 && passwordConfirmation !== "") {
				passwordConfirmationInput.setAttribute("class", "");
			} else {
				passwordConfirmationInput.setAttribute("class", "error-border");
				isValidPasswordConfirmation = false;
			}
		}
		
		function checkEmail() {
			isValidEmail = true;
			
			let emailInput = document.getElementById("email");
			
			if(email.length > 0) {
				emailInput.setAttribute("class", "");
			} else {
				emailInput.setAttribute("class", "error-border");
				isValidEmail = false;
			}
		}
		
		function checkEmailConfirmation() {
			isValidEmailConfirmation = true;
			
			let emailConfirmationInput = document.getElementById("reemail");
			
			if(email.localeCompare(emailConfirmation) === 0 && email !== "") {
				emailConfirmationInput.setAttribute("class", "");
			} else {
				emailConfirmationInput.setAttribute("class", "error-border");
				isValidEmailConfirmation = false;
			}
		}
		
		function checkPhone() {
			isValidPhone= true;
			
			let phoneInput = document.getElementById("phone");
			
			if(phone !== "" && PHONE.test(phone)) {
				phoneInput.setAttribute("class", "");
			} else {
				phoneInput.setAttribute("class", "error-border");
				isValidPhone = false;
			}
		}
		
		function checkPhoneConfirmation() {
			isValidPhoneConfirmation = true;
			
			let phoneConfirmationInput = document.getElementById("rephone");
			
			if(phone.localeCompare(phoneConfirmation) === 0 && phoneConfirmation !== "") {
				phoneConfirmationInput.setAttribute("class", "");
			} else {
				phoneConfirmationInput.setAttribute("class", "error-border");
				isValidPhoneConfirmation = false;
			}
		}
		
		function update() {
			firstName = document.getElementById("firstname").value;
			lastName = document.getElementById("lastname").value;
			password = document.getElementById("psw").value;
			passwordConfirmation = document.getElementById("repsw").value;
			email = document.getElementById("email").value;
			emailConfirmation = document.getElementById("reemail").value;
			phone = document.getElementById("phone").value;
			phoneConfirmation = document.getElementById("rephone").value;
			
			console.log(document.getElementById("phone").value);
			
			checkFirstName();
			checkLastName();
			checkPassword();
			checkPasswordConfirmation()
			checkEmail();
			checkEmailConfirmation();
			checkPhone();
			checkPhoneConfirmation();
		}
		
		
		function sendData() {
			if(
					isValidPassword &&
					isValidPasswordConfirmation &&
					document.getElementById("firstname").checkValidity() &&
					document.getElementById("lastname").checkValidity() &&
					document.getElementById("email").checkValidity() &&
					document.getElementById("reemail").checkValidity() &&
					document.getElementById("phone").checkValidity() &&
					document.getElementById("rephone").checkValidity()
					) {
				document.getElementById("registration-form").submit();
			} else {
				update();
			}
		}
		
	</script>
</body>
</html>
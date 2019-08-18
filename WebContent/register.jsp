<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<title>Sign In</title>
	<style>
	/* Add a black background color to the top navigation */
	.topnav {
	  background-color: #333;
	  overflow: hidden;
	}
	
	/* Style the links inside the navigation bar */
	.topnav a {
	  float: right;
	  color: #f2f2f2;
	  text-align: center;
	  padding: 14px 16px;
	  text-decoration: none;
	  font-size: 17px;
	}
	
	/* Change the color of links on hover */
	.topnav a:hover {
	  background-color: #ddd;
	  color: black;
	}
	
	/* Add a color to the active/current link */
	.topnav a.active {
	  background-color: #4CAF50;
	  color: white;
	}
	
	* {box-sizing: border-box}
	
	/* Full-width input fields */
	  input[type=text], input[type=password] {
	  width: 100%;
	  padding: 15px;
	  margin: 5px 0 22px 0;
	  display: inline-block;
	  border: none;
	  background: #f1f1f1;
	}
	
	input[type=text]:focus, input[type=password]:focus {
	  background-color: #ddd;
	  outline: none;
	}
	
	hr {
	  border: 1px solid #f1f1f1;
	  margin-bottom: 25px;
	}
	
	/* Set a style for all buttons */
	button {
	  background-color: #4CAF50;
	  color: white;
	  padding: 14px 20px;
	  margin: 8px 0;
	  border: none;
	  cursor: pointer;
	  width: 100%;
	  opacity: 0.9;
	}
	
	button:hover {
	  opacity:1;
	}
	
	/* Extra styles for the cancel button */
	.cancelbtn {
	  padding: 14px 20px;
	  background-color: #f44336;
	}
	
	/* Float cancel and signup buttons and add an equal width */
	.cancelbtn, .signupbtn {
	  float: left;
	  width: 50%;
	}
	
	/* Add padding to container elements */
	.container {
	  padding: 16px;
	  width: 450px;
	  margin-left: 35%;
	  margin-top: 50px;
	}
	
	/* Clear floats */
	.clearfix::after {
	  content: "";
	  clear: both;
	  display: table;
	}
	
	/* Change styles for cancel button and signup button on extra small screens */
	@media screen and (max-width: 300px) {
	  .cancelbtn, .signupbtn {
	    width: 100%;
	  }
	}
	</style>
</head>
<body>
	<div class="topnav">
			<a href="login">Login</a>
			<a href="#about">About</a>
	</div>
	<form action="register" method="post">
	  <div class="container">
	    <h1>Register</h1>
	    <p>Please fill in this form to create an account.</p>
	    <hr>
	
	    <label for="email"><b>Email</b></label>
	    <input type="text" placeholder="Enter Email" name="email" required>
	
	    <label for="username"><b>Username</b></label>
	    <input type="text" placeholder="Enter Username" name="username" required>
	
	    <label for="password"><b>Password</b></label>
	    <input type="password" placeholder="Enter Password" name="password" required>

	    
	    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>
	  
	  	<div class="clearfix">
	      <button type="submit" class="signupbtn">Register</button>
    	</div>
	  </div>
	</form>
</body>
</html>
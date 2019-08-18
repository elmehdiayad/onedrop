<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
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
	
	
	/* Full-width inputs */
	input[type=text], input[type=password] {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
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
	}
	
	/* Add a hover effect for buttons */
	button:hover {
	  opacity: 0.8;
	}
	
	/* Extra style for the cancel button (red) */
	.cancelbtn {
	  width: auto;
	  padding: 10px 18px;
	  background-color: #f44336;
	}
	
	/* Center the avatar image inside this container */
	.imgcontainer {
	  text-align: center;
	  margin: 100px 0 -100px 25px;
	  
	}
	
	/* Avatar image */
	img.avatar {
	  width: 10%;
	  border-radius: 10%;
	}
	
	/* Add padding to containers */
	.container {
	  padding: 16px;
	  width: 300px;
	  margin-left: 40%;
	  margin-top: 100px;
	
	}
	
	/* The "Forgot password" text */
	span.psw {
	  float: right;
	  padding-top: 16px;
	}
	
	/* Change styles for span and cancel button on extra small screens */
	@media screen and (max-width: 300px) {
	  span.psw {
	    display: block;
	    float: none;
	  }
	  .cancelbtn {
	    width: 100%;
	  }
	}
</style>
<title>Welcome!</title>
</head>
<body>
		<div class="topnav">
			<a href="register">Register</a>
			<a href="#about">About</a>
		</div>
		<form action="login" method="post">
		  <div class="imgcontainer">
		    <img src="img/avatar-2.png" alt="Avatar" class="avatar">
		  </div>

		  <div class="container">
		  <h4>${feedback }</h4>
		    <label for="username"><b>Username</b></label>
		    <input type="text" placeholder="Enter Username" name="username" value="${username}" required>
		
		    <label for="password"><b>Password</b></label>
		    <input type="password" placeholder="Enter Password" name="password" required>
		    
		    <button type="submit">Login</button>
		  
		</form>
	
</body>
</html>
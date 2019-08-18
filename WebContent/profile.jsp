<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
		<style>
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
			.split {
			  height: 80%;
			  width: 50%;
			  position: fixed;
			  z-index: 1;
			  overflow-x: hidden;
			  padding-top: 20px;
			}
	
			/* Control the left side */
			.left {
			  left: 0;
			}
			
			/* Control the right side */
			.right {
			  right: 0;
			}
		</style>
		<title>Profile</title>
	</head>
	<body>
		<div class="topnav">
				<a class="active" href="logout">Log out</a>
				<a href="profile">${username}</a>
				<a href="drop">Drop</a>
		</div>
			<div class="col-md-9 personal-info">
				<br>
				<br>
				<br>          	 
				<h3>Personal info</h3>    
		        <form class="form-horizontal"  action="profile" method="post">
		          <div class="form-group">
		            <label class="col-lg-3 control-label">Username</label>
		            <div class="col-lg-8">
		              <input class="form-control" type="text" name="username"  value="${username}">
		            </div>
		          </div>          
		          <div class="form-group">
		            <label class="col-lg-3 control-label">Email:</label>
		            <div class="col-lg-8">
		              <input class="form-control" type="text" name="email" value="${email}">
		            </div>
		          </div>        
		          <div class="form-group">
		            <label class="col-md-3 control-label">Password:</label>
		            <div class="col-md-8">
		              <input class="form-control" type="password" name="password" value="${password}">
		            </div>
		          </div>
		          
		          <div class="form-group">
		            <label class="col-md-3 control-label"></label>
		            <div class="col-md-8">
		              <input type="submit" class="btn btn-primary" value="Save Changes">
		              <span></span>
		              <input type="reset"  class="btn btn-default" value="Cancel">
		            </div>
		          </div>
		        </form>
         	</div>	  
	</body>
</html>
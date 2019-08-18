<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Drop your product!</title>
	<meta charset="ISO-8859-1">
	<%
	String width; 
	if(request.getAttribute("width") == null){
		width = "300";
	}
	else {
		width = (String)request.getAttribute("width");
		}
	%>
	<% String color; 
	if(request.getAttribute("color") == null){
		color = "#000";
	}
	else {
		color = (String)request.getAttribute("color");
		}
	%>
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
	
	.split {
	  height: 100%;
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
	
	
	.card {
	  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	  max-width: <%= width %>px;
	  margin: auto;
	  text-align: center;
	  font-family: arial;
	}
	
	.price {
	  color: grey;
	  font-size: 22px;
	}
	
	.card button {
	  border: none;
	  outline: 0;
	  padding: 12px;
	  color: white;
	  background-color: <%= color %>;
	  text-align: center;
	  cursor: pointer;
	  width: 100%;
	  font-size: 18px;
	}
	
	.card button:hover {
	  opacity: 0.7;
	}
	
	input[type=text], input[type=range], input[type=number], input[type=file], select, textarea{
	  width: 100%;
	  padding: 12px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	  resize: vertical;
	}
	
	/* Style the label to display next to the inputs */
	label {
	  padding: 12px 12px 12px 0 ;
	  display: inline-block;
	}
	
	/* Style the submit button */
	input[type=submit] {
	  background-color: #4CAF50;
	  color: white;
	  padding: 12px 20px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  float: right;
	  margin: 10px;
	  margin-left: auto;
	}
	
	/* Style the container */
	.container {
	  border-radius: 5px;
	  padding: 20px;
	}
	
	/* Floating column for labels: 25% width */
	.col-25 {
	  float: left;
	  width: 25%;
	  margin-top: 6px;
	}
	
	/* Floating column for inputs: 75% width */
	.col-75 {
	  float: left;
	  width: 75%;
	  margin-top: 6px;
	}
	
	/* Clear floats after the columns */
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
	@media screen and (max-width: 600px) {
	  .col-25, .col-75, input[type=submit] {
	    width: 100%;
	    margin-top: 0;
	  }
	}
	
	body {font-family: Arial, Helvetica, sans-serif;}
	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 100px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  background-color: #fefefe;
	  margin: auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	}
	
	/* The Close Button */
	.close {
	  color: #aaaaaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	</style>
</head>
<body>
	<div class="topnav">
		<a class="active" href="logout">Log out</a>
		<a href="profile">${username}</a>
		<a href="drop">Drop</a>
	</div>
	<div class="split left"> 
	    <div class="container">
		  <form action="drop" method="post" enctype="multipart/form-data">
		  
		    <div class="row">
		      <div class="col-25">
		        <label for="title">Title</label>
		      </div>
		      <div class="col-75">
		        <input type="text" id="title" name="title" placeholder="Your title..." value="${title }" >
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-25">
		        <label for="price">Price</label>
		      </div>
		      <div class="col-75">
		        <input type="number" step="0.01" id="price" name="price" placeholder="Your price.." value="${price }" style="width: 50%;" >
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-25">
		        <label for="description">Description</label>
		      </div>
		      <div class="col-75">
		        <textarea id="description" name="description" placeholder="Write a description.." style="height:100px" >${description }</textarea>
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-25">
		        <label for="image">Image</label>
		      </div>
		      <div class="col-75">
		       	<input type="file" name="image" accept="image/*" style="width: 60%;" ${required }>
		      </div>
		    </div>
		     
		     <div class="row">
		      <div class="col-25">
		        <label for="with">Width</label>
		      </div>
		      <div class="col-75">
		       	<input type="range" name="width" min="50" max="500" value="${width }">
		      </div>
		    </div>
		    
		    <div class="row">
		      <div class="col-25">
		        <label for="color">Color</label>
		      </div>
		      <div class="col-75">
		       	<input type="color" name="color" value="${color }">
		      </div>
		    </div>
		    <div class="row">
		      <div class="col-25"> 
		        <label for="url">Scrap It</label>
		      </div>
		      <div class="col-75">
		        <input type="text" id="url" name="url" placeholder="Your Url..." value="${url }" >
		      </div>
			</div>
			<div class="row">
		      <div class="col-25"> 
		        <label for="save">Save</label>
		      </div>
		      <div class="col-75">
		        <input type="checkbox" name="save">
		      </div>
			</div>
			<div class="row">
		      <input type="submit" name="scrap" value="Scrap">
		    </div>
		    <div class="row">
		      <input type="submit" name="preview" value="Preview" style="margin-top: -57px; margin-right: 120px;" >
		    </div>
		  </form>
		</div>
	</div>
	<div class="split right">
	    <div class="card">
		  <img src="${src }" alt="" style="width:100%">
		  <h1>${title }</h1>
		  <p class="price">$${price }</p>
		  <p>${description }</p>
		  <p><button>Buy</button></p>
		  <p><button id="genBtn">Generate the HTML Code</button></p>
		</div>
	</div>
	<div id="myModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <p>
	    	&lt;html&gt; </br>
	    	  &lt;head&gt; </br>
	    	  	 &lt;style&gt; </br>
	    	  	 	.card {
					  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
					  max-width: <%= width %>px;
					  margin: auto;
					  text-align: center;
					  font-family: arial;
					}
					
					.price {
					  color: grey;
					  font-size: 22px;
					}
					
					.card button {
					  border: none;
					  outline: 0;
					  padding: 12px;
					  color: white;
					  background-color: <%= color %>;
					  text-align: center;
					  cursor: pointer;
					  width: 100%;
					  font-size: 18px;
					}
					
					.card button:hover {
					  opacity: 0.7;
					} </br>
	    	  	 &lt;/style&gt; </br>
	    	  &lt;/head&gt;
	    	  &lt;body&gt;
			    &lt;div class="card"&gt; </br>
				 &lt;img src="${src }" alt="" style="width:100%"&gt; </br>
				 &lt;h1&gt; ${title } &lt;/h1&gt; </br>
				 &lt;p class="price"&gt; $${price } &lt;/p&gt; </br>
				 &lt;p&gt; ${description } &lt;/p&gt; </br>
				 &lt;p&gt;&lt;button&gt; Buy &lt;/button&gt;&lt;/p&gt; </br>
				&lt;/div&gt; </br>
			 &lt;/body&gt; </br>
    	  &lt;/html&gt; </br>
		</p>
	  </div>
	</div>
	<script>
		// Get the modal
		var modal = document.getElementById('myModal');
		
		// Get the button that opens the modal
		var btn = document.getElementById("genBtn");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		
		// When the user clicks the button, open the modal 
		btn.onclick = function() {
		  modal.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	</script>
	
</body>
</html>
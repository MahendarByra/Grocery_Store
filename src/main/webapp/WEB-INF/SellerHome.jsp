<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Home</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
		
		#account{
			width: 500px;
			height: 400px;
			margin: auto;
			display: none;
			text-align: center;
			background-color: #ff612541;
			padding: 15px;
			
		}
		#item{
			width: 100%;
			height: 100%;
			margin: auto;
			padding: 15px;	
			display: none;
			
		}
		#add{
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		#update{
			border: 2px solid black;
			background-color: white	;
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		#remove{
			border: 2px solid black;
			background-color: white	;
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: none;
			padding: 15px;
			text-align: center;
		}
		#search{
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: block;
			padding: 15px;
			text-align: center;
		}
		.img{
			border: 2px solid black;
			height: 100px;
			width: 100px;
			margin: left;
		}
		.div1{
			padding: 15px;
			border: 2px solid black;
			width: 95%;
			height: 170px;
			text-align: left;
			background-color: white;
			margin: auto;
		}
		.div2{
			padding: 5px;
			width: 700px;
			height: 100px;
			background-color: white;
			float: left;
		}
		.div3{
			width: 100px;
			height: 100px;
			background-color: white;
			float: right;
		}
		
	button{
  		background-color: initial;
  		background-image: linear-gradient(-180deg, #FF7E31, #E62C03);
  		border-radius: 6px;
  		box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
  		color: #FFFFFF;
  		cursor: pointer;
  		display: inline-block;
  		font-family: Inter,-apple-system,system-ui,Roboto,"Helvetica Neue",Arial,sans-serif;
  		height: 40px;
  		line-height: 40px;
  		outline: 0;
  		overflow: hidden;
  		padding: 0 20px;
  		pointer-events: auto;
  		position: relative;
  		text-align: center;
  		touch-action: manipulation;
  		user-select: none;
  		-webkit-user-select: none;
  		vertical-align: top;
  		white-space: nowrap;
  		width: 10px%;
  		z-index: 9;
  		border: 0;
  		transition: box-shadow .2s;
	}

	button:hover {
  		box-shadow: 5px 5px 5px white;
	}
	body{
					background-image: url("https://thumbs.dreamstime.com/b/woman-accepting-groceries-box-delivery-man-woman-accepting-groceries-box-delivery-man-home-115649762.jpg")
			}	
	</style>
</head>
<body>
	<%@ page import ="java.sql.Connection" %>
	<%@ page import = "java.sql.DriverManager"%>
	<%@ page import ="java.sql.SQLException" %>
	<%@ page import = "java.sql.ResultSet"%>
	<%@ page import = "java.sql.Statement"%>
	
	<header>
	<div style = "background-color: yellow; text-align: center;padding: 10px;">
		<h1 style="color:red; font-size: 50px;">Welcome to Book Your Groceries</h1>
	</div>
	</header>
		
	
	<div style=" padding: 15px; background-color: black;">
			<button type = "button" id="btn1" class="acc">My Account</button> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn2" class ="item">Items</button> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<button type ="button" id="btn3" class="add">Add Items</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn4" class="update">Update Items</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<button type ="button" id ="btn5" class ="remove">Remove Items</button><br>
	</div>
	<div style="margin: auto; text-align: center; background-color: lightblue;padding: 25px;">
				<form method="post" action="search">
					Search:<input style="font-size: 20px; height: 35px;" type ="text" value="" name="sitem" style="font-size: 30px;" required>
					<button type="submit" id ="sbt" class="sbutn">search</button><br><br>
				</form>	
		</div>
	<div id = "search">
		<%
			String st = (String)request.getAttribute("msgSearch");
			if(st != null){
				out.print(st);
			}else{
				out.print("<div style ='margin:auto; background-color: white; width: 600px; height: 150px; padding: 15px'>");
				out.print("<h1 style='color: blue;'>Welcome "+(String)session.getAttribute("usr")+"<br>Lots of Products waiting for you ! Add to Cart</h1>");
				out.print("</div>");
				out.print("<image height=600px width=630px src = 'https://as2.ftcdn.net/v2/jpg/04/14/99/65/1000_F_414996588_b5mITjbpbtbBqFdiSAQZfDRdWV3cNnGo.jpg'>");
			}
		%>
	</div>
	<%! public static String Email=""; %>
	<div name="account" id ="account" class="acc">
			<div style="background-color: white; padding: 25px;">
			<h2>My Account</h2>
			
			<div style="">
				<image height="100" width="100" src ='https://www.shutterstock.com/image-vector/my-account-profile-user-icon-600w-1700343232.jpg'>
			</div>
		
			<div style="">
				<%
					String name = (String)session.getAttribute("usr");
					out.print("<span><b>Shopkeeper name  :</b></span>"+name+"<br>");
				%><br><br>
				<%
					String Password = (String)session.getAttribute("pass");
					out.print("<b>Password  :</b>"+Password+"<br>");
				%><br><br>
		
				<%
					String url = "jdbc:mysql://localhost:3306/ITassign";
					String usr = "mahendar";
					String password = "Medha@2020";
					try(Connection con = DriverManager.getConnection(url,usr,password);){
						String query ="select * from Seller where Name = '"+name+"' and Password = '"+Password+"';";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
						if(r.next()){
							Email = r.getString(4);
							session.setAttribute("eid",Email);
							out.print("<b>Email id :</b>"+session.getAttribute("eid"));
						}
						con.close();	
					}catch(SQLException e){
						out.print("can't find email");
					}
				%>
			</div>
			</div>
	</div>
	
	<div name="items" id ="item" class="item">
			
			<% 
				try(Connection con = DriverManager.getConnection(url,usr,password);){
					String query ="select * from Items;";
					Statement s = con.createStatement();
					ResultSet r = s.executeQuery(query);
					
					while(r.next()){
						String Item_name = r.getString(2);
						String link = r.getString(4);
						double price = r.getDouble(3);
						int stock = r.getInt(5);
						String desc = r.getString(6);
						int Discount = r.getInt(7);
						out.print("<div class = 'div1'>");
								out.print("<div class = 'div2'>");
									out.print("<span><font color='blue'><b>Id : </b></font>"+r.getInt(1)+"</span><br>");
									out.print("<span><font color='blue'><b>Name : </b></font>"+Item_name+"</span><br>");
									out.print("<span><font color='blue'><b>Price : </b></font>"+price+"</span><br>");
									out.print("<span><font color='blue'><b>stock : </b></font>"+stock+"</span><br>");
									out.print("<span><font color='blue'><b>Discount : </b></font>"+Discount+"%</span><br>");
									out.print("<span><font color='blue'><b>Description  :</b></font>"+desc+"</span>");
								out.print("</div>");
							
								out.print("<div class='div3'>");
									out.print("<image height=100px width=100px align=right border='2px solid black' src = '"+link+"' alt = 'cannot load the image'> ");
								out.print("</div>");
								
						
						out.print("</div>");
							
					}
					
					con.close();	
			}catch(SQLException e){
				out.print("can't connect to Database");
			}
		%>
		
	</div>
	
	<div id="add" class="add">
		
		<div style="background-color: white; padding: 25px; width">
		<h2>Enter Details</h2>
				<form id="addition" name ="addition" method="post" action ="add">
					<input  type = "text"  	placeholder="Item Name :" 	name ="niname" id="niname" value="" required><br><br>
					<input 	type = "number" placeholder="Price :" 	  	name ="nprice" id="nprice" value="" required><br><br>
					<input  type = "text" 	placeholder="Image Link :" 	name ="nlink"  id="nlink" value="" 	required><br><br>
					<input 	type = "number" placeholder="Stock :" 		name ="nstock" id="nstock" value="" required><br><br>
					<input 	type = "number" placeholder="Discount :" 	name ="ndiscount" id="ndiscount" value="" required><br><br>
					<input 	type = "text" 	placeholder="Description :" name ="ndesc"  id="ndesc" value=""  required><br><br>
					<button type="submit">Add Item</button>
					<div>
						<%
							if(request.getAttribute("msgAdd") == null){
								;
							}else{
								out.print(request.getAttribute("msgAdd"));
							}
						%>
					</div>
			</form>
		</div>
	</div>
	<div id="update" class="update">
		<form id="updatation"   name ="updation" method="post" action ="update">
					<h2>Enter Item id</h2>
					<input 	type="number" 	placeholder="Item id :" 	name = "id" 	id="id" 	value="" required><br><br>
					<h2>Enter the field which you want to update</h2><br>
					<input 	type = "text"  	placeholder="Item Name :" 	name ="uiname" 	id="uiname" value="" ><br><br>
					<input 	type = "number" placeholder="Price :" name ="uprice" 		id="uprice" value="" ><br><br>
					<input  type = "text" 	placeholder="Image Link :" 	name ="ulink"  	id="ulink" 	value="" ><br><br>
					<input 	type = "number" placeholder="Stock :" 		name ="ustock" 	id="ustock" value="" ><br><br>
					<input 	type = "number" placeholder="Discount :" 	name ="udiscount" id="udiscount" value="" ><br><br>
					<input 	type = "text" 	placeholder="Description :" name ="udesc"  	id="udesc" 	value=""><br><br>
					
					<button type="submit">Update Item</button>
					<div>
						<%
							if(request.getAttribute("msgUpdate") == null){
								;
							}else{
								out.print(request.getAttribute("msgUpdate"));
							}
						%>
					</div>
			</form>
	</div>
	<div id="remove" class="remove">
		<form id="removal" id="removal"  method ="post" action = "remove">
					<h2>Enter Item id:</h2>
					<input type = "number"  placeholder="Item Id :" name ="rid" id="rid" value="" required><br><br>
					<br><button type="submit">Remove</button>
					<div>
						<%
							if(request.getAttribute("msgRemove") == null){
								;
							}else{
								out.print(request.getAttribute("msgRemove"));
							}
						%>
					</div>
			</form>	
	</div>
	<script>
		$(document).ready(function(){
	    	// To display My account
	    	$(".acc").click(function(){
	      		$("#account").css("display", "block");
	        	$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#remove").css("display", "none");
	      		$("#search").css("display", "none");
	    	});
	    
	    	// To display Items
	    	$(".item").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "block");
	      		$("#add").css("display", "none");
	      		$("#update").css("dispaly", "none");
	      		$("#remove").css("display", "none");
	      		$("#search").css("display", "none");
	    	});
	    	
	    	//To display add
	  		$(".add").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "block");
	      		$("#update").css("display", "none");
	      		$("#remove").css("display", "none");
	      		$("#search").css("display", "none");
	    	});
	    	
	    	//To display Update
	  		$(".update").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "block");
	      		$("#remove").css("display", "none");
	      		$("#search").css("display", "none");
	    	});
	    	
	    	//To display remove
	  		$(".remove").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#remove").css("display", "block");
	      		$("#search").css("display", "none");
	    	});
	    	
	    	//To seach display
	  		$(".sbutn").load(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#remove").css("display", "none");
	      		$("#search").css("display", "block");
	    	});
		});
	
	</script>
	<footer>
		<div style = "background-color: black; padding: 10px;">
				<h2 style="text-align: center; color:white; font-size: 25px;">Project Created By Mahendar Byra</h2>
				<div>
				<h2 style="color: white;">Contact Details:</h2>
				<a href = "https://facebook.com/"><image height = 35px width = 35px src = "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/768px-Facebook_Logo_%282019%29.png"></a>
				&emsp;
				<a href = "https://instagram.com/"><image height = 35px width = 35px src = "https://www.freepnglogos.com/uploads/logo-ig-png/logo-ig-stunning-instagram-logo-vector-download-for-new-7.png"></a>
				&emsp;
				<a href = "https://twitter.com/"><image height = 35px width = 35px src = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Twitter-logo.svg/800px-Twitter-logo.svg.png"></a>
				&emsp;
				<a href = "https://www.google.com/intl/en-GB/gmail/about/"><image height = 35px width = 35px src = "https://mailmeteor.com/logos/assets/PNG/Gmail_Logo_512px.png"></a>
				<br><image height=35px width = 35px src = "https://w7.pngwing.com/pngs/367/604/png-transparent-blue-icon-telephone-web-blue-phone-blue-web-blue-telephone.png">
				&emsp; <font size ='3px' color = 'white'>991-134-5347</font><br><br>
				<h2 style="color: white;">Address:</h2>
				<font size ='3px' color = 'white'>BYC store  Mehdipatnam  Hyderabad pincode :50231</font>
				</div>
				
		</div>
	</footer>
</body>
</html>
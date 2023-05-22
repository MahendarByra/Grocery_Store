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
		#phistory{
			border: 2px solid black;
			background-color: white	;
			width: 95%;
			height: 75%;
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
		
		#buyer{
			width: 100%;
			height: 100%;
			margin: auto;
			position: relative;	
			display: none;
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
			width: 800px;
			height: 170px;
			background-color: white;
			float: left;
		}
		.div3{
			width: 100px;
			height: 100px;
			background-color: white;
			float: left;
		}
		/*.div4{
			padding: 15px;
			border: 2px solid black;
			width: 95%;
			height: 170px;
			text-align: left;
			background-color: white;
			margin: auto;
		}
		.div5{
			padding: 5px;
			width: 700px;
			height: 100px;
			background-color: white;
			float: left;
		}
		.div6{
			width: 100px;
			height: 100px;
			background-color: white;
			float: left;
		}*/
		
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
  		box-shadow: 5px 5px 5px blue;
	}
	body{
			background-image: url("https://www.realsimple.com/thmb/aJDUpqoFWZXJdFvU5XPkjjmAV7c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/impulse-buying-2000-d569eacebb0c48fa8766965d0352151c.jpg");
			background-repeat: no-repeat;
  			background-size: cover;		
		}
	table{
		border: 2px solid black;
		text-align: center;
		
	}
	td{
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		
	}
	tr:nth-child(even){
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		background-color: lightblue;
	}
	tr:nth-child(odd){
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		background-color: violet;
	}
	th{
		border: 2px solid black;
		text-align: center;
		border-radius: 5px;
		background-color: orange;
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
			<button type = "button" id="btn1" class="acc"><i class="fa fa-user-circle" aria-hidden="true"></i><%=session.getAttribute("usr") %></button> &emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn2" class ="item">Items</button> &emsp;&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn3" class="add">Add Items</button>&emsp;&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn4" class="update">Update Items</button>&emsp;&emsp;&emsp;&emsp;
			<button type = "button" id="btn5" class ="phis">Purchase History</button>&emsp;&emsp;&emsp;
			<button type = "button" id="btn6" class ="regUsers">Registered Users</button>&emsp;&emsp;&emsp;
			<a href = "Interface.jsp" alt="can't load file"><button type = "button" id="btn7" class ="Logout">Log Out</button><br></a>
			
	</div>
	<div style="margin: auto; text-align: center; background-color: lightblue;padding: 25px;">
				<form method="post" action="search">
					Search:<input style="font-size: 20px; height: 35px;" type ="text" value="<%
							String searchbar=(String)session.getAttribute("sitemname");
							if(searchbar != null){
								out.print(searchbar);
							}
							session.setAttribute("sitemname",null);
					%>" name="sitem" id ="sitem" style="font-size: 30px;" required>
					<button type="submit" id ="sbt" class="sbutn">search</button><br><br>
				</form>	
		</div>
	<div id = "search">
		<%
			String st = (String)session.getAttribute("msgSearch");
			if(st != null){
				out.print(st);
			}else{
				
				out.print("<div style ='margin:auto; background-color: white; width: 600px; height: 150px; padding: 15px'>");
				out.print("<h1 style='color: blue;'>Welcome "+(String)session.getAttribute("usr")+"<br></h1>");
				out.print("</div>");
				out.print("<image height=600px width=630px src = 'https://as2.ftcdn.net/v2/jpg/04/14/99/65/1000_F_414996588_b5mITjbpbtbBqFdiSAQZfDRdWV3cNnGo.jpg'>");
			}
			session.setAttribute("msgSearch",null);
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
									out.print("<image height=150px width=150px align=right border='2px solid black' src = '"+link+"' alt = 'cannot load the image'> ");
								out.print("</div>");
								
								out.print("<div style='float:right;'>");
								out.print("<form id='removal' method ='post' action = 'removeProduct'>");
								out.print("<h2>Remove Product</h2>");
								out.print("<input type = 'hidden'  placeholder='Item Id :' name ='rid' id='rid' value='"+r.getInt(1)+"'	>");
								out.print("<button type='submit'>Remove</button>");
								out.print("</form>");
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
				<form id="addition" onsubmit='add()' name ="addition" method="post" action ="add">
					<input  type = "text"  	placeholder="Item Name :" 	name ="niname" id="niname" value="" ><br><br>
					<input 	type = "number" placeholder="Price :" 	  	name ="nprice" id="nprice" value="" ><br><br>
					<input  type = "text" 	placeholder="Image Link :" 	name ="nlink"  id="nlink" value="" 	><br><br>
					<input 	type = "number" placeholder="Stock :" 		name ="nstock" id="nstock" value="" ><br><br>
					<input 	type = "number" placeholder="Discount :" 	name ="ndiscount" id="ndiscount" value="" ><br><br>
					<input 	type = "text" 	placeholder="Description :" name ="ndesc"  id="ndesc" value=""  ><br><br>
					<button type="submit">Add Item</button>
					<div>
						<%
							if(session.getAttribute("msgAdd") == null){
								;
							}else{
								out.print(session.getAttribute("msgAdd"));
								session.setAttribute("msgAdd",null);
							}
						%>
					</div>
			</form>
		</div>
	</div>
	<div id="update" class="update">
		<form id="updatation"  onsubmit = "update()" name ="updation" method="post" action ="update">
					<h2>Enter Item id</h2>
					<input 	type="number" 	placeholder="Item id :" 	name = "id" 	id="id" 	value="" ><br><br>
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
							if(session.getAttribute("msgUpdate") == null){
								;
							}else{
								out.print(session.getAttribute("msgUpdate"));
								session.setAttribute("msgUpdate",null);
							}
						%>
					</div>
			</form>
	</div>
	<div id="phistory" class="phistory">
				<div>
				<h1>Purchase History</h1>
				<button id ="bts1">Search a User History</button>
				<button id ="bts2">Search in a Duration</button>
				<button id ="bts3">Search on date</button><br><br>
				</div>
				<div id="usrbtn" style ="display: block">
					<div>
					<form method="post"  onsubmit = "usrSearch()" action="searchUser">
						Buyer Id:<br>
						<input type="number" name="bid" id ="bid" value=""><br><br>
						<button type = "submit">Search</button>
					</form>
				
				 		
						<%
								int id = -1;
								if(session.getAttribute("uvid") != null){
									id = (int)session.getAttribute("uvid");
									session.setAttribute("uvid", null);
								}
									
								if(id != -1 ){
								try(Connection con = DriverManager.getConnection(url,usr,password);){
									
									String q11="select * from User where Id = "+id;
									Statement s11 = con.createStatement();
									ResultSet r11 = s11.executeQuery(q11);
									
									r11.next();
									out.print("<h2>Username: "+r11.getString(2)+"</h2>");
									out.print("<h2>Orders: </h2>");
										String query ="select * from orders where buyer_id = "+id;
										Statement s = con.createStatement();
										ResultSet r = s.executeQuery(query);
										int count = 0;
										while(r.next()){
											count++;
												int item_id = r.getInt(5);
								
												String q2 = "select * from Items where Item_id = "+item_id;
												Statement s2 = con.createStatement();
												ResultSet r2 = s2.executeQuery(q2);
												r2.next();
								
												String item_name = r2.getString(2);
												int price = r2.getInt(3);
												int desc_prctg = r2.getInt(7); 
												int qty = r.getInt(6);
												int tp = r.getInt(7);
												int disc_price = desc_prctg*price/100;
												String imglink = r2.getString(4);
												out.print("<div style ='padding: 20px; border:2px solid black; height:170px;'>\n");
														
														out.print("<div style ='float: left; position:relative; width:75%; '>\n");
														out.print("<span><b><font color='blue'>Order Id :</font> </b>"+r.getInt(1)+"</span><br>\n");
														out.print("<span><b><font color='blue'>Item id:</font> </b>"+item_id+"</span><br>\n");
														out.print("<span><b><font color='blue'>Name :</font> </b>"+item_name+"</span><br>\n");
														out.print("<span><b><font color='blue'>Price :</font> </b>"+price+"</span><br>\n");
														out.print("<span><b><font color='blue'>Quantity  :</font></b>"+qty+"</span><br>\n");
														out.print("<span><b><font color='blue'>total price  :</font></b>"+tp+"</span><br>\n");
														out.print("<span><b><font color='blue'>Discount Price :</font> </b>");
														out.print(disc_price+"</span><br>\n");
														out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(3)+"</span><br>\n");
														out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(2)+"</span><br>\n");
														out.print("</div>\n");
														
							
														out.print("<div style='float: right;position:relative;width:25%;'>\n");
														out.print("<image height=100px width=100px align=right border='2px solid black' src = '"+imglink+"' alt = 'cannot load the image'>\n ");
														out.print("</div>\n");
												
										
								
												out.print("</div>\n");
												out.print("<br>");
									
									}
									if(count == 0){
										out.print(r11.getString(2)+" ordered nothing");
									}else{
										out.print(r11.getString(2)+" ordered "+ count+" products");
									}
						
									con.close();	
						}catch(SQLException e){
								out.print("Invalid User id");
						}
						}
				%>		
			
			</div>
			</div>
			<div id="datebtn" style="display:none">
					<form method ="post" onsubmit = "ValidateTwodate()" action="twodateSearch">
						Initial Date:<br>
						<input type="date" name="isd" id="isd" value=""><br><br>
						Final date:<br>
						<input type="date" name="fsd" id ="fsd" value=""><br><br>
						<button type = "submit">Search</button>	
					</form>
					<%
								try(Connection con = DriverManager.getConnection(url,usr,password);){
									
										String date1="" ,date2 ="";
										if(session.getAttribute("d1") != null && session.getAttribute("d2") != null){
												date1 = (String)session.getAttribute("d1");
												date2 = (String)session.getAttribute("d2");
												session.setAttribute("d1", null);
												session.setAttribute("d2", null);
										}
										
										String query = "select * from orders where order_date between '"+date1+"' and '"+date2+"' ;";
										Statement s = con.createStatement();
										ResultSet r = s.executeQuery(query);
										int count =0;
										while(r.next()){
												count++;
												int item_id = r.getInt(5);
								
												String q2 = "select * from Items where Item_id = "+item_id;
												Statement s2 = con.createStatement();
												ResultSet r2 = s2.executeQuery(q2);
												r2.next();
								
												String item_name = r2.getString(2);
												int price = r2.getInt(3);
												int desc_prctg = r2.getInt(7); 
												int qty = r.getInt(6);
												int tp = r.getInt(7);
												int disc_price = desc_prctg*price/100;
												String imglink = r2.getString(4);
												out.print("<div style ='padding: 20px; border:2px solid black; height:170px;'>\n");
														
														out.print("<div style ='float: left; position:relative; width:75%; '>\n");
														out.print("<span><b><font color='blue'>Order Id :</font> </b>"+r.getInt(1)+"</span><br>\n");
														out.print("<span><b><font color='blue'>Item id:</font> </b>"+item_id+"</span><br>\n");
														out.print("<span><b><font color='blue'>Name :</font> </b>"+item_name+"</span><br>\n");
														out.print("<span><b><font color='blue'>Price :</font> </b>"+price+"</span><br>\n");
														out.print("<span><b><font color='blue'>Quantity  :</font></b>"+qty+"</span><br>\n");
														out.print("<span><b><font color='blue'>total price  :</font></b>"+tp+"</span><br>\n");
														out.print("<span><b><font color='blue'>Discount Price :</font> </b>");
														out.print(disc_price+"</span><br>\n");
														out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(3)+"</span><br>\n");
														out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(2)+"</span><br>\n");
														
														out.print("</div>\n");
							
														out.print("<div style='float: right;position:relative;width:25%;'>\n");
														out.print("<image height=100px width=100px align=right border='2px solid black' src = '"+imglink+"' alt = 'cannot load the image'>\n ");
														out.print("</div>\n");
												
										
								
												out.print("</div>\n");
												out.print("<br>");
									
									}	
									if(count ==0){
										out.print("No items ordered between "+date1+" and "+date2);
									}else{
										out.print(count+" items ordered between "+date1+" and "+date2);
									}
						
									con.close();
									
										
						}catch(SQLException e){
								//out.print("Connection error");
						}
						
				%>		
			</div>
			<div id="ondate" style="display:none;">
					<form method="post" onsubmit ="singleDate()" action="ondateSearch">
						Date:<br>
						<input type="date" name="odate" id="odate" value=""><br><br>
						<button type = "submit">Search</button>	
					</form>
						<%
							try(Connection con = DriverManager.getConnection(url,usr,password);){
									
										String Date1="";
										if(session.getAttribute("singleDate") != null){
												Date1 = (String)session.getAttribute("singleDate");
												session.setAttribute("singleDate", null);
												
										}
										
										String query = "select * from orders where order_date ='"+Date1+"' ;";
										Statement s = con.createStatement();
										ResultSet r = s.executeQuery(query);
										int count = 0;
										while(r.next()){
												count++;
												int item_id = r.getInt(5);
								
												String q2 = "select * from Items where Item_id = "+item_id;
												Statement s2 = con.createStatement();
												ResultSet r2 = s2.executeQuery(q2);
												r2.next();
								
												String item_name = r2.getString(2);
												int price = r2.getInt(3);
												int desc_prctg = r2.getInt(7); 
												int qty = r.getInt(6);
												int tp = r.getInt(7);
												int disc_price = desc_prctg*price/100;
												String imglink = r2.getString(4);
												out.print("<div style ='padding: 20px; border:2px solid black; height:170px;'>\n");
														
														out.print("<div style ='float: left; position:relative; width:75%; '>\n");
														out.print("<span><b><font color='blue'>Order Id :</font> </b>"+r.getInt(1)+"</span><br>\n");
														out.print("<span><b><font color='blue'>Item id:</font> </b>"+item_id+"</span><br>\n");
														out.print("<span><b><font color='blue'>Name :</font> </b>"+item_name+"</span><br>\n");
														out.print("<span><b><font color='blue'>Price :</font> </b>"+price+"</span><br>\n");
														out.print("<span><b><font color='blue'>Quantity  :</font></b>"+qty+"</span><br>\n");
														out.print("<span><b><font color='blue'>total price  :</font></b>"+tp+"</span><br>\n");
														out.print("<span><b><font color='blue'>Discount Price :</font> </b>");
														out.print(disc_price+"</span><br>\n");
														out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(3)+"</span><br>\n");
														out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(2)+"</span><br>\n");
														out.print("</div>\n");
							
														out.print("<div style='float: right;position:relative;width:25%;'>\n");
														out.print("<image height=100px width=100px align=right border='2px solid black' src = '"+imglink+"' alt = 'cannot load the image'>\n ");
														out.print("</div>\n");
												
										
								
												out.print("</div>\n");
												out.print("<br>");
									
									}	
									if(count == 0){
										out.print("No Items Ordered  on"+Date1);
									}else{
										out.print(count+" Items Ordered  on"+Date1);
									}
									con.close();
										
						}catch(SQLException e){
								//out.print("Connection error");
						}
						%>
			</div>
	</div>
	
	<div id ="buyer">
		<div style="margin: auto; background-color: white; text-align: center; width: 600px; height: 500px; padding:15px;">
			<%
			try(Connection con = DriverManager.getConnection(url,usr,password);){
				String query ="select * from User;";
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery(query);
				
				out.print("<h1>Registered Users</h1>");
				out.print("<table>");
				out.print("<th>Id</th>");
				out.print("<th>Name</th>");
				out.print("<th>Password</th>");
				out.print("<th>Email</th>");
				while(r.next()){
					out.print("<tr>");
					out.print("<td>"+r.getInt(1)+"</td>");
					out.print("<td>"+r.getString(2)+"</td>");
					out.print("<td>"+r.getString(3)+"</td>");
					out.print("<td>"+r.getString(4)+"</td>");
					out.print("</tr>");	
				}
				out.print("</table>");
				con.close();	
		}catch(SQLException e){
			out.print("can't connect to Database");
		}
			
			%>
		</div>	
	</div>
	<script>
		$(document).ready(function(){
	    	// To display My account
	    	$(".acc").click(function(){
	      		$("#account").css("display", "block");
	        	$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#phistory").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#buyer").css("display", "none");
	      		$("#ondate").css("display","none")
	      		$
	    	});
	    
	    	// To display Items
	    	$(".item").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "block");
	      		$("#add").css("display", "none");
	      		$("#update").css("dispaly", "none");
	      		$("#phistory").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#buyer").css("display", "none");
	      		$("#ondate").css("display","none")
	    	});
	    	
	    	//To display add
	  		$(".add").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "block");
	      		$("#update").css("display", "none");
	      		$("#phistory").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#buyer").css("display", "none");
	      		$("#ondate").css("display","none")
	    	});
	    	
	    	//To display Update
	  		$(".update").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "block");
	      		$("#phistory").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#buyer").css("display", "none");
	      		$("#ondate").css("display","none")
	    	});
	    	
	    	//To display remove
	  		$(".phis").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#phistory").css("display", "block");
	      		$("#search").css("display", "none");
	      		$("#buyer").css("display", "none");
	      		$("#ondate").css("display","none")
	    	});
	    	
	  		$("#bts1").click(function(){
	  	    		$("#usrbtn").css("display", "block");	
	  				$("#datebtn").css("display", "none");
	  				$("#account").css("display", "none");
	  	      		$("#item").css("display", "none");
	  	      		$("#add").css("display", "none");
	  	      		$("#update").css("display", "none");
	  	      		$("#phistory").css("display", "block");
	  	      		$("#search").css("display", "none");
	  	      		$("#buyer").css("display", "none");
	  	      		$("#ondate").css("display","none")
	  			});
	  	    //search button date
	  	    	$("#bts2").click(function(){
	  	    		$("#usrbtn").css("display", "none");	
	  				$("#datebtn").css("display", "block");
	  				$("#account").css("display", "none");
	  	      		$("#item").css("display", "none");
	  	      		$("#add").css("display", "none");
	  	      		$("#update").css("display", "none");
	  	      		$("#phistory").css("display", "block");
	  	      		$("#search").css("display", "none");
	  	      		$("#buyer").css("display", "none");
	  	      		$("#ondate").css("display","none")
	  			});
	  	    	$("#bts3").click(function(){
	  	    		$("#usrbtn").css("display", "none");	
	  				$("#datebtn").css("display", "none");
	  				$("#account").css("display", "none");
	  	      		$("#item").css("display", "none");
	  	      		$("#add").css("display", "none");
	  	      		$("#update").css("display", "none");
	  	      		$("#phistory").css("display", "block");
	  	      		$("#search").css("display", "none");
	  	      		$("#buyer").css("display", "none");
	  	      		$("#ondate").css("display","block")
	  			});
	  	    //to regUsers
	  		$(".regUsers").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#phistory").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#buyer").css("display", "block");
	      		$("#ondate").css("display","none")
	    	});
	  		
	    	//To seach display
	  		$(".sbutn").load(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#add").css("display", "none");
	      		$("#update").css("display", "none");
	      		$("#phistory").css("display", "none");
	      		$("#search").css("display", "block");
	      		$("#buyer").css("display", "none");
	      		$("#ondate").css("display","none")
	    	});
	    	
	  		
		});
	
		function add(){
			var a = document.getElementById("niname").value;
			var b = document.getElementById("nprice").value;
			var c = document.getElementById("nlink").value;
			var d = document.getElementById("nstock").value;
			var e = document.getElementById("ndiscount").value;
			var f = document.getElementById("ndesc").value;
			
			if(a==""){
				alert("please enter item name");
			}
			if(b==""){
				alert("please enter item price");
			}
			if(c==""){
				alert("please enter item image link");
			}
			if(d==""){
				alert("please enter item stock");
			}
			if(e==""){
				alert("please enter item discount");
			}
			if(f==""){
				alert("please enter item descrption");
			}
			return;
		}
		
		function update(){
			var x = document.getElementById("id").value;
			if(x==""){
				alert("please enter item id");
			}else{
				if(NaN(x)){
					alert("please enter a number");
				}
			}
			return;
		}
		
		function usrSearch(){
			var x = document.getElementById("bid").value;
			if(x==""){
				alert("please enter buyer id");
			}else{
				if(NaN(x)){
					alert("please enter a number");
				}
			}
			return;
		}
		function ValidateTwodate(){
			var x = document.getElementById("isd").value;
			var y = document.getElementById("fsd").value;
			if(x ==""){
				alert("please enter start date");
			}
			if(y ==""){
				alert("please enter end date");
			}
			return;
		}
		
		function singleDate(){
			var x = document.getElementById("odate").value;
			if(x==""){
					alert("please enter date");
			}
			return;
		}
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
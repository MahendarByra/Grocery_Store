<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Buyer Home</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style>
				
				#account{
						background-color: white;
						width: 500px;
						height: 400px;
						margin: auto;
						display: none;
						text-align: center;
							
				}
				
				#item{	
						width: 100%;
						height: 100%;
						margin: auto;
						padding: 15px;	
						display: none;
				}
		
				#cart{
						width: 100%;
						height: 100%;
						margin: auto;
						position: relative;	
						display: none;
				}
				
				#orders{
						width: 100%;
						height: 100%;
						margin: auto;
						position: relative;	
						display: none;
						padding: 25px;
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
						height: 200px;
						background-color: white;
						
				}
		
				.div2{
						padding: 5px;
						width: 750px;
						height: 200px;
						background-color: white;
						text-align: left;
						float: left;
				}
		
				.div3{
						width: 100px;
						height: 100px;
						background-color: white;
						float: left;
				}
		
				.div4{
						padding: 15px;
						border: 2px solid black;
						width: 95%;
						height: 170px;
						background-color: white;
						margin: auto;
				}
		
				.div5{
						padding: 5px;
						width: 550px;
						height: 170px;
						background-color: white;
						float: left;
				}
		
				.div6{
						width: 150px;
						height: 150px;
						background-color: white;
						float: left;
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
					background-image: url("https://thumbs.dreamstime.com/b/woman-accepting-groceries-box-delivery-man-woman-accepting-groceries-box-delivery-man-home-115649762.jpg");
  					background-repeat: no-repeat;
  					background-size: cover;
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
				<button type = "button" id="btn1" class="acc">My Account</button> &emsp;&emsp;&emsp;&emsp;&emsp;
																				&emsp;&emsp;&emsp;&emsp;&emsp;	
				<button type = "button" id="btn2" class ="item">Items</button> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
																			
				<button type = "button" id="btn3" class="cart">My Cart</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<button type = "button" id="btn4" class="orders">My Orders</button>&emsp;&emsp;&emsp;&emsp;
				<a href="Interface.jsp" alt="can't load page"><button>Log out</button></a><br>
		</div>
		
		<div style="margin: auto; text-align: center; background-color: lightblue;padding: 25px;">
				<form method="get" action="Search">
						<input type = "hidden" name = "aid" value ="<%out.print(Email); %>">
						Search:<input style="font-size: 20px; height: 35px;" type ="text" value="<%
							String searchbaru=(String)session.getAttribute("sitemnamebyusr");
							if(searchbaru != null){
								out.print(searchbaru);
							}
							session.setAttribute("sitemnamebyusr",null);
						%>" name="sitem" style="font-size: 30px;" required>
						<button type="submit" id ="sbt" class="sbutn">search</button><br><br>
				</form>	
		</div>
		<div id = "search">
		<%
				String st = (String)session.getAttribute("msgsearch");
				if(st != null){
						out.print(st);
				}else{
						out.print("<div style ='margin:auto; background-color: white; width: 600px; height: 150px; padding: 15px'>");
						out.print("<h1 style='color: blue'>Welcome "+(String)session.getAttribute("usr")+"<br>Lots of Products waiting for you ! Add to Cart</h1>");
						out.print("</div>");
						out.print("<image height = 600px width=630px src = 'https://as2.ftcdn.net/v2/jpg/04/14/99/65/1000_F_414996588_b5mITjbpbtbBqFdiSAQZfDRdWV3cNnGo.jpg'>");
				
				}
				session.setAttribute("msgsearch",null);
		%>
	
	</div>
			<%! public static String Email="";
				public static int User_id = -1;
				public static int Item_id = -1;
				%>
	
			<div name="account" id ="account" class="acc">
					<h2>My Account</h2>
			
					<div style="">
							<image height="100" width="100" src ='https://www.shutterstock.com/image-vector/my-account-profile-user-icon-600w-1700343232.jpg'>
					</div>
		
					<div style="">
							<%
									String name = (String)session.getAttribute("usr");
									out.print("<span><b>Username  :</b></span>"+name+"<br>");
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
											String query ="select * from User where Name = '"+name+"' and Password = '"+Password+"';";
											Statement s = con.createStatement();
											ResultSet r = s.executeQuery(query);
											
											if(r.next()){
													Email = r.getString(4);
													out.print("<b>Email id :</b>"+Email+"<br><br>");
													User_id = r.getInt(1);
													out.print("<b>Id: </b>"+User_id);
													
											}
											con.close();	
									}catch(SQLException e){
											out.print("can't find email");
									}
							%>
				</div>
	</div>
	
	<div name="items" id ="item" class="item">
			
			<% 
					try(Connection con = DriverManager.getConnection(url,usr,password);){
							String query ="select * from Items;";
							Statement s = con.createStatement();
							ResultSet r = s.executeQuery(query);
					
							while(r.next()){
									int Item_id = r.getInt(1);
									String Item_name = r.getString(2);
									String link = r.getString(4);
									int price = r.getInt(3);
									int stock = r.getInt(5);
									String desc = r.getString(6);
									int Discount = r.getInt(7);
									out.print("<div class = 'div1'>");
											out.print("<div class = 'div2'>");
													out.print("<span><b><font color='blue'>Id : </font></b>"+Item_id+"</span><br>");
													out.print("<span><b><font color='blue'>Name : </font></b>"+Item_name+"</span><br>");
													out.print("<span><b><font color='blue'>Price : </font></b>"+price+"</span><br>");
													out.print("<span><b><font color='blue'>stock : </font></b>"+stock+"</span><br>");
													out.print("<span><b><font color='blue'>Discount  :</font></b>"+Discount+"%</span><br>");
													out.print("<span><b><font color='blue'>Description  :</font></b>"+desc+"</span>");
											out.print("</div>");
							
											out.print("<div class='div3'>");
													out.print("<image height=150px width=150px align=right border='2px solid black' src = '"+link+"' alt = 'cannot load the image'> ");
											out.print("</div>");
							
											out.print("<div style='float: right;padding: 20px;'>");
													out.print("<h2>Add to Cart</h2>");
													
													out.print("<form method = 'post' onsubmit='addToC()' action ='addCart' >");
															out.print("<input type = 'hidden' name = 'Email'      value ='"+Email+"'>");
															out.print("<input type = 'hidden' name = 'Item_id'  value = '"+Item_id+"'><br>");
															out.print("<input type = 'number' name = 'Quantity' id='qtty' placeholder='Quantity'	value =''><br><br>");
															out.print("<button type='submit'>AddToCart</button>");
													out.print("</form>");
												
													int id = -1;
													if(session.getAttribute("id") != null){
															id = (int)session.getAttribute("id");	
													}
													if(id == Item_id){
															if(session.getAttribute("msgCart") == null){
																		;
															}
															else{
																	out.print(session.getAttribute("msgCart"));
																	session.setAttribute("msgCart", null);
															}
													}
											out.print("</div>");
								
											
									out.print("</div>");
									//out.print("<br>");out.print("<br>");	
							}
					
							con.close();	
					}catch(SQLException e){
							out.print("can't connect to Database");
					}
			%>
		
		
	</div>
	
	<div style = "padding: 15px;"name="cart" id="cart" class="cart">
				<div style = "margin: auto; width: 400px ;text-align: center;background-color: violet; padding: 15px;">
					<h1 style ="color: black;">My Cart</h1>
				</div><br>
				<% 
						try(Connection con = DriverManager.getConnection(url,usr,password);){
						String query ="select * from tblcart where customer_id = "+User_id;
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
						int Grand_Total =0;
						while(r.next()){
								int Cart_id = r.getInt(1);
								int discount_price = r.getInt(2);
								int quantity = r.getInt(3);
								int total_price = r.getInt(4);
								int product_id = r.getInt(6);
								String Image = r.getString(8);
						
								String q2 ="select * from Items where Item_id = "+product_id+";";
								Statement s2 = con.createStatement();
								ResultSet r2 = s2.executeQuery(q2);
								r2.next();
								out.print("<div class = 'div4'>");
										out.print("<div class = 'div5'>");
												out.print("<span><b><font color='blue'>Id :</font> </b>"+Cart_id+"</span><br>");
												out.print("<span><b><font color='blue'>Item id:</font> </b>"+r2.getInt(1)+"</span><br>");
												out.print("<span><b><font color='blue'>Name :</font> </b>"+r2.getString(2)+"</span><br>");
												out.print("<span><b><font color='blue'>Price :</font> </b>"+r2.getInt(3)+"</span><br>");
												out.print("<span><b><font color='blue'>Discount Price :</font> </b>"+discount_price+"</span><br>");
												out.print("<span><b><font color='blue'>Quantity  :</font></b>"+quantity+"</span><br>");
												out.print("<span><b><font color='blue'>total price  :</font></b>"+total_price+"</span>");
												Grand_Total += total_price;
										out.print("</div>");
							
										out.print("<div class='div6'>");
												out.print("<image height=150px width=150px align=right border='2px solid black' src = '"+Image+"' alt = 'cannot load the image'> ");
												out.print("</div>");
												
												out.print("<div style='float: right ;padding: 10px;'>");
												out.print("<h2>Remove from  Cart</h2>");
												
												out.print("<form method = 'post' action ='removeCart'>");
														out.print("<input type = 'hidden' name = 'Cid'  value ="+Cart_id+"><br>");
														out.print("<button type='submit'>Remove</button>");
												out.print("</form>");
											out.print("</div>");
								
								out.print("</div>");
									
						}	
						out.print("<br><br>");
						out.print("<div style = 'margin: auto; background-color: white; width: 300px; padding: 15px;'>");
						out.print("<span><h2 style='color:red;'>Total Price : "+Grand_Total+"</h2></span><br>");
						out.print("</div>");
						out.print("<div>");
						out.print("<form method ='post' action='orderItems'>");
						out.print("<input type ='hidden' name='buyerid' value='"+User_id+"'><br><br>");
						out.print("<button type='submit'>Place Order</button>");
						out.print("</form>");
						out.print("</div>");
						con.close();	
				}catch(SQLException e){
						out.print("can't connect to Database");
				}
		%>	
	</div>
	
	<div id="orders">
			<div style = "margin: auto; width: 400px ;text-align: center;background-color: violet; padding: 15px;">
					<h1 style ="color: black;">My Orders</h1>
			</div><br>
			
			<% 
						try(Connection con = DriverManager.getConnection(url,usr,password);){
						String query ="select * from orders where buyer_id = "+User_id;
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
						int grand_Total = 0;
						while(r.next()){
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
								out.print("<div class = 'div4'>\n");
										out.print("<div class = 'div5'>\n");
												out.print("<span><b><font color='blue'>Order Id :</font> </b>"+r.getInt(1)+"</span><br>\n");
												out.print("<span><b><font color='blue'>Item id:</font> </b>"+item_id+"</span><br>\n");
												out.print("<span><b><font color='blue'>Name :</font> </b>"+item_name+"</span><br>\n");
												out.print("<span><b><font color='blue'>Price :</font> </b>"+price+"</span><br>\n");
												
												
												out.print("<span><b><font color='blue'>Quantity  :</font></b>"+qty+"</span><br>\n");
												out.print("<span><b><font color='blue'>total price  :</font></b>"+tp+"</span><br>\n");
												grand_Total += tp;
												out.print("<span><b><font color='blue'>Discount Price :</font> </b>");
												out.print(disc_price+"</span><br>\n");
												out.print("<span><b><font color='blue'>Status  :</font></b>"+r.getString(3)+"</span><br>\n");
												out.print("<span><b><font color='blue'>Order Date  :</font></b>"+r.getString(2)+"</span><br>\n");
											out.print("</div>\n");
							
										out.print("<div class='div6'>\n");
												out.print("<image height=150px width=150px align=right border='2px solid black' src = '"+imglink+"' alt = 'cannot load the image'>\n ");
										out.print("</div>\n");
												
										
								
								out.print("</div>\n");
									
						}
						out.print("<div style='background-color: white; margin: auto; width: 400px;'>");
						out.print("<h1>Total = "+grand_Total+"</h1>");
						out.print("</div>");
						con.close();	
				}catch(SQLException e){
						out.print("can't connect to Database");
				}
		%>	
		<div style="background-color: lightblue; margin: auto; height: 150px;">
		<h1 align="center">message</h1>
			<%
				if(session.getAttribute("msgOrder") != null){
							out.print("<h1 align='center'>"+session.getAttribute("msgOrder")+"</h1>");
							session.setAttribute("msgOrder",null);
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
	      		$("#cart").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#orders").css("display","none");
	    	});
	    
	    	// To display Items
	    	$(".item").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "block");
	      		$("#cart").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#orders").css("display","none");
	    	});
	    	
	    	//To display Cart
	  		$(".cart").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#cart").css("display", "block");
	      		$("#search").css("display", "none");
	      		$("#orders").css("display","none");
	    	});
	  		$(".orders").click(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#cart").css("display", "none");
	      		$("#search").css("display", "none");
	      		$("#orders").css("display","block");
	    	});
	  	//To seach display
	  		$(".sbutn").load(function(){
	        	$("#account").css("display", "none");
	      		$("#item").css("display", "none");
	      		$("#cart").css("display", "none");
	      		$("#search").css("display", "block");
	      		$("#orders").css("display","none");
	    	});
		});
	
		function addToC(){
			var x = document.getElementById("qtty").value;
			if(x==""){
				alert("please enter quantity");
			}else{
				if(NaN(x)){
					alert("please enter number");
				}
			}
			
		}
	</script>
	<footer>
		<div style = "background-color: black; padding: 10px; bottom: 0; position: relative;">
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
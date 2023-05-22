import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import java.util.Scanner;
import java.time.LocalDate;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/addCart")
public class addToCart extends HttpServlet{
		static Scanner sc = new Scanner(System.in);
		private static final long serialVersionUID = 1L;
		public static String title ="";
		
	//Methods  
		public addToCart() {
			super();
		}
		
	    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
			
	    		String Email = request.getParameter("Email");
	    		int Item_id = Integer.parseInt(request.getParameter("Item_id"));
	    		String q = request.getParameter("Quantity");
	    		
	    		if(q.equals("")) {
	    			response.sendRedirect("UserHome.jsp");
	    		}else {
	    		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
	    		HttpSession session = request.getSession();
			
	    		if(addCart(Item_id,Email,Quantity)) {
	    				session.setAttribute("msgCart", title);
	    				session.setAttribute("id", Item_id);
	    				response.sendRedirect("UserHome.jsp");
	    		}else {
	    				session.setAttribute("msgCart", title);
	    				session.setAttribute("id", Item_id);
	    				response.sendRedirect("UserHome.jsp");
	    		}
	    		}
	    }
	    
	    public static boolean addCart(int Item_id,String Email,int qty) {
	    		String url = "jdbc:mysql://localhost:3306/ITassign";
	    		String usr = "mahendar";
	    		String password = "Medha@2020";
	    		try(Connection con = DriverManager.getConnection(url,usr,password);){
						String q2    = "select * from User where Email_id = '"+Email+"';";
						Statement s2 = con.createStatement();
						ResultSet r2 = s2.executeQuery(q2);
						int User_id = -1;
					
						if(r2.next()) {
							User_id = r2.getInt(1);
						}
					
						String q3    = "select * from tblcart where customer_id = "+User_id+" and product_id = "+Item_id;
						Statement s3 = con.createStatement();
						ResultSet r3 = s3.executeQuery(q3);
					
						if(!r3.next()) {
								String template = "INSERT INTO tblcart(discount_price, quantity, total_price ,customer_id, product_id, mrp_price, Image)  values(?,?,?,?,?,?,?)";
								String q1    = "select * from Items where Item_id = "+Item_id+";";
								Statement s1 = con.createStatement();
								ResultSet r1 = s1.executeQuery(q1);
								r1.next();
						
								int mrp_price = r1.getInt(3);
								int Discount_price = r1.getInt(7)*mrp_price/100;
								int total_price = qty*(mrp_price-Discount_price);
								int stock = r1.getInt(5);
								String Image = r1.getString(4);
						
								if(stock >= qty) {
										PreparedStatement  ins = con.prepareStatement(template);
										ins.setInt(1,Discount_price);
										ins.setInt(2,qty);
										ins.setInt(3,total_price);
										ins.setInt(4, User_id);
										ins.setInt(5, Item_id);
										ins.setInt(6,mrp_price);
										ins.setString(7, Image);
										ins.executeUpdate();
						
										title = "new Item added to Cart Successfully";
										con.close();
										return true;
								}else {
										title = "stock is not available";
										con.close();
										return false;
								}
						}else {
								int id = r3.getInt(1);
								String template = "INSERT INTO tblcart(discount_price, quantity, total_price ,customer_id, product_id, mrp_price, Image)  values(?,?,?,?,?,?,?)";
								String q1    = "select * from Items where Item_id = "+Item_id+";";
								Statement s1 = con.createStatement();
								ResultSet r1 = s1.executeQuery(q1);
								r1.next();
						
								int stock = r1.getInt(5);
								int mrp_price = r1.getInt(3);
								int Discount_price = r1.getInt(7)*mrp_price/100;
								
								if(stock >= qty) {
							
										String query ="update tblcart set quantity = quantity+"+qty+",total_price = total_price +"+qty*(mrp_price-Discount_price)+" where id = "+id;
										Statement S = con.createStatement();
										S.executeUpdate(query);
						
										title = "quantity of the item increased by +"+qty;
										con.close();
										return true;
								}else {
										title = "stock is not available";
										con.close();
										return false;
								}
						}
	    		}catch(SQLException e) {
	    				title = "Connection Error";
	    				return false;
	    		}
	    }
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
		}
}

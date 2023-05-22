import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Properties;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Scanner;
import java.time.LocalDate;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class Register extends HttpServlet{
//Instance variables	
		static Scanner sc = new Scanner(System.in);
		private static final long serialVersionUID = 1L;
		public static  String title="";

//Methods  
		public Register() {
				super();
				// TODO Auto-generated constructor stub
		}
    
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				String Name = request.getParameter("nusr");
				String Pass = request.getParameter("npass");
				HttpSession session = request.getSession();
				
				String Category = request.getParameter("ncat");
				String Email = request.getParameter("eid");
				if(Name.equals("") || Pass.equals("") || Email.equals("")) {
					response.sendRedirect("Interface.jsp");
				}else {
				if( addUser(Name,Pass,Category,Email)) {
						if(Category.equals("User")) {
							synchronized(session) {
								session.setAttribute("usr", Name);
								session.setAttribute("pass", Pass);
							}
							response.sendRedirect("UserHome.jsp");
						}else {
							synchronized(session) {
								session.setAttribute("usr", Name);
								session.setAttribute("pass", Pass);
							}
							response.sendRedirect("SellerHome.jsp");
						}
				}else {
						title="email id already exist enter new email id!";
						session.setAttribute("msgRegister", title);
						response.sendRedirect("Interface.jsp");
				}
				}
		
		}
    
	
	
		public static boolean addUser(String name , String Pass , String Category,String Email){
				String url = "jdbc:mysql://localhost:3306/ITassign";
				String usr = "mahendar";
				String password = "Medha@2020";
		
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						if(Category.equals("User")) {
								String query = "select * from User where Email_id = '"+Email+"';";
								Statement s = con.createStatement();
								ResultSet r = s.executeQuery(query);
				
								if(!r.next()) {
										String template = "INSERT INTO User(Name, Password, Email_id)   values(?,?,?)";
										PreparedStatement  ins = con.prepareStatement(template);
						
										ins.setString(1,name);
										ins.setString(2,Pass);
										ins.setString(3,Email);
										ins.executeUpdate();
										con.close();
										return true;
						
								}else {
										con.close();
										return false;
								}
						}else if(Category.equals("Seller")){
								String query = "select * from Seller where Email_id = '"+Email+"';";
								Statement s1 = con.createStatement();
								ResultSet r1 = s1.executeQuery(query);
					
								if(!r1.next()) {
										String template = "INSERT INTO Seller(Name, Password, Email_id)  values(?,?,?)";
										PreparedStatement  ins1 = con.prepareStatement(template);
										ins1.setString(1,name);
										ins1.setString(2,Pass);
										ins1.setString(3, Email);
										ins1.executeUpdate();
										con.close();
										return true;
								}else {
										title = "Incorrect Category";
										con.close();
										return false;
								}
						}else {
								con.close();
								return false;
						}
				
				}catch(SQLException e) {
						title = "Connection error";
						return false;
				}
		}
	
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				doGet(request, response);
		}
		
}

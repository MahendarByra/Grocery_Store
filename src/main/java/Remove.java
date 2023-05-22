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

@WebServlet("/removeProduct")
public class Remove extends HttpServlet{
		static Scanner sc = new Scanner(System.in);
		private static final long serialVersionUID = 1L;
		public static String title="";
		
//Methods  
		public Remove() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
		
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();
		
				String Item_id   = request.getParameter("rid");
		
				if( DeleteItem(Item_id)) {
						session.setAttribute("itemId", Item_id);
						session.setAttribute("msgRemove", title);
						response.sendRedirect("SellerHome.jsp");
				}else {
						session.setAttribute("itemId", Item_id);
						request.setAttribute("msgRemove", title);
						response.sendRedirect("SellerHome.jsp");
				}
		
		}
    
	
	
		public static boolean DeleteItem(String Item_id){
				String url = "jdbc:mysql://localhost:3306/ITassign";
				String usr = "mahendar";
				String password = "Medha@2020";
		
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						String q = "select * from Items where Item_id = "+Item_id +";";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(q);
						
						if(r.next()) {
								String query = "delete from  Items where Item_id = "+Item_id+";";
								Statement s1 = con.createStatement();
								s1.executeUpdate(query);
								title = "Item deleted successfully";
								con.close();
								return true ;
						}else {
								title = "Id doesn't exist";
								con.close();
								return false;
						}
				}catch(SQLException e) {
						title = "connection error";
						return false;
				}
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
}


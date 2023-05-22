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

@WebServlet("/update")
public class Updating extends HttpServlet{
		static Scanner sc = new Scanner(System.in);
		private static final long serialVersionUID = 1L;
		public static String title="";
		
//Methods  
		public Updating() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();
			
				String Item_id   = request.getParameter("id");
				String Item_name = request.getParameter("uiname");
				String Price 	 = request.getParameter("uprice");
				String ILink 	 = request.getParameter("ulink");
				String Stock     = request.getParameter("ustock");
				String Descript	 = request.getParameter("udesc");
				String discount  = request.getParameter("udiscount");
				if(Item_id.equals("")) {
					response.sendRedirect("SellerHome.jsp");
				}else {
		
				if( updateItem(Item_id,Item_name,Price,ILink,Stock,Descript,discount)) {
						session.setAttribute("msgUpdate", title);
						response.sendRedirect("SellerHome.jsp");
				}else {
						session.setAttribute("msgUpdate", title);
						response.sendRedirect("SellerHome.jsp");
				}
				}
		}
    
	
	
		public static boolean updateItem(String Item_id ,String iname,String iprice, String ilink,
									String istock,String idesc,String idiscount){
				String url = "jdbc:mysql://localhost:3306/ITassign";
				String usr = "mahendar";
				String password = "Medha@2020";
		
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						String q = "select * from Items where Item_id = "+Item_id +";";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(q);
						if(r.next()){
								String query = "update Items set ";
								if(iname != "") {
										query = query + " Item_name = '"+iname+"',";
								}
								if(iprice != "") {
										query = query + " Price = "+iprice+",";
								}
								if(ilink != "") {
										query = query + " Image = '"+ilink+"',";
								}
								if(istock != "") {
										query = query + " stock = "+istock+",";
								}
								if(idiscount != "") {
										query = query + " Discount = "+idiscount+",";
								}
								if(idesc != "") {
										query = query + " about = '"+idesc+"'";
								}
				
								if(query.charAt(query.length()-1) == ',') {
										query = query.substring(0, query.length() - 1);
								}
								query = query+" where Item_id = "+Item_id;
								Statement s1 = con.createStatement();
								s1.executeUpdate(query);
								title = "Item updated Successfully";
								con.close();
								return true ;
						}else {
								title = "Item id does not exist";
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

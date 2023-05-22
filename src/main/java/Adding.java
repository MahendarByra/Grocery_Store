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

@WebServlet("/add")
public class Adding extends HttpServlet{
	static Scanner sc = new Scanner(System.in);
	private static final long serialVersionUID = 1L;
	public static String title="";
//Methods  
	
	public Adding() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	HttpSession session = request.getSession();
		String Item_name = request.getParameter("niname");
		String Descript	 = request.getParameter("ndesc");
		String ILink 	 = request.getParameter("nlink");
		String sstock    = request.getParameter("nstock");
		String sdiscount = request.getParameter("ndiscount");
		String sprice    = request.getParameter("nprice");
		if(Item_name.equals("") || Descript.equals("") || ILink.equals("") || sstock.equals("") || sdiscount.equals("") || sprice.equals("")) {
			response.sendRedirect("SellerHome.jsp");
		}else {
		int Stock    	 = Integer.parseInt(request.getParameter("nstock"));
		int discount 	 = Integer.parseInt(request.getParameter("ndiscount"));
		Double Price 	 = Double.parseDouble(request.getParameter("nprice"));
		if( addItem(Item_name,Price,ILink,Stock,Descript,discount)) {
			session.setAttribute("msgAdd", title);
			response.sendRedirect("SellerHome.jsp");
		}else {
			session.setAttribute("msgAdd", title);
			response.sendRedirect("SellerHome.jsp");
		}
		
		}
    }
    
	
	
	public static boolean addItem(String iname,double iprice, String ilink, int istock,String idesc,int discount){
		String url = "jdbc:mysql://localhost:3306/ITassign";
		String usr = "mahendar";
		String password = "Medha@2020";
		
		try(Connection con = DriverManager.getConnection(url,usr,password);){
				String q1 = "select * from Items where Item_name = '"+iname+"';";
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery(q1);
				if(!r.next()) {
					String template = "INSERT INTO Items(Item_name,Price,Image,stock,about,Discount) values(?,?,?,?,?,?)";
					PreparedStatement  ins = con.prepareStatement(template);
					ins.setString(1,iname);
					ins.setDouble(2,iprice);
					ins.setString(3, ilink);
					ins.setInt(4, istock);
					ins.setString(5, idesc);
					ins.setInt(6, discount);
					ins.executeUpdate();
					
					title = "Item added Successfully";
					con.close();
					return true ;
				}else {
					title = "Item already exists";
					con.close();
					return false;
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

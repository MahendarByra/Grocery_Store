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
import java.time.LocalDate;
import java.util.Date;
import java.util.Date.*;

/**
 * Servlet implementation class orderItem
 */
@WebServlet("/orderItems")
public class orderItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
     public static String msg ="";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int buyer_id = Integer.parseInt(request.getParameter("buyerid"));
		
		String url = "jdbc:mysql://localhost:3306/ITassign";
		String usr = "mahendar";
		String password = "Medha@2020";

		try(Connection con = DriverManager.getConnection(url,usr,password);){
				
				String query = "select * from tblcart where customer_id = "+buyer_id;
				try(Statement s = con.createStatement();){
						ResultSet r = s.executeQuery(query);
				
						con.setAutoCommit(false);
						
						while(r.next()) {
						
								int item_id = r.getInt(6);
								String q2 = "select * from Items where Item_id = "+item_id;
								Statement s2 = con.createStatement();
								ResultSet r2 = s2.executeQuery(q2);
								r2.next();
								int stock = r2.getInt(5);
						
								int qty = r.getInt(3);
								String status = "Ordered";
								int total_price = r.getInt(4);
						
								if(stock >= qty) {
							
										String template = "INSERT INTO orders(order_date,status,buyer_id,item_id,quantity,total_price) values(?,?,?,?,?,?)";
										PreparedStatement ins = con.prepareStatement(template);
										ins.setDate(1,java.sql.Date.valueOf(LocalDate.now()));
										ins.setString(2,status);
										ins.setInt(3,buyer_id);
										ins.setInt(4, item_id);
										ins.setInt(5, qty);
										ins.setInt(6, total_price);
						
										ins.executeUpdate();
								
										String q3 = "update Items set stock = stock - "+qty+" where Item_id = "+item_id+";";
										Statement s3 = con.createStatement();
										s3.executeUpdate(q3);
								
								
								}else {
										msg += r2.getString(2)+" is not available\n";
								}
						
						
						
						}
						String q4 = "delete from tblcart where customer_id = "+buyer_id;
						Statement s4 = con.createStatement();
						s4.executeUpdate(q4);
						session.setAttribute("msgOrder", msg);
						response.sendRedirect("UserHome.jsp");
						con.commit();
				
				}catch(SQLException ex) {
					try{
						con.rollback();
					}catch(SQLException ex2){
						msg += "Transaction failed\n";
						session.setAttribute("msgOrder", msg);
					}
				}
				con.close();
		}catch(SQLException e) {
			
			msg="Connection error\n";
			session.setAttribute("msgOrder", msg);
			response.sendRedirect("UserHome.jsp");
		}
		
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

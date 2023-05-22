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

/**
 * Servlet implementation class removeCart
 */
@WebServlet("/removeCart")
public class removeCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public removeCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int Cart_id = Integer.parseInt(request.getParameter("Cid"));
		String url = "jdbc:mysql://localhost:3306/ITassign";
		String usr = "mahendar";
		String password = "Medha@2020";
		try(Connection con = DriverManager.getConnection(url,usr,password);){
				String query = "delete from tblcart where id = "+Cart_id+";";
				Statement s = con.createStatement();
				s.executeUpdate(query);
				con.close();
				response.sendRedirect("UserHome.jsp");
			
		}catch(SQLException e) {
			String title = "Connection error";
			session.setAttribute("msgrCart", title);	
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

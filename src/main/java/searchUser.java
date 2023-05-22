

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class searchUser
 */
@WebServlet("/searchUser")
public class searchUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		String sid = request.getParameter("bid");
		if(sid.equals("")) {
			response.sendRedirect("SellerHome.jsp");
		}else {
		int id = Integer.parseInt(request.getParameter("bid"));
		
		String url = "jdbc:mysql://localhost:3306/ITassign";
		String usr = "mahendar";
		String password = "Medha@2020";
		
		try(Connection con = DriverManager.getConnection(url,usr,password);){
				String q1 = "select * from User where Id = '"+id+"';";
				Statement s = con.createStatement();
				ResultSet r = s.executeQuery(q1);
				if(!r.next()) {
						response.sendRedirect("SellerHome.jsp");
						con.close();
				}else {
						session.setAttribute("uvid", id);
						response.sendRedirect("SellerHome.jsp");
						con.close();
				}
		}catch(SQLException e) {
			//title = "Connection Error";
			//return false;
		}
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

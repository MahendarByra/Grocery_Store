

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * Servlet implementation class twodateSearch
 */
@WebServlet("/twodateSearch")
public class twodateSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public twodateSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();	
		String s1 = (String)request.getParameter("isd");
		String s2 = (String)request.getParameter("fsd");
		if(s1.equals("") || s2.equals("")) {
			response.sendRedirect("SellerHome.jsp");
		}else {
		
		String url = "jdbc:mysql://localhost:3306/ITassign";
		String usr = "mahendar";
		String password = "Medha@2020";
		
		try(Connection con = DriverManager.getConnection(url,usr,password);){
				
				session.setAttribute("d1", s1);
				session.setAttribute("d2", s2);
				response.sendRedirect("SellerHome.jsp");
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



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ondateSearch
 */
@WebServlet("/ondateSearch")
public class ondateSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ondateSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession session = request.getSession();	
				String s1 = (String)request.getParameter("odate");
				
		if(s1.equals("")) {
			response.sendRedirect("SellerHome.jsp");
		}else {
		String url = "jdbc:mysql://localhost:3306/ITassign";
		String usr = "mahendar";
		String password = "Medha@2020";
		
		try(Connection con = DriverManager.getConnection(url,usr,password);){
				
				session.setAttribute("singleDate", s1);
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



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class search
 */
@WebServlet("/Search")
public class SearchItem extends HttpServlet {
		private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
		public SearchItem() {
			super();
        // TODO Auto-generated constructor stub
		}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String title="";
				HttpSession session = request.getSession();
				String Item_name = request.getParameter("sitem");
				String Email = request.getParameter("aid");
		
				String url = "jdbc:mysql://localhost:3306/ITassign";
				String usr = "mahendar";
				String password = "Medha@2020";
				try(Connection con = DriverManager.getConnection(url,usr,password);){
						String query = "select * from Items where Item_name LIKE '%"+Item_name+"%';";
						Statement s = con.createStatement();
						ResultSet r = s.executeQuery(query);
				
						while(r.next()){
								String SItem_name = r.getString(2);
								String Slink = r.getString(4);
								double Sprice = r.getDouble(3);
								int Sstock = r.getInt(5);
								String Sdesc = r.getString(6);
								int SDiscount = r.getInt(7);
								
								title += "<div class = 'div1'>";
								title +="<div class = 'div2'>";
								title +="<span><font color='blue'><b>Id : </b></font>"+r.getInt(1)+"</span><br>";
								title +="<span><font color='blue'><b>Name : </b></font>"+SItem_name+"</span><br>";
								title +="<span><font color='blue'><b>Price : </b></font>"+Sprice+"</span><br>";
								title +="<span><font color='blue'><b>stock : </b></font>"+Sstock+"</span><br>";
								title +="<span><font color='blue'><b>Discount : </b></font>"+SDiscount+"%</span><br>";
								title +="<span><font color='blue'><b>Description  :</b></font>"+Sdesc+"</span>";
								title +="</div>";
							
								title +="<div class='div3'><br>";
								title +="<image height=150px width=150px align=right border='2px solid black' src = '"+Slink+"' alt = 'cannot load the image'><br> ";
								title +="</div><br>";
								
								title += "<div style='float: right;padding: 20px;'>";
								title +="<h2>Add to Cart</h2>";
								
								title += "<form onsubmit = 'addToC()' method = 'post' action ='addCart'>";
								title += "<input type = 'hidden' name = 'Email'      value ="+Email+">";
								title += "<input type = 'hidden' name = 'Item_id'  value = "+r.getInt(1)+"><br>";
								title += "<input type = 'number' name = 'Quantity'  placeholder='Quantity'	 value =''><br><br>";
								title += "<button type='submit'>AddToCart</button>";
								title += "</form>";
								title += "</div>";
								
								title +="</div>";
								
						
								session.setAttribute("sitemnamebyusr", Item_name);
								session.setAttribute("msgsearch", title);
								response.sendRedirect("UserHome.jsp");
								con.close();
						}
					
						if(!r.next()){
								title = "Item not Available";
								session.setAttribute("sitemnamebyusr", Item_name);
								session.setAttribute("msgsearch", title);
								response.sendRedirect("UserHome.jsp");
								con.close();
						}
				}catch(SQLException e) {
						//title = "Connection Error";
						//request.setAttribute("msgsearch", title);
						//requestDispatcher.forward(request, response);
				}
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
}


package ehotel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.MysqlxSession;
import com.mysql.cj.Session;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		//response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			//Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/provisio_db","prov_user", "provisio");

			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/provisio_db";
			String userName = "prov_user";
			String thePasswordString = "provisio";
			Connection con = DriverManager.getConnection(dbUrl, userName, thePasswordString);
			Statement stm = con.createStatement();
			stm.execute("use provisio_db");
			
			ResultSet rs = stm.executeQuery("select * from users where users.email = '" + email + "' and users.pass = '" + password + "'");
			if(rs.next()) {
				// if username and password are true then go to successful login page
				//response.sendRedirect("index.jsp");
				
				HttpSession session = request.getSession(true);
				
				// this will be for the sign out button in JavaScript so we can session.invalidate() when they sign out
				session.setAttribute("Loggedin", "true"); 

				System.out.println("You are signed in");
				String baseURL = "/Provisio/";
				String indexPage = "index.jsp";
				String reservationHome = baseURL + indexPage;
				response.sendRedirect(reservationHome);
					
			}
			else {

				out.println("Invalid username and passowrd.");
				
			}
			con.close();
			
		} catch(Exception e) {
			System.out.println("You are not signed in");
			System.out.println(e.getMessage());
		}
	}

}

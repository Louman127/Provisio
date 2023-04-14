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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String hashedPassword = Hash.generate(password);
		
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/provisio_db";
			String userName = "prov_user";
			String thePasswordString = "provisio";
			Connection con = DriverManager.getConnection(dbUrl, userName, thePasswordString);
			Statement stm = con.createStatement();
			stm.execute("use provisio_db");
			
			ResultSet rs = stm.executeQuery("select * from users where users.email = '" + email + "' and users.pass = '" + hashedPassword + "'");
			if(rs.next()) {
				// if username and password are true then go to successful login page
				
				// Do not need to create a new one
				HttpSession session = request.getSession(false);
				session.setAttribute("email", email);
				// this will be for the sign out button so we can session.invalidate() when they sign out
				session.setAttribute("Loggedin", con); 

				System.out.println("You are signed in");
				
				String baseURL = "/Provisio/";
				String indexPage = "index.jsp";
				String reservationHome = baseURL + indexPage;
				response.sendRedirect(reservationHome);
				
					
			}

			else {

				out.println("Invalid username and passowrd.");
				
			}
			//con.close(); // We want the user to stay signed in
			//System.out.println("Connection closed");
			
		} catch(Exception e) {
			System.out.println("You are not signed in");
			System.out.println(e.getMessage());
		}
	}

}

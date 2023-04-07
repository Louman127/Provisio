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

@WebServlet("/CreateAccountServlet")

public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateAccountServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		//response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");	
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String country = request.getParameter("country");
		String zip = request.getParameter("zip");
		String password = request.getParameter("password");
		int loyaltyPoints = 0;
		
		String hashedPassword = Hash.generate(password);
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String dbUrl = "jdbc:mysql://localhost:3306/provisio_db";
			String userName = "prov_user";
			String thePasswordString = "provisio";
			Connection con = DriverManager.getConnection(dbUrl, userName, thePasswordString);
			Statement stm = con.createStatement();
			stm.execute("use provisio_db");
			
			try {
				
				stm.execute("INSERT INTO users (first_name, last_name, email, phone, country, zip, pass, loyalty_points) " 
				+ "VALUES ('" + fname + "','" + lname + "','" + email + "','" + phone + "','" + country + "','" + zip + "','" 
				+ hashedPassword + "','" + loyaltyPoints + "')");
				
				System.out.println("Your Account is Created");
				out.println("<script type=\"text/javascript\">");
	            out.println("alert('Your Account is Created.\\nPlease Sign-in.');");
	            out.println("location='/Provisio/signin.jsp';"); 
	            out.println("</script>");
				
				//String baseURL = "/Provisio_copy/";
				//String signinPage = "signin.jsp";
				//String routeToSignin = baseURL + signinPage;
				//response.sendRedirect(routeToSignin);
			
			}
			catch (Exception e) {
				out.println("Invalid username and passowrd.");
			}
			
			con.close();
			
		} 
		catch(Exception e) {
			System.out.println("You are not signed into the database");
			System.out.println(e.getMessage());
		}
	}

}

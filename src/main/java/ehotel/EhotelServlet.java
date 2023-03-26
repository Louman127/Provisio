package ehotel;

import java.awt.image.RescaleOp;
import java.beans.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

@WebServlet("/EhotelServlet")

// name = 
//, urlPatterns = { "/Provisio/*" }




public class EhotelServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet{
	private static final long serialVersionUID = 1L;
	
	public EhotelServlet() {
		super();
	}
	

	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		

	
	
	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String baseURL = "/Provisio/";
		String indexPage = "index.jsp";
		String reservationHome = baseURL + indexPage;
		
		//String action = request.getParameter("action");
		
		/*
		if (action != null) {
			switch (action) {
			case value: {
				
				yield type;
			}
			default:
				throw new IllegalArgumentException("Unexpected value: " + action);
			}
		}
		
		/*
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		
		PrintWriter out = response.getWriter();
		

		//response.sendRedirect("EhotelServlet");
		int result = num1 + num2;
		
		out.println("<p>" + result + "</p>");
		//out.println(result);*/
		
	}
	
	 
	
	

}

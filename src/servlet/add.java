package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class add
 */
@SuppressWarnings("unused")
@WebServlet("/add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String productID = request.getParameter("productID");
		String productname = request.getParameter("productname");
		double price =Double.parseDouble(request.getParameter("price"));
		String Infor = request.getParameter("information");
		String danwei = request.getParameter("danwei");
		String fenlei = request.getParameter("fenlei");
		try {
			
			Connection conn = DbUtil.getConnection();
			PreparedStatement ptmt = conn
					.prepareStatement("insert into goods(productID,productname,price,infor,danwei,fenlei) values(?,?,?,?,?,?)");
			ptmt.setInt(1,Integer.parseInt(productID));
			ptmt.setString(2, productname);
			ptmt.setDouble(3, price);
			ptmt.setString(4, Infor);
			ptmt.setString(5, danwei);
			ptmt.setString(6, fenlei);
			ptmt.executeUpdate();
			
			ptmt.close();
			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO storage (productID,name) VALUES ('"+Integer.parseInt(productID)+"','"+productname+"');");
			
			
			stmt.executeUpdate();
			conn.close();
		}	
		
		
	
		catch (SQLException e) 
		{
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		   System.out.println("找不到数据源！");           
		}
		response.sendRedirect("employee/goods.jsp");
	}

	}



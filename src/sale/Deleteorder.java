package sale;

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

import dao.DbUtil;

/**
 * Servlet implementation class Deleteorder
 */
@WebServlet("/Deleteorder")
public class Deleteorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deleteorder() {
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
		response.setContentType("application/json");  
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		
		String id= request.getParameter("id");
		String productID = request.getParameter("productID");
		String quantity = request.getParameter("quantity");
		
	    PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = null;			
		try{
			Connection conn = DbUtil.getConnection();
			sql= "delete from `sales` where id ='"+ id + " '";	
			pstat = conn.prepareStatement(sql);
			pstat.executeUpdate();
			
			String sql2 = "update storage set amount = amount + '"+Integer.parseInt(quantity)+"' where productID = '"+productID+"'";
			pstat.executeUpdate(sql2);
			pstat.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("staff/bcash.jsp");
	}
}

package member;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import dao.DbUtil;
/**
 * Servlet implementation class Addmember
 */
@WebServlet("/Addmember")
public class Addmember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addmember() {
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
		response.setContentType("application/json");  
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    String mname = new String(request.getParameter("mname").getBytes("iso-8859-1"), "utf-8");
		String phone = new String(request.getParameter("phone").getBytes("iso-8859-1"), "utf-8");
		String email = new String(request.getParameter("email").getBytes("iso-8859-1"), "utf-8");
		String adress = new String(request.getParameter("adress").getBytes("iso-8859-1"), "utf-8");
		double discountlevel=0;
		PrintWriter out = response.getWriter();
		
		PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray ja=new JSONArray();
		try{
			Connection conn = DbUtil.getConnection();
			sql = "insert into member(mname,phone,email,adress,discountlevel) values(?,?,?,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, mname);
			pstat.setString(2, phone);
			pstat.setString(3, email);
			pstat.setString(4, adress);
			pstat.setDouble(5, 0.9);
			pstat.executeUpdate();
			pstat.close();
			conn.close();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		response.sendRedirect("staff/bmember.jsp");		 
		
	}
	}
package storage;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * Servlet implementation class Addproduct
 */
@WebServlet("/Addproduct")
public class Addproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addproduct() {
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
	    String name = request.getParameter("name");
		String productID = request.getParameter("productID");
		int amount=Integer.parseInt(request.getParameter("amount"));
		
		 PrintWriter out = response.getWriter();
		
		//out.print(amount);
		//out.print(name);
		
		//out.print(productID);
		
		 PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray ja=new JSONArray();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try{
			Connection conn = DbUtil.getConnection();
			sql = "insert into storage(productID,name,amount) values(?,?,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, productID);
			pstat.setString(2, name);
			pstat.setInt(3, amount);
			pstat.executeUpdate();
			pstat.close();
			conn.close();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		response.sendRedirect("newproduct.html");		 
		out.print("alert('添加商品信息失败')");
	}
	}
package sale;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.DbUtil;

/**
 * Servlet implementation class Saleinsert
 */
@WebServlet("/Saleinsert")
public class Saleinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Saleinsert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		String productID = request.getParameter("productID");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		boolean vip = Boolean.parseBoolean(request.getParameter("vip"));
		if(vip){
			session.setAttribute("vip", "1");	
		}else {
			session.setAttribute("vip", "0");
		}
		
		String productname = null;
		double price = 0;
		double money = 0;

		PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = null;
		JSONArray ja = new JSONArray();
		try {
			Connection conn = DbUtil.getConnection();

			sql = "select * from `goods` where  productID='" + productID + " '";
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			if (rs.next()) {
				productname = rs.getString("productname").trim();
				price = rs.getDouble("price");
			}
			if(vip) {
				money = price * quantity * 0.9;
			}else {
				money = price * quantity;
			}

			sql = "update `storage` set amount=amount-" + quantity
					+ "  where productID='" + productID + "'";
			pstat = conn.prepareStatement(sql);
			pstat.executeUpdate();
			pstat.close();
			sql = "insert into sales(productID,name,quantity,price,money,state,casher) values(?,?,?,?,?,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, productID);
			pstat.setString(2, productname);
			pstat.setDouble(4, price);
			pstat.setInt(3, quantity);
			pstat.setDouble(5, money);
			pstat.setString(6, "未完成");
			pstat.setString(7, (String) session.getAttribute("name"));
			pstat.executeUpdate();
			pstat.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("staff/bcash.jsp");
	}
}
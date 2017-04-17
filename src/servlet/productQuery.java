package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.PackingDatabase;

import org.json.JSONObject;

/**
 * Servlet implementation class productQuery
 */
@WebServlet("/productQuery")
public class productQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// response.setContentType("application/json");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		String productID = request.getParameter("productID");
		System.out.println(productID);
		
		String mySql = "select * from goods where productID=" + productID + "";
		PackingDatabase packing = new PackingDatabase();
		try {
			ResultSet rs = packing.query(mySql);
			// response.setContentType("text/x-json;charset=utf-8");

			PrintWriter out = response.getWriter();

			JSONObject jo = new JSONObject();
			if (rs.next()) {
				jo.put("productname", rs.getString("productname"));
				jo.put("price", rs.getString("price"));
				jo.put("productID", rs.getString("productID"));
				jo.put("information", rs.getString("infor"));
				jo.put("danwei", rs.getString("danwei"));
				jo.put("fenlei",rs.getString("fenlei"));
			}
			rs.close();
			out.print(jo.toString());
			out.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());}

	}}

package storage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import servlet.PackingDatabase;

@WebServlet("/getStorage")
public class QueryStorage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String productId = new String(request.getQueryString().getBytes("iso-8859-1"), "utf-8");
		String productID = productId.substring(productId.indexOf("=")+1,productId.length());
		String mySql = "select amount from storage where productID = '" + productID + "'";
		PackingDatabase packing = new PackingDatabase();
		try {
			ResultSet rs = packing.query(mySql);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			JSONArray ja = new JSONArray();
			if(!rs.next()) { 
				JSONObject jo = new JSONObject();
				jo.put("amount", "-1");
				ja.put(jo);
			}else {
				JSONObject jo = new JSONObject();
				jo.put("amount", rs.getString("amount"));
				ja.put(jo);
				
			}
			rs.close();
			out.print(ja.toString());
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}

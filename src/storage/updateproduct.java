package storage;

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



@WebServlet("/updateproduct")
public class updateproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public updateproduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String productID = new String(request.getParameter("productID").getBytes("iso-8859-1"), "utf-8");

		String mySql = "select * from storage where productID=" + productID
				+ "";

		PackingDatabase packing = new PackingDatabase();
		try {
			ResultSet rs = packing.query(mySql);
			// response.setContentType("text/x-json;charset=utf-8");

			PrintWriter out = response.getWriter();

			JSONObject jo = new JSONObject();
			if (rs.next()) {
				jo.put("productID", rs.getString("productID"));
				jo.put("name", rs.getString("name"));
				jo.put("amount", rs.getString("amount"));
			}
			rs.close();
			out.print(jo.toString());
			out.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}

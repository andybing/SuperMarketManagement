package servlet;

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

/**
 * Servlet implementation class searchgoods
 */
@WebServlet("/searchgoods")
public class searchgoods extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchgoods() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
  		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		String mySql = "";
		if(keyword == null || keyword.trim().equals("") || keyword.trim().length() == 0) {
			mySql="select * from goods order by productID asc";
		}else {
			mySql="select * from goods where productID='"+keyword+"' or productname like '%" + keyword +"%' order by productID asc";
		}
		PackingDatabase packing = new PackingDatabase();
		try {
			ResultSet rs = packing.query(mySql);
			response.setContentType("application/json");  
		    response.setCharacterEncoding("UTF-8");  
			
			PrintWriter out = response.getWriter();
			JSONArray ja = new JSONArray();
			while (rs.next()) {
				JSONObject jo=new JSONObject();
				jo.put("productID",rs.getString("productID"));
				jo.put("productname",rs.getString("productname"));
				jo.put("price",rs.getString("price"));
				jo.put("infor",rs.getString("infor"));
				jo.put("danwei",rs.getString("danwei"));
				jo.put("fenlei",rs.getString("fenlei"));
				ja.put(jo);
			}
			rs.close();
			out.print(ja.toString());
			out.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

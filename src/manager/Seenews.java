package manager;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;

import javax.servlet.ServletContext;
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
 * Servlet implementation class Seenews
 */
@WebServlet("/Seenews")
public class Seenews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Seenews() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");  
	    response.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");
	    response.setHeader("Cache-Control", "no-cache");  
			
	    PrintWriter out = response.getWriter();	
	
		
			//String deliver = (String) request.getSession().getAttribute("name");
			String id=null,name = null,subject=null,time=null,message=null;
			PreparedStatement pstat = null;
			ResultSet rs = null;
			String sql = null;
			JSONArray ja=new JSONArray();
			try{
				Connection conn = DbUtil.getConnection();
				sql = "select * from `news`";
				pstat = conn.prepareStatement(sql);
				
				rs = pstat.executeQuery();
			
				
			response.setContentType("text/x-json");
				
				
				while (rs.next())  {
					JSONObject jo=new JSONObject();
					jo.put("id",rs.getInt("id"));
					jo.put("subject",rs.getString("subject"));
					jo.put("name",rs.getString("name"));
					jo.put("time",rs.getString("time"));
					jo.put("message",rs.getString("message"));
					
					
					ja.put(jo);
				}
			out.print(ja.toString());	
					out.close();
					rs.close();
					pstat.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

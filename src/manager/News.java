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
 * Servlet implementation class News
 */
@WebServlet("/News")
public class News extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public News() {
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
		    response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			String id=null;
			String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		    String subject= new String(request.getParameter("subject").getBytes("ISO-8859-1"), "utf-8");
			String time = request.getParameter("time");
			String message = new String(request.getParameter("message").getBytes("ISO-8859-1"), "utf-8");
			PreparedStatement pstat = null;
				ResultSet rs = null;
				String sql = null;	
					try{
						Connection conn = DbUtil.getConnection();
						sql = "insert into news(subject,name,message) values(?,?,?)";
						pstat = conn.prepareStatement(sql);
						pstat.setString(1, subject);
						pstat.setString(2, name);
						pstat.setString(3, message);
						
						pstat.executeUpdate();
						pstat.close();
						conn.close();	
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}	
		
				response.sendRedirect("manager/index-manager.jsp");		
		
		}

	}
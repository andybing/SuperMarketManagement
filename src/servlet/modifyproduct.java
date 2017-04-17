package servlet;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import servlet.PackingDatabase;

/**
 * Servlet implementation class modifyproduct
 */
@WebServlet("/modifyproduct")
public class modifyproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public modifyproduct() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String productID = request.getParameter("productID");
		String productname = request.getParameter("productname");
		String price = new String(request.getParameter("price").getBytes(
				"iso-8859-1"), "utf-8");
		String fenlei = request.getParameter("fenlei");
		String danwei = request.getParameter("danwei");
		String information = request.getParameter("information");

		String mySql = "update goods set productID='" + productID+"',fenlei='"+fenlei+"',danwei='"+danwei
				+ "', productname='" + productname + "',price='" + price
				+ "',infor='" + information + "' where  productID=" + productID;

		PackingDatabase packing = new PackingDatabase();
		try {
			packing.update(mySql);
			response.sendRedirect("employee/goods.jsp");
		} catch (Exception e) {
			System.out.println("ss" + e.getMessage());
		}

	}

	/*
	 * private void writeTo(String path, String filename, Part part) throws
	 * IOException, FileNotFoundException { InputStream in =
	 * part.getInputStream(); OutputStream out = new FileOutputStream(path +
	 * filename); byte[] buffer = new byte[1024]; int length = -1; while
	 * ((length = in.read(buffer)) != -1) { out.write(buffer, 0, length); }
	 * in.close(); out.close();
	 * 
	 * }
	 */

}

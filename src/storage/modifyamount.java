package storage;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.PackingDatabase;

/**
 * Servlet implementation class modifyamount
 */
@WebServlet("/modifyamount")
public class modifyamount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public modifyamount() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String productID = new String(request.getParameter("productID").getBytes("iso-8859-1"), "utf-8");

		String name = new String(request.getParameter("name").getBytes("iso-8859-1"), "utf-8");
		String amount = new String(request.getParameter("amount").getBytes("iso-8859-1"), "utf-8");

		String mySql = "update storage set amount='" + amount
				+ "' where  productID=" + productID ;
		PackingDatabase packing = new PackingDatabase();
		try {
			packing.update(mySql);
			response.sendRedirect("employee/storage.jsp");
		} catch (Exception e) {
			System.out.println("ss" + e.getMessage());
		}

	}

}

package login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import dao.DbUtil;

@WebServlet("/Stafflogin")
public class EmployeeLogin extends HttpServlet {
	public void wrong1() {
		String msg = "用户名不能为空！";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void wrong2() {
		String msg = "用户密码不能为空，登录失败！";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void wrong3() {
		String msg = "该用户尚未注册，登录失败";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void wrong4() {
		String msg = "用户密码不正确，登录失败";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	public void wrong5() {
		String msg = "系统进入错误";
		int type = JOptionPane.YES_NO_CANCEL_OPTION;
		String title = "信息提示";
		JOptionPane.showMessageDialog(null, msg, title, type);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = new String(request.getParameter("name").getBytes(
				"ISO-8859-1"), "UTF-8");
		String password = new String(request.getParameter("password").getBytes(
				"ISO-8859-1"), "UTF-8");
		if (name.equals("")) {
			wrong1();
			response.sendRedirect("login/login-employee.html");
		} else if (password.equals("")) {
			wrong2();
			response.sendRedirect("login/login-employee.html");
		} else {
			try {

				Connection conn = DbUtil.getConnection();
				Statement stmt = conn.createStatement(
						ResultSet.TYPE_SCROLL_SENSITIVE,
						ResultSet.CONCUR_READ_ONLY);

				String sql = "select * from staff where name='" + name + "'";
				ResultSet rs = stmt.executeQuery(sql);
				int N = 0;
				int P = 0;
				while (rs.next()) {
					if (name.equals(rs.getString("name"))) {
						N = 1001;
						if (password.equals(rs.getString("password"))) {
							P = 1001;
							LoginBean nn = new LoginBean();
							nn.setUserName(name);
							nn.setPassword(password);
							HttpSession session = request.getSession();
							session.setAttribute("name", name);
							response.sendRedirect("employee/index-employee.jsp");
						} else {
						}
					} else {
						N++;
					}
				}
				if (N < 1001) {
					wrong3();
					response.sendRedirect("login/login-employee.html");
				} else if (P < 1001) {
					wrong4();
					response.sendRedirect("login/login-employee.html");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

	}
}

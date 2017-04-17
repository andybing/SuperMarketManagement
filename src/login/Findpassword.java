package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import dao.DbUtil;

/**
 * Servlet implementation class Login
 */
@WebServlet("/find_password")
public class Findpassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Findpassword() {
		super();
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
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out = response.getWriter();
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.host", "smtp.126.com");
		// prop.setProperty("mail.smtp.socketFactory.class",
		// "javax.net.ssl.SSLSocketFactory");
		// prop.setProperty("mail.smtp.socketFactory.fallback", "false");
		prop.setProperty("mail.smtp.port", "25");
		// prop.setProperty("mail.smtp.socketFactory.port", "25");
		prop.setProperty("mail.smtp.auth", "true");
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("zpf12345678910@126.com",
						"zpf123456789");
			}
		});
		Message message = new MimeMessage(session);
		String email = request.getParameter("email");
		Connection conn = DbUtil.getConnection();
		PreparedStatement pstat = null;
		ResultSet rs = null;
		String sql = null;
		String password = null;
		// String email=null;

		// out.print(email);
		try {

			sql = "select * from `manager` where  email='" + email + " '";
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery();
			if (rs.next()) {
				password = rs.getString("password").trim();
				email = rs.getString("email").trim();
			}

			// out.print(password);

			message.setRecipient(Message.RecipientType.TO, new InternetAddress(
					email));
			message.setFrom(new InternetAddress("zpf12345678910@126.com"));
			message.setSubject("找回密码");
			message.setText("恭喜你，您的登录密码为" + password + "");
			message.setSentDate(new Date());

			Transport.send(message);

			out.print("<script>alert('邮件已发送!');window.location.href='login/index.html'</script>");

		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

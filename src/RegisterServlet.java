

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbConnector db = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private int rs;
       
	public void init() throws ServletException {
    	super.init();
    	db = new DbConnector();
    	conn = db.getConnection();
    	
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true); 
		if(session.getAttribute("isConnected") == null) {
			response.sendRedirect("login.jsp");
		}
		else 
			request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		if(username == null) username = " ";
		if(password == null) password = " ";
		if(email == null) email = " ";
		if(addUser(username, email, password)) {
			response.sendRedirect("login.jsp");
		}
		else {
			request.setAttribute("error", "username alreqdy exists");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	}

	protected boolean addUser(String username, String email, String password) {
		String query = "INSERT INTO user (username, email, password)\r\n" + 
				"SELECT * FROM (SELECT ?, ?, ?) AS tmp\r\n" + 
				"WHERE NOT EXISTS (\r\n" + 
				"    SELECT username FROM user WHERE username = ?\r\n" + 
				") LIMIT 1";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, username);
			rs = ps.executeUpdate();
			if(rs != 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
		
	}
}

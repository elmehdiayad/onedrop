

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class updateServlet
 */
@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbConnector db = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private Statement stmt ;
       
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
			request.getRequestDispatcher("profile.jsp").forward(request, response);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		String old_username= (String)session.getAttribute("username");	
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String update ="update user SET username=?,email=?,password=? where username=?";
		try {
			ps=conn.prepareStatement(update);
			ps.setString(1, username);
			ps.setString(2, email);

			ps.setString(3, password);

			ps.setString(4, old_username);
			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("username", username);
		request.getSession().setAttribute("email", email);
		request.getSession().setAttribute("password", password);


		request.getRequestDispatcher("profile.jsp").forward(request, response);

	}

}

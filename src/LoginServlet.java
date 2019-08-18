

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbConnector db = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    @Override
    public void init() throws ServletException {
    	super.init();
    	db = new DbConnector();
    	conn = db.getConnection();
    	
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true); 
		if(session.getAttribute("isConnected") != null) {
			response.sendRedirect("drop.jsp");
		}
		else 
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		session.setAttribute("isConnected", false);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = null;
		if(username == null) username = " ";
		if(password == null) password = " ";
		if(checkLogin(username, password)) {
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			String query = "SELECT email FROM user WHERE username = ? ";
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, username);
				rs = ps.executeQuery();
				rs.next();
				email = rs.getString("email");
				System.out.println(email);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("email",email);
			String query1 = "SELECT title,description,price,image FROM product WHERE user_fk = ? ";
			String title = null;
			String price=null;
			String image=null;
			String description=null;
			try {
				ps = conn.prepareStatement(query1);
				ps.setString(1, username);
				rs = ps.executeQuery();
				rs.next();
				 title = rs.getString("title");
				 price = rs.getString("price");
				 image = rs.getString("image");
				 description = rs.getString("description");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("title", title);
			session.setAttribute("price", price);
			session.setAttribute("src", image);
			session.setAttribute("description", description);
			session.setAttribute("isConnected", true);
			response.sendRedirect("drop.jsp");
			
		}
		else {
			request.setAttribute("username",username);
			request.setAttribute("feedback", "Username or Password is incorrect" );
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
			
	}
	
	private boolean checkLogin(String username, String password) {
		String query = "SELECT * FROM user WHERE username = ? and password = ?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

}

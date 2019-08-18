import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.ParseError;
import org.jsoup.select.Elements;





/**
 * Servlet implementation class DropServlet
 */
@WebServlet("/drop")
@MultipartConfig
public class DropServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbConnector db = null;
	private Connection conn = null;
	private PreparedStatement ps = null;
	private int rs;
	private ResultSet rss;
	private InputStream inputStream = null;
	
	
	
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
			request.getRequestDispatcher("drop.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession(true);
		String currentUser = (String) session.getAttribute("username");
		if(request.getParameter("scrap") != null) {
			String url = request.getParameter("url");
			request.setAttribute("url", url);
			String[] res = null;
			if(url.contains("amazon")){
				res = scrapAmazon(url);
				request.setAttribute("title", res[0]);
				request.setAttribute("price", res[1]);
				request.setAttribute("description", res[2]);
				request.setAttribute("src", res[3]);
				request.getRequestDispatcher("drop.jsp").forward(request, response);
			}
			else if(url.contains("ebay")) {
				res = scrapEbay(url);
				request.setAttribute("title", res[0]);
				request.setAttribute("price", res[1]);
				request.setAttribute("description", res[2]);
				request.setAttribute("src", res[3]);
				request.getRequestDispatcher("drop.jsp").forward(request, response);
			}
			else {
				request.getRequestDispatcher("drop.jsp").forward(request, response);
			}
		}
		else {	
			String title = request.getParameter("title");
			String description = request.getParameter("description");
			String price = request.getParameter("price");
			Part image = request.getPart("image");
			String src = "img" + File.separator + getFileName(image);
			String imagePath = getServletContext().getRealPath("") + "img" + File.separator + src.substring(4);
			System.out.println(imagePath);
			if (image != null) {
				inputStream = image.getInputStream();
				image.write(imagePath);		
	    	}
			String width = request.getParameter("width");
			String color = request.getParameter("color");
			request.setAttribute("required", "required");
			request.setAttribute("title", title);
			request.setAttribute("description", description);
			request.setAttribute("price", price);
			request.setAttribute("src", src);
			request.setAttribute("width", width);
			request.setAttribute("color", color);
			request.getRequestDispatcher("drop.jsp").forward(request, response);
			if(request.getParameter("save") != null) {
				if(checkprod(currentUser)==true) {
					updateproduct(title, description, price, src, currentUser);
				}else {
					addProduct(title, description, Double.parseDouble(price), src, currentUser);
				}		
			}
		}
	}	
	
	protected void addProduct(String title, String description, double price, String image,String username) {
		String query = "INSERT INTO product (title, description, price, image, user_fk) VALUES (?, ?, ?, ?, ?);";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setDouble(3, price);
			ps.setString(4, image);
			ps.setString(5,username);
			//ps.setDouble(4, list_price);
			/*if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                ps.setBlob(5, inputStream);
            }*/
			rs = ps.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	protected void updateproduct (String title, String description, String price, String image,String username) {
		String update ="update product SET title=?,description=?,price=?,image=? where user_fk=?";
		try {
			ps=conn.prepareStatement(update);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, price);
			ps.setString(4, image);
			ps.setString(5, username);
			ps.executeUpdate();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected boolean checkprod(String username) {
		String query = "select id from product where user_fk=?";
				try {
					ps = conn.prepareStatement(query);
					ps.setString(1, username); 
					rss = ps.executeQuery();
					if(rss.next()!=false) {
						return true;
					}
				} catch (SQLException e) {
					e.printStackTrace();
					return false;
				}
				return false;			


	}
	
	private String getFileName(Part part) {
	    final String partHeader = part.getHeader("content-disposition");
	    //LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
	    for (String content : part.getHeader("content-disposition").split(";")) {
	        if (content.trim().startsWith("filename")) {
	            return content.substring(
	                    content.indexOf('=') + 1).trim().replace("\"", "");
	        }
	    }
	    return null;
	}
	
	private String[] scrapAmazon(String url) throws IOException {
		Document doc = Jsoup.connect(url).userAgent("mozilla/17.0").proxy("10.23.201.11", 3128).get();
		String title = doc.select("span.a-size-large").first().text();		
		Elements tagName = doc.select("ul.a-unordered-list.a-vertical.a-spacing-none").tagName("li");
		String description = "";
		for (Element paragraph : tagName) {
			description += paragraph.text();
		}	
		description = description.replace("This fits your . Make sure this fits by entering your model number.", " ");
		String price = doc.select("span.a-size-medium.a-color-price").first().text().replace("$", "");
		String src = doc.select("img#landingImage").first().attr("data-old-hires");
		String[] res = new String[]{title, price, description, src};
		return res;
	}
	
	private String[] scrapEbay(String url) throws IOException {
		Document doc = Jsoup.connect(url).userAgent("mozilla/17.0").proxy("10.23.201.11", 3128).get();
		String title = doc.select("h1.it-ttl").first().text();			
		String description = doc.select("div.itemAttr").text().substring(15);
		String price = doc.select("span.notranslate").first().text().replace("US $", "");
		String src = doc.select("img#icImg").first().attr("src");
		String[] res = new String[]{title, price, description, src};
		return res;
	}
	
}
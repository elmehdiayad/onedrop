import java.sql.*;

public class DbConnector {
   // JDBC driver name and database URL
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost:3306/jee2019_groupe1-10";

   //  Database credentials
   static final String USER = "root";
   static final String PASS = "";
   

   
   public Connection getConnection() {
	   Connection conn = null;
	   try{
	      //STEP 2: Register JDBC driver
	      Class.forName("com.mysql.jdbc.Driver");
	
	      //STEP 3: Open a connection
	      System.out.println("Connecting to a selected database...");
	      conn = DriverManager.getConnection(DB_URL, USER, PASS);
	      System.out.println("Connected database successfully...");
	      
	      return conn;
	      
	   }catch(SQLException | ClassNotFoundException e){
	      //Handle errors
	      e.printStackTrace();
	      return conn;
	   }
   
   }
}//end DbConnector
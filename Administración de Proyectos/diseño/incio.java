import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JFrame;


public class incio {
	
	//private static String usuario="root";
	//private static String pwd="root";
	static String url="jdbc:mysql://localhost/abogados";
	private static String driver="com.mysql.jdbc.Driver";
	private static   Connection conn=null;

	/**
	 
	 * @LupithaYc
	 */
	public static void main(String[] args) throws ClassNotFoundException {
		
		
		try{
          Class.forName(driver);
         
         conn=DriverManager.getConnection("jdbc:mysql://localhost/abogados","root", "");
        if (conn!= null)  
        {
        	System.out.println("conexion a bd exitosa");
        }
		}catch(SQLException e)
		{
			System.out.println("hubo un problema");
		}
		catch(ClassNotFoundException e)
		{
			System.out.println(e);
		}
	}
	
}
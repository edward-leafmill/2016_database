package edu.pnu.ie.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
// Notice, do not import com.mysql.jdbc.*
// or you will have problems!

public class ConnectDatabase {
    public static void main(String[] args) {
        try {
            // The newInstance() call is a work around for some
            // broken Java implementations

            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = null;

			try {
			    conn = DriverManager.getConnection("jdbc:mysql://localhost/cape_codd?" +
			                                   "user=root&password=8407&useUnicode=true&characterEncoding=utf8");

    			// Do something with the Connection
				Statement stmt=conn.createStatement();  
				ResultSet rs=stmt.executeQuery("SELECT * FROM COLLEGE");  
				while(rs.next())
					System.out.println(rs.getInt(1)+"  "+rs.getString(2));  
				
				// the mysql insert statement
			    String query = " INSERT INTO STUDENT (학생번호, 학생이름, 전공학과아이디, 학년)"
			        			+ " VALUES (?, ?, ?, ?)";

			    // create the mysql insert preparedstatement
			    PreparedStatement preparedStmt = conn.prepareStatement(query);
			    preparedStmt.setInt (1, 201645101);
			    preparedStmt.setString (2, "홍길동");
			    preparedStmt.setInt   (3, 45);
			    preparedStmt.setInt    (4, 2);

			    // execute the preparedstatement
			    preparedStmt.execute();

				conn.close();

			} catch (SQLException ex) {
			    // handle any errors
			    System.out.println("SQLException: " + ex.getMessage());
			    System.out.println("SQLState: " + ex.getSQLState());
			    System.out.println("VendorError: " + ex.getErrorCode());
			}

        } catch (Exception ex) {
            // handle the error
           ex.printStackTrace();
       }
    }
}
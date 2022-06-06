
package utils;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
    public static Connection getConnection() throws SQLException, ClassNotFoundException{
        Connection conn = null;
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://139.180.129.236:8888/DentistBookingApp";
        conn = DriverManager.getConnection(url,"root","12341234");
        return conn;
    }
}

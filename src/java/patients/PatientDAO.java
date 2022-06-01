package patients;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

public class PatientDAO {
    private static String LOGIN = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE gmail=? AND password=?";
    
    public PatientDTO checkLogin(String gmail, String password) throws SQLException {
        PatientDTO patient = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, gmail);
                ptm.setString(2, password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int status = rs.getInt("status");
                    patient = new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return patient;
    }
}

package doctors;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;
import doctors.DoctorDTO;

public class DoctorDAO {
    
    private static String LOGIN = "SELECT doctorID, serviceTypeID, fullName, password, roleID, gender, workDayID, gmail, phone, image, status FROM tblDoctors WHERE gmail=? AND password=?";
    private static String CHECK_DUPLICATE = "SELECT fullName FROM tblDoctors WHERE doctorID=?";
    public DoctorDTO checkLogin(String gmail, String password) throws SQLException {
        DoctorDTO doctor = null;
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
                    int doctorID = rs.getInt("doctorID");
                    int serviceTypeID = rs.getInt("serviceTypeID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String gender = rs.getString("gender");
                    int workDayID = rs.getInt("workDayID");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status = rs.getInt("status");
                    doctor = new DoctorDTO(doctorID, serviceTypeID, fullName, password, roleID, gender, workDayID, gmail, phone, image, status);
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
        return doctor;
    }
    
    public boolean checkDuplicate(String doctorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, doctorID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(ptm != null) {
                ptm.close();
            }
            if(conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean checkDuplicate (DoctorDTO doctor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                String sql = "SELECT doctorID FROM tblDoctors WHERE doctorID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, doctor.getDoctorID());
                rs = ptm.executeQuery();
                if(rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(ptm != null) {
                ptm.close();
            }
            if(conn != null) {
                conn.close();
            }
        }
        return check;
    }
}

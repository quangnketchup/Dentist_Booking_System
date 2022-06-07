package doctors;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import doctors.DoctorDTO;

import utils.DBUtils;
import doctors.DoctorDTO;

public class DoctorDAO {

    private static final String GET_ALL_LIST_DOCTOR = "SELECT  d.doctorID, s.serviceTypeName, d.fullName,d.gender, d.gmail, d.phone, d.image, d.status, d.workDayID from tblDoctors d, tblServiceTypes s WHERE d.serviceTypeID=s.serviceTypeID";
    private static String LOGIN = "SELECT doctorID, serviceTypeID, fullName, password, roleID, gender, workDayID, gmail, phone, image, status FROM tblDoctors WHERE gmail=? AND password=?";
    private static String CHECK_DUPLICATE = "SELECT fullName FROM tblDoctors WHERE doctorID=?";
    private static final String SEARCH_DOCTOR_BY_NAME ="SELECT  d.doctorID, s.serviceTypeName, d.fullName,d.gender, d.gmail, d.phone, d.image, d.status, d.workDayID from tblDoctors d, tblServiceTypes s WHERE d.serviceTypeID=s.serviceTypeID AND d.fullName like ? ";
    private static final String UPDATE_DOCTOR = "UPDATE tblDoctors SET serviceTypeID =?, workDayID =?, status=?"
                        + " WHERE doctorID =? ";
    
    private static final String SET_DOCTOR_OFF= "UPDATE tblDoctors SET status = 0 WHERE doctorID=?";
    
    public boolean setDoctorOff(int id) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(SET_DOCTOR_OFF);
                pstm.setInt(1, id);
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
     public boolean updateDoctor(DoctorDTO doctor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(UPDATE_DOCTOR);
                pstm.setString(1, doctor.getServiceTypeName());
                pstm.setInt(2, doctor.getWorkDayID());  
                pstm.setInt(3, doctor.getStatus());
                pstm.setInt(4, doctor.getDoctorID());
                check = pstm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    
    public List<DoctorDTO> searchDoctorByName(String name) throws SQLException{
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn !=null){
                ptm = conn.prepareStatement(SEARCH_DOCTOR_BY_NAME);
                ptm.setString(1, "%"+name+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName=rs.getString("serviceTypeName");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gender = rs.getString("gender");
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status =rs.getInt("status");
                    String roleID="DR";
                    int workDayID=rs.getInt("workDayID");
                    list.add(new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, workDayID, gmail,phone ,image,status));
                }
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            } 
        }
        return list;
    }
    
    public List<DoctorDTO> getAllListDoctor() throws SQLException {
        List<DoctorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_DOCTOR);
                rs= ptm.executeQuery();
                while (rs.next()) {
                    int doctorID = rs.getInt("doctorID");
                    String serviceTypeName=rs.getString("serviceTypeName");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gender = rs.getString("gender");
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status =rs.getInt("status");
                    String roleID="DR";
                    int workDayID=rs.getInt("workDayID");
                    list.add(new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, workDayID, gmail,phone ,image,status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) {
                rs.close();
            }
            if(conn != null) {
                conn.close();
            }
            if(ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
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
                    String serviceTypeName = rs.getString("serviceTypeName");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String gender = rs.getString("gender");
                    int workDayID = rs.getInt("workDayID");
                    int phone = rs.getInt("phone");
                    String image = rs.getString("image");
                    int status = rs.getInt("status");
                    doctor = new DoctorDTO(doctorID, serviceTypeName, fullName, password, roleID, gender, workDayID, gmail, phone, image, status);
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

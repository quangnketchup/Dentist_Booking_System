package patients;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;
import patients.PatientDTO;

public class PatientDAO {

    private static final String GET_ALL_LIST_PATIENT = "SELECT  * FROM tblPatients";
    private static String LOGIN = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE gmail=? AND password=?";
    private static String SEARCH_PATIENT = "SELECT Patient,fullName,roleID FROM tblUsers WHERE fullName like ?";
    private static final String UPDATE_PATIENT = "UPDATE tblPatients SET status=?"
            + " WHERE patientID =? ";
    private static final String SEARCH_PATIENT_BY_NAME = "SELECT patientID, fullName, password, roleID, gmail, phone, address, gender, status FROM tblPatients WHERE fullName like ?";
    private static String CHECK_DUPLICATE = "SELECT fullName FROM tblPatients WHERE patientID=?";

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

    public List<PatientDTO> getAllListPatient() throws SQLException {
        List<PatientDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_PATIENT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String roleID = "PA";
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int status = rs.getInt("status");
                    list.add(new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }

    public boolean updatePatient(PatientDTO patient) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE_PATIENT);                
                pstm.setInt(1, patient.getStatus());
                pstm.setInt(2, patient.getPatientID());
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

    public List<PatientDTO> searchPatientByName(String name) throws SQLException {
        List<PatientDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PATIENT_BY_NAME);
                ptm.setString(1, "%" + name + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int patientID = rs.getInt("patientID");
                    String fullName = rs.getString("fullName");
                    String password = "***";
                    String gmail = rs.getString("gmail");
                    int phone = rs.getInt("phone");
                    String address = rs.getString("address");
                    String gender = rs.getString("gender");
                    int status = rs.getInt("status");
                    String roleID = "PA";
                    list.add(new PatientDTO(patientID, fullName, password, roleID, gmail, phone, address, gender, status));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return list;
    }
    
    public boolean checkDuplicate(String patientID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, patientID);
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
    
    public boolean checkDuplicate (PatientDTO patient) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                String sql = "SELECT patientID FROM tblPatients WHERE patientID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, patient.getPatientID());
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

    public List<PatientDTO> getListUser(String search) throws SQLException {
        List<PatientDTO> listPatient = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_PATIENT);
            }
        } catch (Exception e) {
        }
        return listPatient;
    }
}

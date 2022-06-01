package admins;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import admins.AdminDTO;

import utils.DBUtils;

public class AdminDAO {

    private static final String LOGIN = "SELECT adminID, adminName, password, gmail, roleID FROM tblAdministrators WHERE gmail=? AND password =?";
    private static final String CHECK_DUPLICATE = "SELECT fullname FROM tblAdministrators WHERE adminID=?";

    public AdminDTO checkLogin(String gmail, String password) throws SQLException {
        AdminDTO admin = null;
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
                    int adminID = rs.getInt("adminID");
                    String adminName = rs.getString("adminName");
                    String roleID = rs.getString("roleID");
                    admin = new AdminDTO(adminID, adminName, password, gmail, roleID);
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
        return admin;
    }

    public boolean checkDuplicate(String accountID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, accountID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
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
        return check;
    }

    public boolean checkDuplicate(AdminDTO userGG) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "select accountID from tblAccounts where accountID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, userGG.getAccountID());
                rs = stm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
//    public boolean insertUserGG(AdminDTO userGG) throws SQLException {
//        boolean check = true;
//        Connection conn = null;
//        PreparedStatement stm = null;
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                String sql = "insert into tblUsers(account, fullName, password, gmail, phone, image, roleName, description, status) values(?, ?, ? ,?, ?, ?, ?, ?, ?)";
//                stm = conn.prepareStatement(sql);
//                stm.setInt(1, userGG.getAccountID());
//                stm.setString(2, userGG.getFullName());
//                stm.setString(3, userGG.getPassword());
//                stm.setString(4, userGG.getGmail());
//                stm.setInt(5, userGG.getPhone());
//                stm.setString(6, userGG.getImage());
//                stm.setString(7, userGG.getRoleName());
//                stm.setString(8, userGG.getDesicription());
//                stm.setString(9, userGG.getStatus());
//
//                check = stm.executeUpdate() > 0;
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (stm != null) {
//                stm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return check;
//    }
}

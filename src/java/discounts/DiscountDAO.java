package discounts;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.DBUtils;

public class DiscountDAO {

    private static final String GET_ALL_LIST_DISCOUNT = "SELECT  * FROM tblDiscounts";
    private static final String SEARCH_DISCOUNT_BY_TITLE = "SELECT discountID, title, description, percentDiscount, status, image, createDate, expiredDate, adminID FROM tblDiscounts WHERE title like ?";
    private static final String UPDATE_DISCOUNT = "UPDATE tblDiscounts SET percentDiscount=?, status=?, createDate =?, expiredDate=?"
            + " WHERE discountID =?";
   

    public List<DiscountDTO> getAllListDiscount() throws SQLException {
        List<DiscountDTO> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_DISCOUNT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int discountID = rs.getInt("discountID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int percentDiscount = rs.getInt("percentDiscount");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    String createDate = rs.getString("createDate");
                    String expiredDate = rs.getString("expiredDate");
                    int adminID = rs.getInt("adminID");
                    list.add(new DiscountDTO(discountID, title, description, percentDiscount, status, image, createDate, expiredDate, adminID));
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

    public List<DiscountDTO> searchDiscountByTitle(String name) throws SQLException {
        List<DiscountDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_DISCOUNT_BY_TITLE);
                ptm.setString(1, "%" + name + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int discountID = rs.getInt("discountID");
                    String title = rs.getString("title");
                    String description = rs.getString("description");
                    int percentDiscount = rs.getInt("percentDiscount");
                    int status = rs.getInt("status");
                    String image = rs.getString("image");
                    String createDate = rs.getString("createDate");
                    String expiredDate = rs.getString("expiredDate");
                    int adminID = rs.getInt("adminID");
                    list.add(new DiscountDTO(discountID, title, description, percentDiscount, status, image, createDate, expiredDate, adminID));
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

    public boolean UpdateDiscount(DiscountDTO discount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                pstm = conn.prepareStatement(UPDATE_DISCOUNT);
                pstm.setInt(1, discount.getPercentDiscount());
                pstm.setInt(2, discount.getStatus());
                pstm.setString(3, discount.getCreateDate());
                pstm.setString(4, discount.getExpiredDate());
                pstm.setInt(5, discount.getDiscountID());
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

    
    public boolean checkDuplicate(DiscountDTO discount) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT discountID FROM tblDiscounts WHERE discountID=?";
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, discount.getDiscountID());
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

}

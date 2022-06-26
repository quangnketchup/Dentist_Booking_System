/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookingdetail;

import booking.BookingDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Doan
 */
public class BookingDetailDAO {
    private static final String GET_BOOKING_DETAIL_BYDOCTORID = "SELECT  b.scheduleID, b.serviceID FROM tblBookingDetails b, tblSchedules s WHERE b.scheduleID=s.scheduleID and s.day>GETDATE() -7 and doctorID =?";
    private static final String INSERT_BOOKINGDETAIL ="INSERT tblBookingDetails ([expectedFee], [bookingID],[serviceID],[scheduleID]) VALUES ( ?, ?, ?, ?)";
    private static final String CHECK_VALID = "select bk.BookingDetailID from tblBookingDetails bk, tblSchedules s where bk.scheduleID=s.scheduleID and s.slot =? and s.day like ? and  doctorID = ?";

    public boolean checkExistBookingDetai(String date, int slotID, int drID) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check=false;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(CHECK_VALID);
                ptm.setInt(1, slotID);
                ptm.setString(2, date);
                ptm.setInt(3,drID);
                rs = ptm.executeQuery();
                if (rs.next()) {                    
                    check=true;
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
        return check;
    }
     public boolean createBookingDetail(BookingDetailDTO bkDetail, int bkID) throws SQLException {
        boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(INSERT_BOOKINGDETAIL);
                pstm.setInt(1, bkDetail.getExpectedFee());
                pstm.setInt(2, bkID);
                pstm.setInt(3, bkDetail.getServiceID());
                pstm.setInt(4, bkDetail.getScheduleID());
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
    
    public List<BookingDetailDTO> getBookingDetailByDoctorID(int id) throws SQLException {
        List<BookingDetailDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_BOOKING_DETAIL_BYDOCTORID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID=rs.getInt("serviceID");
                    int scheduleID=rs.getInt("scheduleID");
                    list.add(new BookingDetailDTO( serviceID,scheduleID));
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
}

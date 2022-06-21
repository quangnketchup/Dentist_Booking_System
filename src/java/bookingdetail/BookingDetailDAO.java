/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookingdetail;

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
    private static final String GET_BOOKING_DETAIL_BYDOCTORID = "SELECT  * FROM tblBookingDetails WHERE bookingDate> getdate() AND doctorID = ?";
    
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
                    int idDoctor = rs.getInt("doctorID");
                    int slotID = rs.getInt("slotID");
                    String dateBooking = rs.getString("bookingDate");
                    
                    list.add(new BookingDetailDTO( slotID,idDoctor, dateBooking));
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

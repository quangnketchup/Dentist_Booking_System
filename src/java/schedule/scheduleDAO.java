/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import serviceImage.ServiceImageDTO;
import utils.DBUtils;

/**
 *
 * @author Doan
 */
public class scheduleDAO {
     private static final String GET_SCHEDULE_BY_DOCTOR_ID ="select * from tblSchedules where day>GETDATE() and status =1 and  doctorID= ?";
     private static final String SET_OFF_SCHEDULE ="update tblSchedules set status= 0 where slot =? and day = ? and doctorID = ?";
     private static final String SET_ON_SCHEDULE ="update tblSchedules set status= 1 where slot =? and day = ? and doctorID = ?";
     private static final String CREATE_SCHEDULE = "Insert tblSchedules (dayOfWeek,day,slot,status,doctorID) values(?,?,?,?,?)";
     
     
     public boolean createDoctor(scheduleDTO scheduleDTO) throws SQLException{
         boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(CREATE_SCHEDULE);
                pstm.setString(1, scheduleDTO.getDayOfWeek());
                pstm.setString(2, scheduleDTO.getDay());
                pstm.setInt(3, scheduleDTO.getSlot());
                pstm.setInt(4, 1);
                pstm.setInt(5, scheduleDTO.getDoctorID());                
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
     
      public boolean setOnSchedule(int slot,String day, int doctorID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {       
                ptm = conn.prepareStatement(SET_ON_SCHEDULE);
                ptm.setInt(1, slot);
                ptm.setString(2, day);
                ptm.setInt(3, doctorID);
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
     
     public boolean setOffSchedule(int slot,String day, int doctorID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {       
                ptm = conn.prepareStatement(SET_OFF_SCHEDULE);
                ptm.setInt(1, slot);
                ptm.setString(2, day);
                ptm.setInt(3, doctorID);
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
     
     public List<scheduleDTO> getScheduleByDoctorID(int id) throws SQLException {
        List<scheduleDTO> list =new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_SCHEDULE_BY_DOCTOR_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String dayOfWeek = rs.getString("dayOfWeek");
                    String day = rs.getString("day");  
                    int slot =rs.getInt("slot");
                    int status=rs.getInt("status");
                    int doctorID= rs.getInt("doctorID");
                    list.add(new scheduleDTO(dayOfWeek,day,slot,doctorID,status));
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
}

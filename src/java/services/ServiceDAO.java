/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.ServiceType;
import utils.DBUtils;
import services.ServiceDTO;

public class ServiceDAO {
    
    private static final String GET_ALL_LIST_SERVICE = "SELECT  * FROM tblServices";
    public boolean updateService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblServices SET image =?, servicePrice =?, status = ?"
                        + " WHERE serviceID =? ";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, service.getImage());
                pstm.setInt(2, (int) service.getServicePrice());
                pstm.setInt(3, service.getStatus());
                pstm.setInt(4, service.getServiceID());
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
    public List<ServiceDTO> getAllListService() throws SQLException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_LIST_SERVICE);
                rs= ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    int servicePrice = rs.getInt("servicePrice");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    int adminID = rs.getInt("adminID");
                    int serviceTypeID = rs.getInt(  "serviceTypeID");
                    int status = rs.getInt("status");
                    list.add(new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, image, description, adminID, status));
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
    

    public List<ServiceDTO> getServiceByServiceTypeID(int serviceTypeID) throws SQLException {
        List<ServiceDTO> ListService = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ListService = new ArrayList<>();
                String sql = " SELECT serviceID, serviceName, servicePrice, image, description, serviceTypeID "
                        + " FROM tblServices "
                        + " WHERE serviceTypeID = ? ";
                pstm = conn.prepareStatement(sql);
                pstm.setInt(1, serviceTypeID);
                resultSet = pstm.executeQuery();
                while (resultSet.next()) {
                    int serviceID = resultSet.getInt("serviceID");
                    String serviceName = resultSet.getString("serviceName");
                    String image = resultSet.getNString("image");
                    float servicePrice = resultSet.getFloat("servicePrice");
                    String description = resultSet.getString("description");
                    ListService.add(new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, image, description));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (pstm != null) {
                pstm.close();
            }
            if (conn != null) {
                conn.close();
            }

        }
        return ListService;
    }
}

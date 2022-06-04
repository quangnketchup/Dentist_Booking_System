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

public class ServiceDAO {
    
    private static final String GET_ALL_LIST_SERVICE = "SELECT  * FROM tblServices";
    public boolean updateService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblServices SET serviceName =?, image =?, servicePrice =?, serviceTypeID =?, description =? , status = ?"
                        + " WHERE serviceID =? ";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, service.getServiceName());
                pstm.setString(2, service.getImage());
                pstm.setInt(3, (int) service.getServicePrice());
                pstm.setInt(4, (int) service.getServiceTypeID());
                pstm.setString(5, service.getDescription());
                pstm.setInt(6, service.getStatus());
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
    
    public List<ServiceType> getListServiceType() throws SQLException {
        List<ServiceType> getListServiceType = null;
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet resultSet = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                getListServiceType = new ArrayList<>();
                String sql = " SELECT serviceTypeID, serviceName "
                        + " FROM tblServicesTypes ";
                pstm = conn.prepareStatement(sql);
                resultSet = pstm.executeQuery();
                while (resultSet.next()) {
                    int serviceTypeID = resultSet.getInt("serviceTypeID");
                    String serviceName = resultSet.getNString("serviceName");
                    getListServiceType.add(new ServiceType(serviceTypeID, serviceName));
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
        return getListServiceType;
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
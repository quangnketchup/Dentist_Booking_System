/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.ServiceType;
import utils.DBUtils;
import services.ServiceDTO;

public class ServiceDAO {
    
    private static final String CREATE_SERVICE ="INSERT tblServices ( [serviceName], [servicePrice], [image], [description], [status],[adminID], [serviceTypeName]) VALUES (?,?,?,?,?,?,?)";
    private static final String SEARCH_SERVICE_CONTROLLER = "SELECT s.serviceID, st.serviceTypeID, s.serviceName, s.servicePrice, s.image, s.description, s.status, s.adminID FROM tblServices s, tblServiceTypes st WHERE st.serviceTypeID = s.serviceTypeID AND serviceName like ?";
    private static final String GET_ALL_LIST_SERVICE = "SELECT  * FROM tblServices";
    private static final String SEARCH_SERVICE_CONTROLLER_BY_ID = "SELECT s.serviceID, st.serviceTypeID, s.serviceName, s.servicePrice, s.image, s.description, s.status, s.adminID FROM tblServices s, tblServiceTypes st WHERE st.serviceTypeID = s.serviceTypeID AND s.serviceID = ?";
    private static final String GET_LIST_FEEDBACK_SERVICE = "SELECT s.serviceID, s.serviceName, s.servicePrice, s.description, s.adminID, s.serviceTypeID , pa.fullName, paf.dateFeedback, paf.content FROM tblServices s, tblPatientFeedbacks paf, tblPatients pa WHERE s.serviceID = paf.serviceID AND pa.patientID = paf.patientID AND s.status = 1";
   
    
    
    public ServiceDTO getServiceById(int id) throws SQLException{
        ServiceDTO sv = new ServiceDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn !=null){
                ptm = conn.prepareStatement(SEARCH_SERVICE_CONTROLLER_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while(rs.next()){
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    int servicePrice = rs.getInt("servicePrice");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int adminID = rs.getInt("adminID");
                    int serviceTypeID = rs.getInt("serviceTypeID");
                    sv= new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, description, adminID, status);
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
        return sv;
    }
    
    
    
    
    public boolean updateService(ServiceDTO service) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE tblServices SET serviceName=?, image =?, servicePrice =?, status = ?"
                        + " WHERE serviceID =? ";
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, service.getServiceName());
                pstm.setInt(3, (int) service.getServicePrice());
                pstm.setInt(4, service.getStatus());
                pstm.setInt(5, service.getServiceID());
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
                    String description = rs.getString("description");
                    int adminID = rs.getInt("adminID");
                    int serviceTypeID = rs.getInt(  "serviceTypeID");
                    int status = rs.getInt("status");
                    list.add(new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, description, adminID, status));
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
    public List<ServiceDTO> getListFeedBackService() throws SQLException {
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_LIST_FEEDBACK_SERVICE);
                rs= ptm.executeQuery();
                while (rs.next()) {                    
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    int servicePrice = rs.getInt("servicePrice");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    int adminID = rs.getInt("adminID");
                    int serviceTypeID = rs.getInt(  "serviceTypeID");
                    String fullName = rs.getString("fullName");
                    Date dateFeedback = rs.getDate("dateFeedback");
                    String content = rs.getString("content");
                    int percentDiscount = rs.getInt("percentDiscount");
                    Date createDate = rs.getDate("createDate");
                    Date expiredDate = rs.getDate("expiredDate");
                    int statusDiscount = rs.getInt("status");
                    list.add(new ServiceDTO());
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
                    int servicePrice = resultSet.getInt("servicePrice");
                    String description = resultSet.getString("description");
                    ListService.add(new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, description));
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
    
    public List<ServiceDTO> searchServiceByName(String name) throws SQLException{
        List<ServiceDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn !=null){
                ptm = conn.prepareStatement(SEARCH_SERVICE_CONTROLLER);
                ptm.setString(1, "%"+name+"%");
                rs = ptm.executeQuery();
                while(rs.next()){
                    int serviceID = rs.getInt("serviceID");
                    String serviceName = rs.getString("serviceName");
                    int servicePrice = rs.getInt("servicePrice");
                    String image = rs.getString("image");
                    String description = rs.getString("description");
                    int status = rs.getInt("status");
                    int adminID = rs.getInt("adminID");
                    int serviceTypeID = rs.getInt("serviceTypeID");
                    list.add(new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, description, adminID, status));
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
    
    public boolean createService(ServiceDTO service) throws SQLException {
        boolean check=false;
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {      
                pstm = conn.prepareStatement(CREATE_SERVICE);
                pstm.setString(1, service.getServiceName());
                pstm.setFloat(2, service.getServicePrice());
//                pstm.setString(3, service.getImage());
                pstm.setString(4, service.getDescription());
                pstm.setInt(5, service.getStatus());
                pstm.setInt(6, service.getAdminID());
                pstm.setString(7, service.getServiceTypeName());
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
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package serviceImage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import patients.PatientDTO;
import utils.DBUtils;

/**
 *
 * @author Doan
 */
public class ServiceImageDAO {
    
    public String GET_IMAGE_BY_SERVICE_ID = "select * from tblServiceImages WHERE serviceID = ?";
    
    
    public List<ServiceImageDTO> getImageByServiceID(int id) throws SQLException {
        List<ServiceImageDTO> list =new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_IMAGE_BY_SERVICE_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String image = rs.getString("image");
                    int serviceID = rs.getInt("serviceID");                   
                    list.add(new ServiceImageDTO(image, serviceID));
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
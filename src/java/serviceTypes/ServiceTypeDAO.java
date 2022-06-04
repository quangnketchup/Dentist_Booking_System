package serviceTypes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import services.ServiceType;
import utils.DBUtils;

public class ServiceTypeDAO {
<<<<<<< HEAD
       public List<ServiceTypeDTO> getListServiceType() throws SQLException {
        List<ServiceTypeDTO> getListServiceType = null;
=======
    public List<ServiceType> getListServiceType() throws SQLException {
        List<ServiceType> getListServiceType = null;
>>>>>>> 0beb1c80134d605e053c91920eca7696978ee92a
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
<<<<<<< HEAD
                    getListServiceType.add(new ServiceTypeDTO(serviceTypeID, serviceName));
=======
                    getListServiceType.add(new ServiceType(serviceTypeID, serviceName));
>>>>>>> 0beb1c80134d605e053c91920eca7696978ee92a
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
<<<<<<< HEAD
    
=======
>>>>>>> 0beb1c80134d605e053c91920eca7696978ee92a
}

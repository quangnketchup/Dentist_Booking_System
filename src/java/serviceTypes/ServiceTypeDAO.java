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

       public List<ServiceTypeDTO> getListServiceType() throws SQLException {
        List<ServiceTypeDTO> getListServiceType = null;
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
                    getListServiceType.add(new ServiceTypeDTO(serviceTypeID, serviceName));

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

}

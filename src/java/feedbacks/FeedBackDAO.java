/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedbacks;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author quang
 */
public class FeedBackDAO {

    private static final String SEARCH_FEEDBACK_BY_SERVICEID = "SELECT  paf.serviceFeedBackID, paf.content, paf.rateStar, paf.dateFeedback, pa.fullName, paf.status "
            + "from tblServices s, tblPatientFeedbacks paf, tblPatients pa "
            + "WHERE s.serviceID = paf.serviceID AND pa.patientID = paf.patientID AND paf.status = 1 AND paf.serviceID=?";
    private static final String GET_LIST_FEEDBACK_SERVICE_USER = "SELECT paf.serviceFeedBackID, paf.content, paf.rateStar, paf.dateFeedback, pa.fullName, paf.status "
            + "FROM tblServices s, tblPatientFeedbacks paf, tblPatients pa "
            + "WHERE s.serviceID = paf.serviceID AND pa.patientID = paf.patientID AND paf.status = 1";

    public List<FeedbackDTO> getListFeedBackService() throws SQLException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_FEEDBACK_SERVICE_USER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int serviceFeedBackID = rs.getInt("serviceFeedBackID");
                    String content = rs.getString("content");
                    Date dateFeedback = rs.getDate("dateFeedback");
                    int rateStar = rs.getInt("rateStar");
                    String fullName = rs.getString("fullName");
                    int serviceID = rs.getInt("serviceID");
                    int status = rs.getInt("status");
                    list.add(new FeedbackDTO(serviceFeedBackID, dateFeedback, content, rateStar, fullName, serviceID, status));
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

    public FeedbackDTO getFeedbackByServiceID(int serviceID) throws SQLException {
        FeedbackDTO list = new FeedbackDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_FEEDBACK_BY_SERVICEID);
                ptm.setInt(1, serviceID);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int serviceFeedBackID = rs.getInt("serviceFeedBackID");
                    String content = rs.getString("content");
                    Date dateFeedback = rs.getDate("dateFeedback");
                    int rateStar = rs.getInt("rateStar");
                    String fullName = rs.getString("fullName");
                    int status = rs.getInt("status");
                    list = new FeedbackDTO(serviceFeedBackID, dateFeedback, content, rateStar, fullName, serviceID, status);
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

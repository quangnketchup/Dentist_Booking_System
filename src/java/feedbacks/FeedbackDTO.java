/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedbacks;

import java.sql.Date;

public class FeedbackDTO {
    int serviceFeedBackID;
    Date dateFeedback;
    String content;
    int rateStar;
    String patientName;
    String serviceName;
    int status;

    public FeedbackDTO() {
        
    }
    
    public FeedbackDTO(int serviceFeedBackID, Date dateFeedback, String content, int rateStar, String patientName, String serviceName, int status) {
        this.serviceFeedBackID = serviceFeedBackID;
        this.dateFeedback = dateFeedback;
        this.content = content;
        this.rateStar = rateStar;
        this.patientName = patientName;
        this.serviceName = serviceName;
        this.status = status;
    }

    public int getServiceFeedBackID() {
        return serviceFeedBackID;
    }

    public void setServiceFeedBackID(int serviceFeedBackID) {
        this.serviceFeedBackID = serviceFeedBackID;
    }

    public Date getDateFeedback() {
        return dateFeedback;
    }

    public void setDateFeedback(Date dateFeedback) {
        this.dateFeedback = dateFeedback;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRateStar() {
        return rateStar;
    }

    public void setRateStar(int rateStar) {
        this.rateStar = rateStar;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}

package services;

import java.util.Date;

public class ServiceDTO {

    int serviceID;
    int serviceTypeID;
    String serviceName;
    int servicePrice;
    String description;
    int adminID;
    int status;
    String serviceTypeName;

    //khai bao feedback cua service
    String fullName;
    Date dateFeedback;
    String content;
    int statusFeedback;

    //khai bao discount 
    int percentDiscount;
    Date createDate;
    Date expiredDate;
    int statusDiscount;

    public ServiceDTO() {
        this.serviceID = 0;
        this.serviceTypeID = 0;
        this.serviceName = "";
        this.servicePrice = 0;
        this.description = "";
        this.adminID = 0;
        this.status = 0;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, int servicePrice, String description, int adminID, int status, String fullName, Date dateFeedback, String content, int statusFeedback, int percentDiscount,
            Date createDate,
            Date expiredDate,
            int statusDiscount) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.description = description;
        this.adminID = adminID;
        this.status = status;
        this.fullName = fullName;
        this.dateFeedback = dateFeedback;
        this.content = content;
        this.statusFeedback = statusFeedback;
        this.percentDiscount = percentDiscount;
        this.createDate = createDate;
        this.expiredDate = expiredDate;
        this.statusDiscount = statusDiscount;
    }

    public ServiceDTO(int serviceID, String serviceName, int servicePrice,  String description, int adminID, int status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.description = description;
        this.adminID = adminID;
        this.status = status;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, int servicePrice,String description, int status) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.description = description;
        this.status = status;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, int servicePrice, String description) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.description = description;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, int servicePrice,String description, int adminID, int status) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.description = description;
        this.adminID = adminID;
        this.status = status;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getServiceTypeID() {
        return serviceTypeID;
    }

    public void setServiceTypeID(int serviceTypeID) {
        this.serviceTypeID = serviceTypeID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public int getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(int servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public int getStatusFeedback() {
        return statusFeedback;
    }

    public void setStatusFeedback(int statusFeedback) {
        this.statusFeedback = statusFeedback;
    }

    public int getPercentDiscount() {
        return percentDiscount;
    }

    public void setPercentDiscount(int percentDiscount) {
        this.percentDiscount = percentDiscount;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getExpiredDate() {
        return expiredDate;
    }

    public void setExpiredDate(Date expiredDate) {
        this.expiredDate = expiredDate;
    }

    public int getStatusDiscount() {
        return statusDiscount;
    }

    public void setStatusDiscount(int statusDiscount) {
        this.statusDiscount = statusDiscount;
    }

    
}

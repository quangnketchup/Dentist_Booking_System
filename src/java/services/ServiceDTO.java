package services;

public class ServiceDTO {

    int serviceID;
    int serviceTypeID;
    String serviceName;
    float servicePrice;
    String image;
    String description;
    int adminID;
    int status;
    String serviceTypeName;
    String adminName;

    public ServiceDTO() {
        this.serviceID = 0;
        this.serviceTypeID = 0;
        this.serviceName = "";
        this.servicePrice = 0;
        this.image = "";
        this.description = "";
        this.adminID = 0;
        this.status = 0;
    }

    public ServiceDTO(int serviceID, String serviceName, float servicePrice, String image, String description, int adminID, int status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.image = image;
        this.description = description;
        this.adminID = adminID;
        this.status = status;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, float servicePrice, String image, String description, int status) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.image = image;
        this.description = description;
        this.status = status;
    }

    public ServiceDTO(int serviceID, String serviceName, float servicePrice, String image, String description, int adminID, int status, String serviceTypeName) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.image = image;
        this.description = description;
        this.adminID = adminID;
        this.status = status;
        this.serviceTypeName = serviceTypeName;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, float servicePrice, String image, String description) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.image = image;
        this.description = description;
    }

    public ServiceDTO(int serviceID, int serviceTypeID, String serviceName, float servicePrice, String image, String description, int adminID, int status) {
        this.serviceID = serviceID;
        this.serviceTypeID = serviceTypeID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.image = image;
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

    public float getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(float servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

}

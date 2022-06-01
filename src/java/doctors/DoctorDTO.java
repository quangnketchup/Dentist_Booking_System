package doctors;

public class DoctorDTO {
    int doctorID;
    int serviceTypeID;
    String fullName;
    String password;
    String roleID;
    String gender;
    int workDayID;
    String gmail;
    int phone;
    String image;
    int status;

    public DoctorDTO() {
        this.doctorID = 0;
        this.serviceTypeID = 0;
        this.fullName = "";
        this.password = "";
        this.roleID = "";
        this.gender = "";
        this.workDayID = 0;
        this.gmail = "";
        this.phone = 0;
        this.image = "";
        this.status = 0;
    }
    
    public DoctorDTO(int doctorID, int serviceTypeID, String fullName, String password, String roleID, String gender, int workDayID, String gmail, int phone, String image, int status) {
        this.doctorID = doctorID;
        this.serviceTypeID = serviceTypeID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.gender = gender;
        this.workDayID = workDayID;
        this.gmail = gmail;
        this.phone = phone;
        this.image = image;
        this.status = status;
    }

    public DoctorDTO(int doctorID, int serviceTypeID, String fullName, String password, String roleID, String gender, int workDayID, String gmail, int phone, String image) {
        this.doctorID = doctorID;
        this.serviceTypeID = serviceTypeID;
        this.fullName = fullName;
        this.password = password;
        this.roleID = roleID;
        this.gender = gender;
        this.workDayID = workDayID;
        this.gmail = gmail;
        this.phone = phone;
        this.image = image;
    }

    
    public int getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(int doctorID) {
        this.doctorID = doctorID;
    }

    public int getServiceTypeID() {
        return serviceTypeID;
    }

    public void setServiceTypeID(int serviceTypeID) {
        this.serviceTypeID = serviceTypeID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getWorkDayID() {
        return workDayID;
    }

    public void setWorkDayID(int workDayID) {
        this.workDayID = workDayID;
    }

    public String getGmail() {
        return gmail;
    }

    public void setGmail(String gmail) {
        this.gmail = gmail;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}

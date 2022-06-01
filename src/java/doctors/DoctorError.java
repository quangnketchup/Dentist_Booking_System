package doctors;

public class DoctorError {
    int doctorIDError;
    int serviceTypeIDError;
    String fullNameError;
    String passwordError;
    String confirmPassword;
    String roleIDError;
    String genderError;
    int workDayIDError;
    String gmailError;
    int phoneError;
    String imageError;
    int statusError;

    public DoctorError() {
        this.doctorIDError = 0;
        this.serviceTypeIDError = 0;
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmPassword = "";
        this.roleIDError = "";
        this.genderError = "";
        this.workDayIDError = 0;
        this.gmailError = "";
        this.phoneError = 0;
        this.imageError = "";
        this.statusError = 0;
    }
    public DoctorError(int doctorIDError, int serviceTypeIDError, String fullNameError, String passwordError, String confirmPassword, String roleIDError, String genderError, int workDayIDError, String gmailError, int phoneError, String imageError, int statusError) {
        this.doctorIDError = doctorIDError;
        this.serviceTypeIDError = serviceTypeIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmPassword = confirmPassword;
        this.roleIDError = roleIDError;
        this.genderError = genderError;
        this.workDayIDError = workDayIDError;
        this.gmailError = gmailError;
        this.phoneError = phoneError;
        this.imageError = imageError;
        this.statusError = statusError;
    }

    public int getDoctorIDError() {
        return doctorIDError;
    }

    public void setDoctorIDError(int doctorIDError) {
        this.doctorIDError = doctorIDError;
    }

    public int getServiceTypeIDError() {
        return serviceTypeIDError;
    }

    public void setServiceTypeIDError(int serviceTypeIDError) {
        this.serviceTypeIDError = serviceTypeIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getRoleIDError() {
        return roleIDError;
    }

    public void setRoleIDError(String roleIDError) {
        this.roleIDError = roleIDError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public int getWorkDayIDError() {
        return workDayIDError;
    }

    public void setWorkDayIDError(int workDayIDError) {
        this.workDayIDError = workDayIDError;
    }

    public String getGmailError() {
        return gmailError;
    }

    public void setGmailError(String gmailError) {
        this.gmailError = gmailError;
    }

    public int getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(int phoneError) {
        this.phoneError = phoneError;
    }

    public String getImageError() {
        return imageError;
    }

    public void setImageError(String imageError) {
        this.imageError = imageError;
    }

    public int getStatusError() {
        return statusError;
    }

    public void setStatusError(int statusError) {
        this.statusError = statusError;
    }
    
    
}

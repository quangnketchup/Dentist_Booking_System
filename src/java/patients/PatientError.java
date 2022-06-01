package patients;

public class PatientError {
    int patientIDError;
    String fullNameError;
    String passwordError;
    String confirmPassword;
    String roleIDError;
    String gmailError;
    int phoneError;
    String addressError;
    String genderError;
    int statusError;

    public PatientError() {
        this.patientIDError = 0;
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmPassword = "";
        this.roleIDError = "";
        this.gmailError = "";
        this.phoneError = 0;
        this.addressError = "";
        this.genderError = "";
        this.statusError = 0;
    }
    public PatientError(int patientIDError, String fullNameError, String passwordError, String confirmPassword, String roleIDError, String gmailError, int phoneError, String addressError, String genderError, int statusError) {
        this.patientIDError = patientIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmPassword = confirmPassword;
        this.roleIDError = roleIDError;
        this.gmailError = gmailError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.genderError = genderError;
        this.statusError = statusError;
    }

    public PatientError(int patientIDError, String fullNameError, String passwordError, String confirmPassword, String roleIDError, String gmailError, int phoneError, String addressError, String genderError) {
        this.patientIDError = patientIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmPassword = confirmPassword;
        this.roleIDError = roleIDError;
        this.gmailError = gmailError;
        this.phoneError = phoneError;
        this.addressError = addressError;
        this.genderError = genderError;
    }

    
    public int getPatientIDError() {
        return patientIDError;
    }

    public void setPatientIDError(int patientIDError) {
        this.patientIDError = patientIDError;
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

    public String getAddressError() {
        return addressError;
    }

    public void setAddressError(String addressError) {
        this.addressError = addressError;
    }

    public String getGenderError() {
        return genderError;
    }

    public void setGenderError(String genderError) {
        this.genderError = genderError;
    }

    public int getStatusError() {
        return statusError;
    }

    public void setStatusError(int statusError) {
        this.statusError = statusError;
    }
    
    
}

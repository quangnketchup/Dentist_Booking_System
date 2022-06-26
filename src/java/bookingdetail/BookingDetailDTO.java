/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookingdetail;

/**
 *
 * @author Doan
 */
public class BookingDetailDTO {
    String service;;
    int serviceID;
    int bookingID;
    int expectedFee;
    int scheduleID;

    public BookingDetailDTO() {
    }

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    
    
    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }
    
    
    
    public int getExpectedFee() {
        return expectedFee;
    }

    public void setExpectedFee(int expectedFee) {
        this.expectedFee = expectedFee;
    }

    public BookingDetailDTO( int serviceID, int bookingID, int expectedFee) {


        this.serviceID = serviceID;
        this.bookingID = bookingID;
        this.expectedFee = expectedFee;
    }
    
    
    public BookingDetailDTO( int serviceID, int scheduleID) {
        this.serviceID = serviceID;
        this.scheduleID = scheduleID;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }


}

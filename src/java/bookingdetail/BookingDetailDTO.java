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
    int ServiceID;
    int bookingID;
    int expectedFee;
    int scheduleID;

    public int getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(int scheduleID) {
        this.scheduleID = scheduleID;
    }

    
    
    public int getServiceID() {
        return ServiceID;
    }

    public void setServiceID(int ServiceID) {
        this.ServiceID = ServiceID;
    }
    
    
    
    public int getExpectedFee() {
        return expectedFee;
    }

    public void setExpectedFee(int expectedFee) {
        this.expectedFee = expectedFee;
    }

    public BookingDetailDTO( int ServiceID, int bookingID, int expectedFee) {


        this.ServiceID = ServiceID;
        this.bookingID = bookingID;
        this.expectedFee = expectedFee;
    }
    
    public BookingDetailDTO( int ServiceID, int expectedFee) {


        this.ServiceID = ServiceID;
        this.expectedFee = expectedFee;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }


}

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
    String service;
    int idDoctor;
    int slotID;
    String dateBooking;
    int ServiceID;
    int bookingID;
    int expectedFee;

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

    public BookingDetailDTO(int idDoctor, int slotID, String dateBooking, int ServiceID, int bookingID, int expectedFee) {

        this.idDoctor = idDoctor;
        this.slotID = slotID;
        this.dateBooking = dateBooking;
        this.ServiceID = ServiceID;
        this.bookingID = bookingID;
        this.expectedFee = expectedFee;
    }
    
    public BookingDetailDTO(int idDoctor, int slotID, String dateBooking, int ServiceID, int expectedFee) {

        this.idDoctor = idDoctor;
        this.slotID = slotID;
        this.dateBooking = dateBooking;
        this.ServiceID = ServiceID;
        this.expectedFee = expectedFee;
    }
    
    
    public BookingDetailDTO(int slotID, int idDoctor, String dateBooking){
        this.idDoctor=idDoctor;
        this.slotID=slotID;
        this.dateBooking=dateBooking;
    }
    
    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(int idDoctor) {
        this.idDoctor = idDoctor;
    }

    public int getSlotID() {
        return slotID;
    }

    public void setSlotID(int slotID) {
        this.slotID = slotID;
    }

    public String getDateBooking() {
        return dateBooking;
    }

    public void setDateBooking(String dateBooking) {
        this.dateBooking = dateBooking;
    }
    
}

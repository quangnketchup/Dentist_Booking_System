/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.booking;

import booking.BookingDAO;
import booking.BookingDTO;
import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import schedule.scheduleDAO;
import schedule.scheduleDTO;


/**
 *
 * @author Doan
 */
public class SubmitBooking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final String ERROR = "newBooking.jsp";
    private static final String TRUE = "ShowBookingController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            int doctorID=Integer.parseInt(request.getParameter("doctorID"));
            int serviceID= Integer.parseInt(request.getParameter("serviceID"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            int expectedFee= Integer.parseInt(request.getParameter("expectedFee"));
            int patientID = Integer.parseInt(request.getParameter("patientID"));
            String dateBooking= request.getParameter("dateBooking");
            int slotID = Integer.parseInt(request.getParameter("slotID"));
            BookingDetailDTO bkDetail= new BookingDetailDTO(serviceID,expectedFee,patientID);
            BookingDetailDAO bkDetailDAO =new BookingDetailDAO();
            boolean check_valid = bkDetailDAO.checkExistBookingDetai(dateBooking, slotID,doctorID);
            scheduleDAO scheDAO =new scheduleDAO();
            scheduleDTO schee= scheDAO.getScheduleToSubmit(slotID, doctorID, dateBooking);
            int scheID =schee.getScheduleID();
            bkDetail.setScheduleID(scheID);
            if(!check_valid){
                    
                     boolean check2=bkDetailDAO.createBookingDetail(bkDetail);
                    boolean check1 =scheDAO.setBookedSchedule(slotID, dateBooking, doctorID);
                    if(check2 && check1){
                        url=TRUE;
                    request.setAttribute("SUCCESS_ADD_BOOKING", "Bạn đã đặt lịch thành công");
                    request.setAttribute("add_green", schee);
                    }
                
                
            }else{
                request.setAttribute("FAIL_ADD_BOOKING", "Đặt lịch thất bại");
            }
        } catch (Exception e) {
              log("Error at HandleServiceDoctorController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
     
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

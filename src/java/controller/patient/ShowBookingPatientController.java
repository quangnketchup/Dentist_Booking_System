/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.patient;

import bookingdetail.BookingDetailDAO;
import bookingdetail.BookingDetailDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author Doan
 */
public class ShowBookingPatientController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private static final String ERROR = "home.jsp";
    private static final String TRUE = "service_history.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String url = ERROR;
        try {
            HttpSession session = request.getSession();
            BookingDetailDAO bkDetailDAO= new BookingDetailDAO();
            patients.PatientDTO loginPatient = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            int id=loginPatient.getPatientID();
            List<BookingDetailDTO> listBooking=bkDetailDAO.getBookingDetailByPatientID(id);
            scheduleDAO sche = new scheduleDAO();
            DoctorDAO drDao=new DoctorDAO();
            ServiceDAO svDao= new ServiceDAO();
            List<scheduleDTO>listSchedule =new ArrayList<>();
            for(BookingDetailDTO bkDetal:listBooking){
                listSchedule.add(sche.getScheduleByScheduleID(bkDetal.getScheduleID()));
                int idz=bkDetal.getScheduleID();
                int mm =idz;
            }
            for(scheduleDTO schem:listSchedule){
                int idz=schem.getScheduleID();
                int mm =idz;
            }
            List<ServiceDTO>listService=svDao.getAllListService();
            List<DoctorDTO>listDoctor = drDao.getAllListDoctor();
            request.setAttribute("ListBooking", listBooking);
            request.setAttribute("listSchedule", listSchedule);
            request.setAttribute("listDoctor", listDoctor);
            request.setAttribute("listService", listService);
            url=TRUE;
            
        } catch (Exception e) {
             log("Error at ShowDoctorSchedule");
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

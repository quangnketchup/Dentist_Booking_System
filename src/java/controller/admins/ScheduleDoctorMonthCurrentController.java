/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import schedule.scheduleDAO;
import schedule.scheduleDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

/**
 *
 * @author quang
 */
public class ScheduleDoctorMonthCurrentController extends HttpServlet {

    private static final String ERROR = "DB_DoctorDetail.jsp";
    private static final String SUCCESS = "DB_Detail_Schedule_Month_Before.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int doctorID = Integer.parseInt(request.getParameter("doctorID"));
            DoctorDAO drDao = new DoctorDAO();
            DoctorDTO doctor = drDao.getDoctorByID(doctorID);

            ServiceTypeDAO svTypeDAO =new ServiceTypeDAO();
            List<ServiceTypeDTO> listServiceType = svTypeDAO.getListServiceType();
           
            scheduleDAO scheDAO = new scheduleDAO();
            List<scheduleDTO> listScheduleDTO = scheDAO.getListBookedMonthCurrent(doctorID);
            request.setAttribute("DOCTOR_INFOR", doctor);
            request.setAttribute("listScheduleDTO", listScheduleDTO);

            request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
            url = SUCCESS;
        } catch (Exception e) {
            url = ERROR;
            log("Error at ServiceController");
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

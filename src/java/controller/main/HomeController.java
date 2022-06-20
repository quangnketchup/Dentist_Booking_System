/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.main;

import admins.AdminDTO;
import doctors.DoctorDAO;
import doctors.DoctorDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author quang
 */
public class HomeController extends HttpServlet {
    private static final String ERROR ="login.jsp";
    private static String USER = "home.jsp";
    private static String DOCTOR = "home.jsp";
    private static String ADMIN = "home.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = USER;
            try {
                ServiceDAO serviceDao = new ServiceDAO();
                ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();

                List<ServiceDTO> listService = (List<ServiceDTO>) serviceDao.getAllListService();
                List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) serviceTypeDao.getListServiceType();

                DoctorDAO doctorDAO = new DoctorDAO();
                List<DoctorDTO> listDoctor = doctorDAO.getAllListDoctor();

                HttpSession session = request.getSession();

                patients.PatientDTO loginUser = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
                doctors.DoctorDTO loginDoctor = (DoctorDTO) session.getAttribute("LOGIN DOCTOR");
                admins.AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");

                if (loginUser != null || "PA".equals(loginUser.getRoleID())) {
                    if (listService != null) {
                        request.setAttribute("LIST_SERVICE", listService);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        url = USER;
                    }
                } else if ("DR".equals(loginDoctor.getRoleID())) {
                    if (listService != null) {
                        request.setAttribute("LIST_SERVICE", listService);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        url = DOCTOR;
                    }
                } else if ("AD".equals(loginAdmin.getRoleID())) {
                    if (listService != null) {
                        request.setAttribute("LIST_SERVICE", listService);
                        request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
                        request.setAttribute("LIST_DOCTOR", listDoctor);
                        url = ADMIN;
                    }
                }
            } catch (Exception e) {
                url = ERROR;
                log("Error at HomeController: " + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
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

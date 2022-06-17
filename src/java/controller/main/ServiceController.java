/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.main;

import admins.AdminDTO;
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
public class ServiceController extends HttpServlet {

    private static final String ERROR = "home.jsp";
    private static final String SUCCESS = "service.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            HttpSession session = request.getSession();

            ServiceDAO serviceDao = new ServiceDAO();
            ServiceTypeDAO ServiceTypeDAO = new ServiceTypeDAO();
            List<ServiceDTO> listService = serviceDao.getAllListService();
            List<ServiceTypeDTO> listServiceType = ServiceTypeDAO.getListServiceType();

            patients.PatientDTO loginUser = (PatientDTO) session.getAttribute("LOGIN_PATIENT");
            doctors.DoctorDTO loginDoctor = (DoctorDTO) session.getAttribute("LOGIN_DOCTOR");
            admins.AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");

            if (loginAdmin != null && "AD".equals(loginAdmin.getRoleID())) {
                if (listService != null) {
                    session.setAttribute("LIST_SERVICE", listService);
                    session.setAttribute("LIST_SERVICE_TYPE", listServiceType);
                    url = SUCCESS;
                }
            } else if ("PA".equals(loginUser.getRoleID())) {
                if (listService != null) {
                    session.setAttribute("LIST_SERVICE", listService);
                    session.setAttribute("LIST_SERVICE_TYPE", listServiceType);
                    url = SUCCESS;
                }
            }else if ("DR".equals(loginDoctor.getRoleID())) {
                if (listService != null) {
                    session.setAttribute("LIST_SERVICE", listService);
                    session.setAttribute("LIST_SERVICE_TYPE", listServiceType);
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            url=ERROR;
            log("Error at ServiceController: " + e.toString());
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

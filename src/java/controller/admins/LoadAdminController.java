/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admins;

import admins.AdminDTO;
import bookingdetail.BookingDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import patients.PatientDTO;
import serviceImage.ServiceImageDAO;
import serviceImage.ServiceImageDTO;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author Doan
 */
public class LoadAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "index_admin.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
                        HttpSession session = request.getSession();
            AdminDTO loginAdmin = (AdminDTO) session.getAttribute("LOGIN_ADMIN");

            ServiceTypeDAO serviceTypeDao = new ServiceTypeDAO();
            BookingDetailDAO bkDao=new BookingDetailDAO();
            List<ServiceTypeDTO> listServiceType = (List<ServiceTypeDTO>) serviceTypeDao.getListServiceType();
            ServiceDAO serviceDao = new ServiceDAO();
            List<ServiceDTO> listService = serviceDao.getAllListService();
//// Lấy tháng bây giờ
            Date date= new Date();
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int month = cal.get(Calendar.MONTH)+1;
            int money=bkDao.getMoneyMonth(month);
            int numBooking=bkDao.getNumberBooking(month);
            int numFeedBack=bkDao.getNumberFB(month);

            
            request.setAttribute("numFeedBack", numFeedBack);
            request.setAttribute("numBooking", numBooking);
            request.setAttribute("IncomeMonthly", money);
            request.setAttribute("LIST_SERVICE", listService);                
            request.setAttribute("LIST_SERVICE_BY_SVTYPE", listServiceType);
            url = SUCCESS;
       
        } catch (Exception e) {
            url = ERROR;
            log("Error at Load Controller: " + e.toString());
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

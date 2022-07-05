/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import discounts.DiscountDAO;
import discounts.DiscountDTO;
import discounts.DiscountError;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ServiceDAO;
import services.ServiceDTO;

/**
 *
 * @author quang
 */
public class AddDiscountController extends HttpServlet {

    public static final String ERROR = "home.jsp";
    public static final String SUCCESS = "LoadDiscountController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        DiscountError discountError = new DiscountError();
        try {
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int status = 1;
            int percentDiscount = Integer.parseInt(request.getParameter("percentDiscount"));
            int serviceID = Integer.parseInt(request.getParameter("serviceID")); 
            int adminID = Integer.parseInt(request.getParameter("adminID")); 
            String createDate = request.getParameter("createDate");
            String expiredDate = request.getParameter("expiredDate");
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            DiscountDAO dao = new DiscountDAO();
            ServiceDAO svDao = new ServiceDAO();
            List<ServiceDTO> listSV = svDao.getAllListService();
            DiscountDTO doctor = new DiscountDTO(1, title, description, percentDiscount, status, createDate, expiredDate, adminID, serviceID);
            
            if (description.trim().length() == 0) {
                discountError.setDescriptionError("Không thể để trống Description");
                check = false;
            }
            
            if (title.trim().length() == 0 && title.trim().length() >= 50) {
                discountError.setDescriptionError("Chủ đề phải có độ dài [1, 50]");
                check = false;
            }
            
            if (check) {
                boolean checkUpdate = dao.createDiscount(doctor);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("SSMSG", "Chỉnh sữa thành công !");
                }
            } else {
                request.setAttribute("SSMSG", "Chỉnh sữa thất bại !");
            }
        } catch (Exception e) {
            log("Error at Update Discount Controller");
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import services.ServiceDAO;
import services.ServiceDTO;
import services.ServiceError;

public class UpdateServiceController extends HttpServlet {

    public static final String ERROR = "home.jsp";
    public static final String SUCCESS = "UpdateService.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        ServiceError serviceError = new ServiceError();
        try {
            int serviceID = Integer.parseInt(request.getParameter("serviceID"));
            byte[] bytes = request.getParameter("serviceName").getBytes("ISO-8859-1");
            String serviceName = new String(bytes, "UTF-8");
            int servicePrice = Integer.parseInt(request.getParameter("servicePrice"));
            String image = request.getParameter("image");
            String description = request.getParameter("description");
            int status = Integer.parseInt(request.getParameter("status"));
            int serviceTypeID = Integer.parseInt(request.getParameter("serviceTypeID"));
            int adminID = Integer.parseInt(request.getParameter("adminID"));
            
//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            if (serviceName.trim().length() == 0 || serviceName.trim().length()>50) {
                serviceError.setServiceNameError("Tên phải từ [1,50]");
                check = false;
            }
            if (image.trim().length() == 0) {
                serviceError.setImageError("không thể để trống Hình ảnh");
                check = false;
            }
            
            if (servicePrice < 0) {
                serviceError.setServicePriceError("Giá tiền không âm");
                check = false;
            }
            
            ServiceDAO dao = new ServiceDAO();
            ServiceDTO service = new ServiceDTO(serviceID, serviceTypeID, serviceName, servicePrice, image, description, adminID, status);
            if(check) {
                boolean checkUpdate = dao.updateService(service);
                if(checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("ERROR_UPDATE", dao);
            }
        } catch (Exception e) {
            log("Error at Update Service Controller");
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
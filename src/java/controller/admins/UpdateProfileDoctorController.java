/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admins;

import doctors.DoctorDAO;
import doctors.DoctorDTO;
import doctors.DoctorError;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import serviceTypes.ServiceTypeDAO;
import serviceTypes.ServiceTypeDTO;

public class UpdateProfileDoctorController extends HttpServlet {

    private static final String ERROR = "ShowDoctorSchedule";
    private static final String SUCCESS = "ShowProfileDoctorController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        DoctorError doctorError = new DoctorError();
        try {
            int doctorID = Integer.parseInt(request.getParameter("doctorID"));
            String serviceTypeName = request.getParameter("serviceTypeName");
            String fullName = request.getParameter("fullName");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String gmail = request.getParameter("gmail");
            String image = request.getParameter("image");
            int phone = Integer.parseInt(request.getParameter("phone"));
            String gender = request.getParameter("gender");
            String achievement=request.getParameter("achievement");

//            check validation here: checkId, name, role , pass,...password
            boolean check = true;
            if (serviceTypeName.trim().length() == 0 || serviceTypeName.trim().length() > 50) {
                doctorError.setServiceTypeIDError("T??n loai dich vu ph???i t??? [1,50]");
                check = false;
            }
            if (gmail.trim().length() == 0) {
                doctorError.setGmailError("Kh??ng th??? ????? tr???ng Email");
                check = false;
            }
            if (gender.trim().length() == 0) {
                doctorError.setGenderError("Kh??ng th??? ????? tr???ng gi???i t??nh");
                check = false;
            }
            if(image.equals("")){
                doctorError.setImageError("H??nh ???nh kh??ng th??? ????? tr???ng");
                check = false;
            }
            if(!confirmPassword.equals(password)){
                doctorError.setConfirmPassword("Password kh??ng tr??ng nhau");
                check = false;
            }else {
                check=true;
            }
            DoctorDAO dao = new DoctorDAO();
            ServiceTypeDAO svDao = new ServiceTypeDAO();
            List<ServiceTypeDTO> listSV = svDao.getListServiceType();
            DoctorDTO doctor = new DoctorDTO(doctorID, serviceTypeName, fullName, password, "DR", gender, gmail, phone, image, 1,achievement);
            for (ServiceTypeDTO svT : listSV) {
                if (svT.getServiceTypeName().equals(doctor.getServiceTypeName())) {
                    doctor.setServiceTypeName(Integer.toString(svT.getServiceTypeID()));
                }
            }
            if (check) {
                boolean checkUpdate = dao.updateDoctorProfile(doctor);
                if (checkUpdate) {
                    url = SUCCESS;
                    request.setAttribute("SSMSG", "Ch???nh s???a th??nh c??ng !");
                }
            } else {
                request.setAttribute("SSMSG", "Ch???nh s???a th???t b???i !");
            }
        } catch (Exception e) {
            log("Error at Update Doctor Controller");
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Brands;
import model.Users;

/**
 *
 * @author admin
 */
public class adminSetting extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminSetting</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminSetting at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        HttpSession session = request.getSession();

        Users user = (Users) session.getAttribute("acc");

        request.setAttribute("user", user);
        request.getRequestDispatcher("admin/adminSetting.jsp").forward(request, response);
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

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");
        UserDao udao = new UserDao();

        String useridParam = request.getParameter("userid");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        if (useridParam != null && !useridParam.isEmpty() && fullname != null && !fullname.isEmpty()
                && email != null && !email.isEmpty() && phone != null && !phone.isEmpty()
                && address != null && !address.isEmpty()) {

            int id = Integer.parseInt(useridParam);

            Users u = new Users(id, email, fullname, address, phone);

            //update
            udao.updateUser(u);

            //cap nhat vao session
            Users updateUsers = udao.getUser(id);
            session.setAttribute("acc", updateUsers);

            request.setAttribute("noti", "Change my profile success");
            request.setAttribute("user", u);
            request.getRequestDispatcher("admin/adminSetting.jsp").forward(request, response);
        } else {
            String oldpass = request.getParameter("oldpass");
            String newpass = request.getParameter("newpass");
            String repassnew = request.getParameter("repass");
            String checkpass = udao.getPassword(user.getUser_id());

            if (checkpass.equals(oldpass)) {

                if (newpass.equals(repassnew)) {

                    udao.updatePassword(newpass, user.getUser_id());
                    request.setAttribute("success", "Change password success");
                    handleError(request, response, user);
                    return;
                } else {
                    request.setAttribute("errorRe", "Password is not the same");
                    handleError(request, response, user);
                    return;
                }

            } else {
                request.setAttribute("errorOld", "Password is incorrect");
                handleError(request, response, user);
                return;
            }
        }
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, Users user)
            throws ServletException, IOException {
        request.setAttribute("user", user);
        request.getRequestDispatcher("admin/adminSetting.jsp").forward(request, response);
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

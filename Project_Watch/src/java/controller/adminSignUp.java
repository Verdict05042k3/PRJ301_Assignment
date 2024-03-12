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
import model.Users;

/**
 *
 * @author admin
 */
public class adminSignUp extends HttpServlet {

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
            out.println("<title>Servlet adminSignUp</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminSignUp at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("admin/adminSignUp.jsp").forward(request, response);
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
        UserDao d = new UserDao();

        String username = request.getParameter("user").trim();
        String password = request.getParameter("pass").trim();
        String repass = request.getParameter("repass").trim();
        String email = request.getParameter("email").trim();
        String full_name = request.getParameter("fullname").trim();
        String address = request.getParameter("address").trim();
        String phone_number = request.getParameter("phone").trim();

        if (d.checkAccountExist(username) != null) {
            request.setAttribute("usernameError", "Username already exists");
            handleError(request, response, username, email, full_name, address, phone_number);
            return;
        }

        if (!password.equals(repass)) {
            request.setAttribute("passwordError", "Passwords do not match");
            handleError(request, response, username, email, full_name, address, phone_number);
            return;
        }

        if (d.checkEmailExist(email) != null) {
            request.setAttribute("emailError", "Email already exists");
            handleError(request, response, username, email, full_name, address, phone_number);
            return;
        }
        
     
        d.addAdmin(username, password, email, full_name, address, phone_number, "admin");
        response.sendRedirect("login");
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response,
            String username, String email, String full_name, String address, String phone_number)
            throws ServletException, IOException {
        request.setAttribute("username", username);
        request.setAttribute("email", email);
        request.setAttribute("fullname", full_name);
        request.setAttribute("address", address);
        request.setAttribute("phone", phone_number);
        request.getRequestDispatcher("signup.jsp").forward(request, response);
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

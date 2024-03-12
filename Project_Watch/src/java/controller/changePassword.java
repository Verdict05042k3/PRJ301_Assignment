/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import dao.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Brands;
import model.Products;
import model.Users;
import utils.HandleCookie;

/**
 *
 * @author admin
 */
public class changePassword extends HttpServlet {

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
            out.println("<title>Servlet changePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePassword at " + request.getContextPath() + "</h1>");
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

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

        ProductDao dao = new ProductDao();
        List<Brands> listBrand = dao.getListBrands();
        UserDao udao = new UserDao();

        String oldpass = request.getParameter("oldpass").trim();
        String newpass = request.getParameter("newpass").trim();
        String repassnew = request.getParameter("repass").trim();
        String checkpass = udao.getPassword(user.getUser_id());

        int countProduct = 0;
        Cookie[] cookies = request.getCookies();
        if (user != null && cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart" + user.getUser_id())) {
                    if (cookie.getValue() != null && !cookie.getValue().isEmpty()) {
                        List<Products> cookieProducts = HandleCookie.CookieToProduct(cookie.getValue());
                        if (cookieProducts != null) {
                            countProduct = cookieProducts.size();
                        }
                    }
                }
            }

        } else {
            countProduct = 0;
        }

        if (checkpass.equals(oldpass)) {

            if (newpass.equals(repassnew)) {

                udao.updatePassword(newpass, user.getUser_id());
                request.setAttribute("success", "Change password success");
                handleError(request, response, listBrand, countProduct, user);
                return;
            } else {
                request.setAttribute("errorRe", "Password is Password is not the same");
                handleError(request, response, listBrand, countProduct, user);
                return;
            }

        } else {
            request.setAttribute("errorOld", "Password is incorrect");
            handleError(request, response, listBrand, countProduct, user);
            return;
        }

    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, List<Brands> listBrand, int countProduct, Users user)
            throws ServletException, IOException {
        request.setAttribute("brand", listBrand);
        request.setAttribute("user", user);
        request.setAttribute("countProduct", countProduct);
        request.getRequestDispatcher("setting.jsp").forward(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

/**
 *
 * @author admin
 */
public class buy extends HttpServlet {

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
            out.println("<title>Servlet buy</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet buy at " + request.getContextPath() + "</h1>");
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

        String productID = request.getParameter("id_product");
        String quantityStr = request.getParameter("quantity");

        if (quantityStr == null || quantityStr.isEmpty()) {
            quantityStr = "1";
        }

        ProductDao dao = new ProductDao();
        
        int addQuantity = Integer.parseInt(quantityStr);
        int product_id = Integer.parseInt(productID);
        
        
        int checkQuantity = dao.quantityProduct(product_id);

        if (addQuantity > checkQuantity) {
            response.sendRedirect("details?id_product=" + productID);
            return;
        }

        Cookie[] cookies = request.getCookies();
        String cart = "";

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

        if (session == null || session.getAttribute("acc") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart" + user.getUser_id())) {
                cart = cookie.getValue();
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                break;
            }
        }

        if (!cart.isEmpty()) {
            String[] products = cart.split("/");
            boolean isExist = false;
            StringBuilder updatedCart = new StringBuilder();
            for (String prod : products) {
                String[] product = prod.split(":");
                if (product[0].equals(productID)) {
                    int quantity = Integer.parseInt(product[1]) + addQuantity;
                    updatedCart.append(productID).append(":").append(quantity).append("/");
                    isExist = true;
                } else {
                    updatedCart.append(prod).append("/");
                }
            }
            if (!isExist) {
                updatedCart.append(productID).append(":").append(addQuantity).append("/");
            }
            cart = updatedCart.toString();
        } else {
            cart = productID + ":" + addQuantity + "/";
        }

        Cookie cookie = new Cookie("cart" + user.getUser_id(), cart);
        cookie.setMaxAge(10 * 60 * 60 * 24);
        response.addCookie(cookie);

        response.sendRedirect("displayCart");
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

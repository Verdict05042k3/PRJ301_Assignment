/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.OrderDao;
import dao.OrderDetailsDao;
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
import model.Orders;
import model.Products;
import model.Users;
import utils.HandleCookie;

/**
 *
 * @author admin
 */
public class myorder extends HttpServlet {

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
            out.println("<title>Servlet myprofile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet myprofile at " + request.getContextPath() + "</h1>");
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

        ProductDao dao = new ProductDao();
        OrderDao odao = new OrderDao();
        //session
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

        //list data in database
        List<Brands> listBrand = dao.getListBrands();
        List<Orders> listOrder = odao.listOrderByUserId(user.getUser_id());

        //cookie
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

        request.setAttribute("countProduct", countProduct);
        request.setAttribute("user", user);
        request.setAttribute("order", listOrder);
        request.setAttribute("brand", listBrand);
        request.getRequestDispatcher("myorder.jsp").forward(request, response);
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

        //change orderHistory
        String orderIdStr = request.getParameter("orderId");
        String statusStr = request.getParameter("status");

        int orderId = Integer.parseInt(orderIdStr);
        int status = Integer.parseInt(statusStr);

        OrderDao odao = new OrderDao();
        OrderDetailsDao od = new OrderDetailsDao();

        odao.updateStatus(orderId, status);

        int checkStatus = odao.getStatusById(orderId);

        if (checkStatus == 3) {
            od.deleteOrderDetails(orderId);
            odao.deleteOrder(orderId);
        }

        response.sendRedirect("myorder");
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

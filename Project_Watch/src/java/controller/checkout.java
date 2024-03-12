/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import dao.OrderDao;
import dao.OrderDetailsDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Brands;
import model.OrderDetails;
import model.Orders;
import model.Products;
import model.Users;
import utils.HandleCookie;

/**
 *
 * @author admin
 */
public class checkout extends HttpServlet {

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
            out.println("<title>Servlet checkout</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkout at " + request.getContextPath() + "</h1>");
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
        List<Brands> listBrand = dao.getListBrands();
        List<Products> listProduct = new ArrayList<>();
        List<Products> listCookie = new ArrayList<>();
        Products products;

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

        //cookie
        Cookie[] cookies = request.getCookies();
        String cart = "";
        int countProduct = 0;

        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart" + user.getUser_id())) {
                cart = cookie.getValue();
                break;
            }
        }

        if (!cart.equals("")) {

            String[] listCart = cart.split("/");
            for (String list : listCart) {
                String[] item = list.split(":");
                products = dao.getProductsByID(Integer.parseInt(item[0]));
                listProduct.add(products);
            }

            listCookie = HandleCookie.CookieToProduct(cart);
            countProduct = HandleCookie.CookieToProduct(cart).size();
        }

        request.setAttribute("user", user);
        request.setAttribute("brand", listBrand);
        request.setAttribute("data", listProduct);
        request.setAttribute("dataQuantity", listCookie);
        request.setAttribute("countProduct", countProduct);

        if (cart.isEmpty() || cart == null) {
            request.setAttribute("error", "Chưa có sản phẩm nào trong giỏ hàng, không thể checkout");
            request.getRequestDispatcher("displayCart").forward(request, response);
            return;
        }

        request.getRequestDispatcher("checkout.jsp").forward(request, response);
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

        Cookie[] cookies = request.getCookies();
        String cart = "";
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart" + user.getUser_id())) {
                cart = cookie.getValue();
            }
        }

        Orders order = new Orders();
        order.setUser_id(user.getUser_id());
        order.setOrder_date(new Date(System.currentTimeMillis()));
        order.setAddress(request.getParameter("address"));
        order.setTotal_price(Double.parseDouble(request.getParameter("totalPrice")));
        order.setStatus(2);  // 1: Completed, 2: processing, 0: Cancelled 

        // lưu order vào database
        OrderDao orderDao = new OrderDao();
        orderDao.insertOrder(order);
        
        
        int order_id = orderDao.order_id(order);

        //lưu list order detail vào database
        List<OrderDetails> listOrderDetails = HandleCookie.CookieToOrderDetail(cart, order_id);
        OrderDetailsDao orderDetailsDao = new OrderDetailsDao();
        for (OrderDetails orderDetails : listOrderDetails) {
            orderDetailsDao.insertOrderDetail(orderDetails);
        }

        //delete cookie
        Cookie cookie = new Cookie("cart" + user.getUser_id(), cart);
        cookie.setMaxAge(0);
        response.addCookie(cookie);

        response.sendRedirect("success");
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

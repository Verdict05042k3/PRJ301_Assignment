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
import java.util.List;
import model.Brands;
import model.Products;
import model.Users;
import utils.HandleCookie;

/**
 *
 * @author admin
 */
public class search extends HttpServlet {

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
            out.println("<title>Servlet search</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet search at " + request.getContextPath() + "</h1>");
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

        String search = request.getParameter("search").trim();
        ProductDao dao = new ProductDao();
        List<Brands> brand = dao.getListBrands();
        List<Products> listProducts = dao.search(search);

        //getSession
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

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

        // Pagination
        String page = request.getParameter("page") != null ? request.getParameter("page") : "1";
        int page_size = 8;
        int start_product = (Integer.parseInt(page) - 1) * page_size;
        int start_page = Math.max(1, Integer.parseInt(page) - 1);
        int max_page = (int) Math.ceil((double) dao.countProduct() / page_size);
        int end_page = Math.min(max_page, start_page + 4);

        List<Products> list = dao.getListProductsPaginated(listProducts, start_product, page_size);

        request.setAttribute("startPage", start_page);
        request.setAttribute("thisPage", Integer.parseInt(page));
        request.setAttribute("endPage", end_page);
        request.setAttribute("maxPage", max_page);

        if (list.isEmpty()) {
            request.setAttribute("notification", "Không tìm thấy sản phẩm nào");
        } else {
            request.setAttribute("product", list);
        }

        request.setAttribute("brand", brand);
        request.setAttribute("countProduct", countProduct);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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
        String search = request.getParameter("search").trim();
        ProductDao dao = new ProductDao();
        List<Brands> brand = dao.getListBrands();
        List<Products> listProducts = dao.search(search);

        // Pagination
        String page = request.getParameter("page") != null ? request.getParameter("page") : "1";
        int page_size = 8;
        int start_product = (Integer.parseInt(page) - 1) * page_size;
        int start_page = Math.max(1, Integer.parseInt(page) - 1);
        int max_page = (int) Math.ceil((double) dao.countProduct() / page_size);
        int end_page = Math.min(max_page, start_page + 4);

        List<Products> list = dao.getListProductsPaginated(listProducts, start_product, page_size);

        request.setAttribute("startPage", start_page);
        request.setAttribute("thisPage", Integer.parseInt(page));
        request.setAttribute("endPage", end_page);
        request.setAttribute("maxPage", max_page);

        if (list.isEmpty()) {
            request.setAttribute("notification", "Không tìm thấy sản phẩm nào");
        } else {
            request.setAttribute("product", list);
        }

        request.setAttribute("brand", brand);
        request.getRequestDispatcher("search.jsp").forward(request, response);
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

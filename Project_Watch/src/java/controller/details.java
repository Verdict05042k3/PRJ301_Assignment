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
public class details extends HttpServlet {

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
            out.println("<title>Servlet details</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet details at " + request.getContextPath() + "</h1>");
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
        String id_product = request.getParameter("id_product");

        int id = Integer.parseInt(id_product);

        // List of brands and products
        List<Brands> brand = dao.getListBrands();
        Products products = dao.getProductsByID(id);

        int id_brand = dao.getBrandID(id);

        List<Products> product = dao.getListProductsByBrand(id_brand);
        Brands brands = dao.getBrandsByID(id_brand);

        //session
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

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

        // Set attribute in jsp
        request.setAttribute("brand", brand);
        request.setAttribute("brands", brands);
        request.setAttribute("product", product);
        request.setAttribute("products", products);
        request.setAttribute("countProduct", countProduct);

        request.getRequestDispatcher("details.jsp").forward(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

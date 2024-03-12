/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import model.Products;

/**
 *
 * @author admin
 */
@MultipartConfig(
        location = "C:\\Users\\admin\\Documents\\NetBeansProjects\\Project_Watch\\web\\image", // Thư mục để lưu trữ tệp tạm thời
        fileSizeThreshold = 1024 * 1024, // Kích thước tệp lớn nhất để lưu trữ trong bộ nhớ cache (1MB)
        maxFileSize = 1024 * 1024 * 15, // Kích thước tệp lớn nhất được phép tải lên (15MB)
        maxRequestSize = 1024 * 1024 * 30 // Tổng kích thước tệp tối đa được phép gửi đến máy chủ (30MB)
)

public class adminUpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet adminUpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminUpdateProduct at " + request.getContextPath() + "</h1>");
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
        String productid = request.getParameter("id");
        ProductDao dao = new ProductDao();
        Products p = dao.getProductsByID(Integer.parseInt(productid));

        request.setAttribute("product", p);
        request.getRequestDispatcher("admin/adminUpdateProduct.jsp").forward(request, response);
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
        // Xử lý dữ liệu từ form

        String product_id = request.getParameter("id");
        String productName = request.getParameter("productname");
        String brandId = request.getParameter("brandid");
        String price = request.getParameter("price");
        String description = request.getParameter("description");
        String quantity = request.getParameter("quantity");
        String oldPrice = request.getParameter("oldprice");

        // Xử lý tệp tin ảnh được tải lên
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // Tên tệp tin

        // Lưu trữ tệp tin ảnh vào thư mục đã chỉ định
        String uploadDir = "C:\\Users\\admin\\Documents\\NetBeansProjects\\Project_Watch\\web\\image\\"; // Đường dẫn đến thư mục lưu trữ ảnh
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, Paths.get(uploadDir + fileName), StandardCopyOption.REPLACE_EXISTING);
        }

        // parse price ve double
        double productPrice;
        double productOldPrice;
        try {
            productPrice = Double.parseDouble(price);
            productOldPrice = Double.parseDouble(oldPrice);
        } catch (NumberFormatException e) {
            productPrice = Double.parseDouble(price);
            productOldPrice = Double.parseDouble(oldPrice);
        }

        ProductDao dao = new ProductDao();
        dao.updateProduct(Integer.parseInt(product_id), productName, Integer.parseInt(brandId), productPrice, description, Integer.parseInt(quantity), fileName, productOldPrice);

        response.sendRedirect("adminTable");
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

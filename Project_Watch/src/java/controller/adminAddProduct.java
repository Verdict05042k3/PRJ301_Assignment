/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ProductDao;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Products;
import model.Users;

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
public class adminAddProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");
        request.setAttribute("u", user);
        request.getRequestDispatcher("admin/adminAddProducts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Xử lý dữ liệu từ form
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
        
        Products p = new Products(productName, Integer.parseInt(brandId), Double.parseDouble(price), description, Integer.parseInt(quantity), fileName, Double.parseDouble(oldPrice));
        
        ProductDao dao = new ProductDao();
        dao.insertProducts(p);

        response.sendRedirect("adminTable");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

package controller;

import dao.ProductDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Users;

public class addToCart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        if (session == null || session.getAttribute("acc") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        ProductDao dao = new ProductDao();

        Users user = (Users) session.getAttribute("acc");

        String productID = request.getParameter("product_id");
        String quantityStr = request.getParameter("quantity");

        int product_id = Integer.parseInt(productID);
        int addQuantity = Integer.parseInt(quantityStr);

        int checkQuantity = dao.quantityProduct(product_id);

        if (addQuantity > checkQuantity) {
            response.sendRedirect("details?id_product=" + productID);
            return;
        }

        Cookie[] cookies = request.getCookies();
        String cart = "";

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

        response.sendRedirect("details?id_product=" + productID);
    }
}

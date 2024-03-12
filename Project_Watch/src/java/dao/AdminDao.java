/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.OrderDetails;
import model.Orders;
import model.Products;
import model.Users;

/**
 *
 * @author admin
 */
public class AdminDao extends MyDao {

    public List<OrderDetails> listOrderDetails() {

        List<OrderDetails> list = new ArrayList<>();

        xSql = "SELECT od.order_id, od.product_id, p.name, od.quantity, p.price "
                + "FROM OrderDetails AS od "
                + "INNER JOIN Products AS p ON od.product_id = p.product_id";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                int productid = rs.getInt("product_id");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");

                OrderDetails o = new OrderDetails();

                Products p = new Products(productid, name, price);

                o.setOrder_id(orderId);
                o.setProduct_id(productid);
                o.setQuantity(quantity);
                o.setProduct(p);

                list.add(o);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<OrderDetails> listOrderDetailsById(int order_id) {

        List<OrderDetails> list = new ArrayList<>();
        xSql = "SELECT od.order_id, od.product_id, p.name, od.quantity, p.price "
                + "FROM OrderDetails AS od "
                + "INNER JOIN Products AS p ON od.product_id = p.product_id "
                + "WHERE order_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, order_id);
            rs = pst.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                int productid = rs.getInt("product_id");
                String name = rs.getString("name");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");

                OrderDetails o = new OrderDetails();

                Products p = new Products(productid, name, price);

                o.setOrder_id(orderId);
                o.setProduct_id(productid);
                o.setQuantity(quantity);
                o.setProduct(p);

                list.add(o);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Orders> listOrders() {
        List<Orders> list = new ArrayList<>();

        xSql = "SELECT o.order_id, u.user_id, u.full_name, o.order_date, o.address, COUNT(od.quantity) AS quantity, o.total_price, o.status, od.product_id "
                + "FROM Orders AS o "
                + "INNER JOIN OrderDetails AS od ON o.order_id = od.order_id "
                + "INNER JOIN Users AS u ON u.user_id = o.user_id "
                + "GROUP BY  o.order_id, u.user_id, u.full_name, o.order_date, o.address, o.total_price, o.status, od.product_id";
        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();

            while (rs.next()) {
                int orderId = rs.getInt("order_id");
                int userId = rs.getInt("user_id");
                int productId = rs.getInt("product_id");
                String fullName = rs.getString("full_name");
                Date orderDate = rs.getDate("order_date");
                String address = rs.getString("address");
                int quantity = rs.getInt("quantity");
                double totalPrice = rs.getDouble("total_price");
                int status = rs.getInt("status");

                // Tạo người dùng
                Users user = new Users(userId, fullName);

                // Tạo đơn hàng
                Orders order = new Orders(orderId, userId, orderDate, address, totalPrice, status);

                // Tạo chi tiết đơn hàng
                List<OrderDetails> orderDetailsList = new ArrayList<>();
                OrderDetails orderDetail = new OrderDetails(orderId, productId, quantity);
                orderDetailsList.add(orderDetail);
                order.setOrderDetails(orderDetailsList);
                order.setUser(user);

                // Thêm đơn hàng vào danh sách
                list.add(order);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Orders;

/**
 *
 * @author admin
 */
public class OrderDao extends MyDao {

    public void insertOrder(Orders order) {

        xSql = "INSERT INTO [dbo].[Orders] VALUES(?,?,?,?,?)";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, order.getUser_id());
            pst.setDate(2, new java.sql.Date(order.getOrder_date().getTime()));
            pst.setString(3, order.getAddress());
            pst.setDouble(4, order.getTotal_price());
            pst.setInt(5, order.getStatus());
            rs = pst.executeQuery();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int order_id(Orders order) {

        xSql = "SELECT MAX(order_id) AS order_id FROM [dbo].[Orders]";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("order_id");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return -1;
    }

    public List<Orders> listOrder() {
        List<Orders> list = new ArrayList<>();

        xSql = "SELECT * FROM [dbo].[Orders] ";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();

            while (rs.next()) {
                Orders o = new Orders(rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getDate("order_date"),
                        rs.getString("address"),
                        rs.getDouble("total_price"),
                        rs.getInt("Status"));
                list.add(o);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public List<Orders> listOrderByUserId(int userId) {
        List<Orders> list = new ArrayList<>();

        xSql = "SELECT * FROM [dbo].[Orders] WHERE user_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            while (rs.next()) {
                Orders o = new Orders(rs.getInt("order_id"),
                        rs.getInt("user_id"),
                        rs.getDate("order_date"),
                        rs.getString("address"),
                        rs.getDouble("total_price"),
                        rs.getInt("Status"));
                list.add(o);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return list;
    }

    public void updateStatus(int orderId, int Status) {
        xSql = "UPDATE [dbo].[Orders] SET Status = ? WHERE order_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, Status);
            pst.setInt(2, orderId);
            rs = pst.executeQuery();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int getStatusById(int orderId) {
        int status = -1;

        xSql = "SELECT Status FROM [dbo].[Orders] WHERE order_id =? ";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, orderId);

            rs = pst.executeQuery();
            if (rs.next()) {
                status = rs.getInt("Status");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return status;
    }

    public void deleteOrder(int order_id) {

        xSql = "DELETE [dbo].[Orders] WHERE order_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, order_id);

            rs = pst.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

}

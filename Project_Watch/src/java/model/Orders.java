/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import utils.Validate;

/**
 *
 * @author admin
 */
public class Orders {

    private int order_id;
    private int user_id;
    private Date order_date;
    private String address;
    private double total_price;
    private int status;
    private List<OrderDetails> orderDetails;
    private Users user;
    
    public Orders() {
    }

    public Orders(int order_id, int user_id, Date order_date, String address, double total_price, int status) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.address = address;
        this.total_price = total_price;
        this.status = status;
    }

    public Orders(int order_id, int user_id, Date order_date, String address, double total_price, int status, List<OrderDetails> orderDetails) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.address = address;
        this.total_price = total_price;
        this.status = status;
        this.orderDetails = orderDetails;
    }

    public Orders(int order_id, int user_id, Date order_date, String address, double total_price, int status, List<OrderDetails> orderDetails, Users user) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.order_date = order_date;
        this.address = address;
        this.total_price = total_price;
        this.status = status;
        this.orderDetails = orderDetails;
        this.user = user;
    }

    
    
    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<OrderDetails> getOrderDetails() {
        if (orderDetails == null) {
            orderDetails = new ArrayList<>();
        }
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetails> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public double getTotalPriceOrder() {
        double total = 0;
        for (OrderDetails orderDetail : getOrderDetails()) {
            total += orderDetail.getTotalPrice();
        }
        return total;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getMonth() {
        String[] date = order_date.toString().split("-");
        return Validate.convertToMonth(date[1]) + " " + date[2] + ", " + date[0];
    }

}

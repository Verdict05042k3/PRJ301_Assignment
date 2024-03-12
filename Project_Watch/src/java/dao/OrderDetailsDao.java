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
import model.OrderDetails;

/**
 *
 * @author admin
 */
public class OrderDetailsDao extends MyDao {

    
    public void deleteOrderDetails(int order_id ){
        
        xSql = " DELETE [dbo].[OrderDetails] WHERE order_id = ?";
        
        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, order_id);
            
            rs = pst.executeQuery();
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
  
    }
    
    public void insertOrderDetail(OrderDetails orderDetails) {
        xSql = "INSERT INTO [dbo].[OrderDetails] VALUES(?,?,?)";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, orderDetails.getOrder_id());
            pst.setInt(2, orderDetails.getProduct_id());
            pst.setInt(3, orderDetails.getQuantity());
            rs = pst.executeQuery();
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    
    
    public List<OrderDetails> listProdcuts(int order_id){
        List<OrderDetails> list = new ArrayList<>();
        
        xSql = "SELECT product_id, quantity FROM [dbo].[OrderDetails] WHERE order_id = ?";
        
        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, order_id);
            
            rs = pst.executeQuery();
            
            while (rs.next()) {                
                OrderDetails o = new OrderDetails();
                o.setProduct_id(rs.getInt("product_id"));
                o.setQuantity(rs.getInt("quantity"));
                list.add(o);
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
       
        return  list;
    }

}

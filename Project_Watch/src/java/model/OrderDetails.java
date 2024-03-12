/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class OrderDetails {
    
   private int order_id;
   private int product_id;
   private int quantity;
   private Products product;

    public OrderDetails() {
    }

    public OrderDetails(int order_id, int product_id, int quantity) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.quantity = quantity;
    }

    public OrderDetails(int order_id, int product_id, int quantity, Products product) {
        this.order_id = order_id;
        this.product_id = product_id;
        this.quantity = quantity;
        this.product = product;
    }
    
    

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public model.Products getProduct(){
        return product;
    }

   public void setProduct(model.Products product){
       this.product = product;
   }
   
   public double getTotalPrice(){
       return product.getPrice() * quantity;
   }
   
}

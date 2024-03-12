/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Products {

    private int product_id;
    private String name;
    private int brand_id;
    private double price;
    private String description;
    private int quantity;
    private String image_url;
    private double old_price;

    public Products() {
    }

    public Products(int product_id, String name, double price) {
        this.product_id = product_id;
        this.name = name;
        this.price = price;
    }
    
    

    public Products(int product_id, String name, int brand_id, double price, String description, int quantity, String image_url, double old_price) {
        this.product_id = product_id;
        this.name = name;
        this.brand_id = brand_id;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.image_url = image_url;
        this.old_price = old_price;
    }

    public Products(String name, int brand_id, double price, String description, int quantity, String image_url, double old_price) {
        this.name = name;
        this.brand_id = brand_id;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
        this.image_url = image_url;
        this.old_price = old_price;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBrand_id() {
        return brand_id;
    }

    public void setBrand_id(int brand_id) {
        this.brand_id = brand_id;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public double getOld_price() {
        return old_price;
    }

    public void setOld_price(double old_price) {
        this.old_price = old_price;
    }

   
}

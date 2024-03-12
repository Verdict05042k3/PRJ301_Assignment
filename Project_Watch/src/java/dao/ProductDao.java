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


import model.Brands;
import model.Products;

/**
 *
 * @author admin
 */
public class ProductDao extends MyDao {
    
    
    public int quantityProduct(int product_id){
        
        int quantity = -1;
        
        xSql = "SELECT quantity FROM [dbo].[Products] where product_id = ?";
        
        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, product_id);
            
            rs = pst.executeQuery();
            if (rs.next()) {
                quantity = rs.getInt("quantity");
            }
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
        return quantity;
    }
    
    
    public void updateInStock(int productId, int quantity){
        
        xSql = "Update Products Set quantity = quantity - ? WHERE product_id = ?";
       
        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, quantity);
            pst.setInt(2, productId);
            
            rs = pst.executeQuery();
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
    
    

    public void updateProduct(int productId, String newName, int newBrandId, double newPrice, String newDescription, int newQuantity, String newImageUrl, double newOldPrice) {
        xSql = "UPDATE Products "
                + "SET name = ?, "
                + "    brand_id = ?, "
                + "    price = ?, "
                + "    description = ?, "
                + "    quantity = ?, "
                + "    image_url = ?, "
                + "    old_price = ? "
                + "WHERE product_id = ?";
        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, newName);
            pst.setInt(2, newBrandId);
            pst.setDouble(3, newPrice);
            pst.setString(4, newDescription);
            pst.setInt(5, newQuantity);
            pst.setString(6, newImageUrl);
            pst.setDouble(7, newOldPrice);
            pst.setInt(8, productId);

            rs = pst.executeQuery();         
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void deleteProduct(int productId) {
        xSql = "DELETE FROM [dbo].[Products] WHERE product_id =?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, productId);

            rs = pst.executeQuery();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public void insertProducts(Products p) {

        xSql = "INSERT INTO [dbo].[Products] ([name], [brand_id], [price], [description], [quantity], [image_url], [old_price]) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try {
            pst = con.prepareStatement(xSql);

            pst.setString(1, p.getName());
            pst.setInt(2, p.getBrand_id());
            pst.setDouble(3, p.getPrice());
            pst.setString(4, p.getDescription());
            pst.setInt(5, p.getQuantity());
            pst.setString(6, p.getImage_url());
            pst.setDouble(7, p.getOld_price());
            rs = pst.executeQuery();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Products> getListProductsPaginated(List<Products> listProducts, int startProduct, int pageSize) {

        List<Products> paginatedList = new ArrayList<>();

        int startIndex = startProduct;
        int endIndex = Math.min(startIndex + pageSize, listProducts.size());

        for (int i = startIndex; i < endIndex; i++) {
            paginatedList.add(listProducts.get(i));
        }

        return paginatedList;
    }

    public int countProduct() {
        int count = 0;
        String xSql = "SELECT COUNT(*) AS total FROM [dbo].[Products]";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return count;
    }

    public List<Brands> getListBrands() {

        List<Brands> listBrands = new ArrayList<>();

        xSql = "SELECT * FROM [dbo].[Brands]";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();

            while (rs.next()) {
                Brands b = new Brands(rs.getInt("brand_id"), rs.getString("name"));
                listBrands.add(b);
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return listBrands;
    }

    public Brands getBrandsByID(int id) {

        xSql = "SELECT * FROM [dbo].[Brands] WHERE brand_id=?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                Brands b = new Brands(rs.getInt("brand_id"), rs.getString("name"));
                return b;
            }
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return null;
    }

    public Products getProductsByID(int id) {
        xSql = "SELECT * FROM [dbo].[Products] WHERE product_id =?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                return p;
            }
            rs.close();
            pst.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return null;
    }

    public List<Products> getListProducts() {

        List<Products> listProduct = new ArrayList<>();

        xSql = "SELECT * FROM [dbo].[Products]";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();

            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                listProduct.add(p);
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return listProduct;
    }

    public List<Products> getListProductsId(int id) {

        List<Products> listProduct = new ArrayList<>();

        xSql = "SELECT * FROM [dbo].[Products] WHERE product_id=?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                listProduct.add(p);
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return listProduct;
    }

    public int getBrandID(int id) {
        int brandID = -1;
        xSql = "SELECT brand_id FROM Products WHERE product_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                brandID = rs.getInt("brand_id");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return brandID;
    }

    public List<Products> getListProductsByBrand(int id) {
        List<Products> listProduct = new ArrayList<>();

        xSql = "SELECT * FROM [dbo].[Products] WHERE brand_id=?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price")
                );
                listProduct.add(p);
            }
        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return listProduct;
    }

    public List<Products> getListProductsSortByBrandId(String sortOrder, int brandId) {

        List<Products> listProduct = new ArrayList<>();

        String condition = "";
        if (brandId != 0) {
            condition = " WHERE brand_id = ? ";
        }

        xSql = "SELECT * FROM [dbo].[Products] " + condition + " ORDER BY price " + sortOrder;

        try {
            pst = con.prepareStatement(xSql);
            if (brandId != 0) {
                pst.setInt(1, brandId);
            }
            rs = pst.executeQuery();
            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                listProduct.add(p);
            }

            rs.close();
            pst.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return listProduct;
    }

    public List<Products> getListProductsByPriceRange(String priceRange, int brandId) {

        List<Products> listProduct = new ArrayList<>();
        double priceMin;
        double priceMax;

        switch (priceRange) {
            case "1":
                priceMin = 0;
                priceMax = 1000000;
                break;
            case "2":
                priceMin = 1000000;
                priceMax = 5000000;
                break;
            case "3":
                priceMin = 5000000;
                priceMax = 10000000;
                break;
            case "4":
                priceMin = 10000000;
                priceMax = 20000000;
                break;
            default:
                priceMin = 20000000;
                priceMax = 99999999;
                break;
        }

        String condition = "";
        if (brandId != 0) {
            condition = " brand_id = ? AND ";
        }

        xSql = "SELECT * FROM [dbo].[Products] WHERE " + condition + " price BETWEEN ? AND ? ORDER BY price ASC";

        try {
            pst = con.prepareStatement(xSql);
            if (brandId != 0) {
                pst.setInt(1, brandId);
            }
            pst.setDouble(2, priceMin);
            pst.setDouble(3, priceMax);
            rs = pst.executeQuery();
            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                listProduct.add(p);
            }

            rs.close();
            pst.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return listProduct;
    }

    public List<Products> getListProductsByPriceRange(String priceRange) {

        List<Products> listProduct = new ArrayList<>();
        double priceMin;
        double priceMax;

        switch (priceRange) {
            case "1":
                priceMin = 0;
                priceMax = 1000000;
                break;
            case "2":
                priceMin = 1000000;
                priceMax = 5000000;
                break;
            case "3":
                priceMin = 5000000;
                priceMax = 10000000;
                break;
            case "4":
                priceMin = 10000000;
                priceMax = 20000000;
                break;
            default:
                priceMin = 20000000;
                priceMax = 99999999;
                break;
        }

        xSql = "SELECT * FROM [dbo].[Products] WHERE  price BETWEEN ? AND ? ORDER BY price ASC";

        try {
            pst = con.prepareStatement(xSql);

            pst.setDouble(1, priceMin);
            pst.setDouble(2, priceMax);
            rs = pst.executeQuery();
            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                listProduct.add(p);
            }

            rs.close();
            pst.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return listProduct;
    }

    public List<Products> search(String productName) {

        List<Products> listProduct = new ArrayList<>();

        xSql = "SELECT * FROM  [dbo].[Products] WHERE name LIKE ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, "%" + productName + "%");

            rs = pst.executeQuery();
            while (rs.next()) {
                Products p = new Products(
                        rs.getInt("product_id"),
                        rs.getString("name"),
                        rs.getInt("brand_id"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getInt("quantity"),
                        rs.getString("image_url"),
                        rs.getDouble("old_price"));
                listProduct.add(p);
            }

            rs.close();
            pst.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return listProduct;
    }

}

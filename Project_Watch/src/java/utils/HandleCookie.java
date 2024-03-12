     /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import dao.ProductDao;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetails;
import model.Products;

/**
 *
 * @author admin
 */
public class HandleCookie {

    public static List<Products> CookieToProduct(String cookie) {
        try {
            if (cookie != null && !cookie.isEmpty()) {
                String[] listProductString = cookie.split("/");
                List<Products> listProduct = new ArrayList<>();
                ProductDao dao = new ProductDao();
                for (String productString : listProductString) {
                    String[] item = productString.split(":");
                    String productID = item[0];
                    int quantity = Integer.parseInt(item[1]);
                    Products product = dao.getProductsByID(Integer.parseInt(productID));
                    product.setQuantity(quantity);
                    listProduct.add(product);
                }
                return listProduct;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    
    public static List<OrderDetails> CookieToOrderDetail(String cookie, int orderID) {
        String[] listProductString = cookie.split("/");
        List<OrderDetails> OrderDetails = new ArrayList<>();
        for (String productString : listProductString) {
            String[] item = productString.split(":");
            try {
                int productID = Integer.parseInt(item[0]);
                int quantity = Integer.parseInt(item[1]);
                OrderDetails orderDetail = new OrderDetails();
                orderDetail.setOrder_id(orderID);
                orderDetail.setProduct_id(productID);
                orderDetail.setQuantity(quantity);
                OrderDetails.add(orderDetail);

            } catch (Exception e) {
                return null;
            }
        }
        return OrderDetails;
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class DBConext {
    protected static Connection connection;
    protected static String DB_NAME = "SmartWatch_Project";
    protected static String DB_USER_NAME = "sa";
    protected static String DB_PASSWORD = "12345";

    public DBConext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://DESKTOP-2HFR217\\SQLEXPRESS:1433;databaseName=" + DB_NAME;
            connection = DriverManager.getConnection(url, DB_USER_NAME, DB_PASSWORD);
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }
}

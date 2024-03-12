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
import model.Users;

/**
 *
 * @author admin
 */
public class UserDao extends MyDao {

    public String getPassword(int userid) {

        String pass = "";

        xSql = "SELECT password FROM Users WHERE user_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, userid);

            rs = pst.executeQuery();

            if (rs.next()) {
                pass = rs.getString("password");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return pass;
    }

    public void updatePassword(String password, int userid) {

        try {
            xSql = "UPDATE Users SET password = ? WHERE user_id = ?";
            pst = con.prepareStatement(xSql);
            
            pst.setString(1, password);
            pst.setInt(2, userid);
            rs = pst.executeQuery();
            
        } catch (SQLException ex) {
            System.out.println(ex);
        }

    }

    public List<Users> getUser() {
        List<Users> listUser = new ArrayList<>();

        xSql = "SELECT * FROM Users";

        try {
            pst = con.prepareStatement(xSql);
            rs = pst.executeQuery();

            while (rs.next()) {
                Users users = new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("role"));
                listUser.add(users);
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return listUser;
    }

    public List<Users> getCustomer(int userid) {

        List<Users> list = new ArrayList<>();

        xSql = "SELECT [user_id] , [full_name]  FROM Users WHERE user_id =?";
        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, userid);
            rs = pst.executeQuery();

            while (rs.next()) {
                Users users = new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("role"));
                list.add(users);
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return list;
    }

    public Users getUser(int userId) {

        xSql = "SELECT * FROM Users WHERE user_id =?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setInt(1, userId);
            rs = pst.executeQuery();

            if (rs.next()) {
                Users users = new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("role"));
                return users;
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }

        return null;
    }

    public Users login(String user, String pass) {
        xSql = "SELECT * FROM Users WHERE (username=? OR email=?) AND password=?";
        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, user);
            pst.setString(2, user);
            pst.setString(3, pass);
            rs = pst.executeQuery();

            while (rs.next()) {
                Users users = new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("role"));
                return users;
            }

            rs.close();
            pst.close();

        } catch (SQLException exception) {
            System.out.println(exception);
        }
        return null;
    }

    public Users checkAccountExist(String username) {
        xSql = "SELECT * FROM Users where username =?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, username);
            rs = pst.executeQuery();
            while (rs.next()) {
                Users users = new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("role"));
                return users;
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Users checkEmailExist(String email) {
        xSql = "SELECT * FROM Users where email =?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, email);
            rs = pst.executeQuery();
            while (rs.next()) {
                Users users = new Users(
                        rs.getInt("user_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("phone_number"),
                        rs.getString("role"));
                return users;
            }
            rs.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void addUsers(Users users) {
        xSql = "INSERT INTO Users (username, [password], email, full_name, address, phone_number) VALUES (?,?,?,?,?,?)";
        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, users.getUsername());
            pst.setString(2, users.getPassword());
            pst.setString(3, users.getEmail());
            pst.setString(4, users.getFull_name());
            pst.setString(5, users.getAddress());
            pst.setString(6, users.getPhone_number());

            pst.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addAdmin(String username, String password, String email, String fullName, String address, String phoneNumber, String role) {
        xSql = "INSERT INTO Users (username, password, email, full_name, address, phone_number, role) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, username);
            pst.setString(2, password);
            pst.setString(3, email);
            pst.setString(4, fullName);
            pst.setString(5, address);
            pst.setString(6, phoneNumber);
            pst.setString(7, role);

            pst.executeQuery();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateUser(Users u) {

        xSql = "UPDATE Users SET email = ?, full_name = ?, address = ?, phone_number = ? WHERE user_id = ?";

        try {
            pst = con.prepareStatement(xSql);
            pst.setString(1, u.getEmail());
            pst.setString(2, u.getFull_name());
            pst.setString(3, u.getAddress());
            pst.setString(4, u.getPhone_number());
            pst.setInt(5, u.getUser_id());

            rs = pst.executeQuery();

        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}

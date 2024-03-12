/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author admin
 */
public class Users {

    private int user_id;
    private String username;
    private String password;
    private String email;
    private String full_name;
    private String address;
    private String phone_number;
    private String role;

    public Users() {
    }

    public Users(int user_id, String full_name) {
        this.user_id = user_id;
        this.full_name = full_name;
    }

    public Users(int user_id, String email, String full_name, String address, String phone_number) {
        this.user_id = user_id;
        this.email = email;
        this.full_name = full_name;
        this.address = address;
        this.phone_number = phone_number;
    }
    
    

    public Users(String username, String password, String email, String full_name, String address, String phone_number) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.full_name = full_name;
        this.address = address;
        this.phone_number = phone_number;
    }

    public Users(String username, String password, String email, String full_name, String address, String phone_number, String role) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.full_name = full_name;
        this.address = address;
        this.phone_number = phone_number;
        this.role = role;
    }
    
   
    public Users(int user_id, String username, String password, String email, String full_name, String address, String phone_number, String role) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.full_name = full_name;
        this.address = address;
        this.phone_number = phone_number;
        this.role = role;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}

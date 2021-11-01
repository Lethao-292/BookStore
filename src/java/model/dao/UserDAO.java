/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import db.MyConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.dto.User;

/**
 *
 * @author thaon
 */
public class UserDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    private static UserDAO instance;

    private UserDAO() {

    }

    public static UserDAO getInstance() {
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public User checkLogin(String username, String password) throws Exception {
        User user = null;
        try {
            String sql = "SELECT u.Fullname, r.Name FROM dbo.Users u, dbo.Role r WHERE u.Username = ? AND u.Password = ? AND u.RoleId = r.Id";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String fullname = rs.getString("Fullname");
                String role = rs.getString("Name");
                user = new User(username, fullname, password, role);
            }
        } finally {
            closeConnection();
        }
        return user;
    }

    public void register(String username, String fullname, String password, int roleId) throws Exception {
        try {
            String sql = "INSERT INTO dbo.Users VALUES(?, ?, ?, ?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, fullname);
            preStm.setString(3, password);
            preStm.setInt(4, roleId);
            preStm.executeUpdate();
        } finally {
            closeConnection();
        }
        return;
    }

    public boolean checkExist(String username) throws Exception {
        boolean check = false;
        try {
            String sql = "SELECT Fullname FROM dbo.Users WHERE Username = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public static void main(String[]args){
        try{
            UserDAO dao = getInstance();
            User user = dao.checkLogin("user", "12345678");
            System.out.println(user.getRole());
        } catch (Exception e){
            e.printStackTrace();
        }
    }
    
}

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
import java.util.ArrayList;
import java.util.List;
import model.dto.Author;

/**
 *
 * @author thaon
 */
public class AuthorDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    private static AuthorDAO instance;

    private AuthorDAO() {

    }

    public static AuthorDAO getInstance() {
        if (instance == null) {
            instance = new AuthorDAO();
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

    public List<Author> findAll() throws Exception {
        List<Author> listAuthor = new ArrayList<>();
        try {
            String sql = "SELECT Id, Name FROM dbo.Authors ORDER BY Id";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                Author au = new Author(id, name);
                listAuthor.add(au);
            }
        } finally {
            closeConnection();
        }
        return listAuthor;
    }

    public Author findById(int id) throws Exception {
        Author au = null;
        try {
            String sql = "SELECT Name FROM dbo.Authors WHERE Id = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String name = rs.getString("Name");
                au = new Author(id, name);
            }
        } finally {
            closeConnection();
        }
        return au;
    }

    public Author addNew(String name) throws Exception {
        Author au = null;
        try {
            String sql = "INSERT INTO dbo.Authors (Name) VALUES(?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, name.trim());
            preStm.executeUpdate();
            au = findByName(name);
        } finally {
            closeConnection();
        }
        return au;
    }

    public Author findByName(String name) throws Exception {
        Author au = null;
        try {
            String sql = "SELECT Id FROM dbo.Authors WHERE Name = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, name.trim());
            rs = preStm.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("Id");
                au = new Author(id, name);
            }
        } finally {
            closeConnection();
        }
        return au;
    }

}

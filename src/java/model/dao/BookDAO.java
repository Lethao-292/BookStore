/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import db.MyConnection;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.dto.Author;
import model.dto.Book;
import model.dto.Category;

/**
 *
 * @author thaon
 */
public class BookDAO implements Serializable {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;

    private static BookDAO instance;

    private BookDAO() {

    }

    public static BookDAO getInstance() {
        if (instance == null) {
            instance = new BookDAO();
        }
        return instance;
    }

    private void closeConnection() throws Exception {
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

    public List<Book> findAllPaging(String status, int page) throws Exception {
        List<Book> listBook = new ArrayList<>();
        AuthorDAO auDAO = AuthorDAO.getInstance();
        CategoryDAO catDAO = CategoryDAO.getInstance();
        try {
            String sql = "SELECT Id, Title, Price, Quantity, AuthorId, CategoryId, Description, ImportDate, Image"
                    + " FROM dbo.Books"
                    + " WHERE Status = ? AND Quantity > 0"
                    + " ORDER BY ImportDate DESC OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            preStm.setInt(2, (page - 1) * 9);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String title = rs.getString("Title");
                int price = rs.getInt("Price");
                int quantity = rs.getInt("Quantity");
                int authorId = rs.getInt("AuthorId");
                int categoryId = rs.getInt("CategoryId");
                String description = rs.getString("Description");
                Date importDate = rs.getDate("ImportDate");
                String image = rs.getString("Image");
                Author au = auDAO.findById(authorId);
                Category cat = catDAO.findById(categoryId);
                Book b = new Book(id, title, String.format("%,d", price), quantity, au, cat, description, importDate, image, status);
                listBook.add(b);
            }
        } finally {
            closeConnection();
        }
        return listBook;
    }

    public List<Book> findByFilterPaging(String searchValue, int category, int priceFrom, int priceTo, String status, int page) throws Exception {
        List<Book> listBook = new ArrayList<>();
        AuthorDAO auDAO = AuthorDAO.getInstance();
        CategoryDAO catDAO = CategoryDAO.getInstance();
        try {
            String sql = "SELECT Id, Title, Price, Quantity, AuthorId, CategoryId, Description, ImportDate, Image"
                    + " FROM dbo.Books"
                    + " WHERE Title LIKE '%" + searchValue + "%' AND Status = ?";
            if (category != 0) {
                sql += " AND CategoryId = " + category;
            }
            if (priceTo == 0 && priceFrom != 0) {
                sql += " AND Price >= " + priceFrom;
            } else if (priceTo != 0) {
                sql += " AND Price BETWEEN " + priceFrom + " AND " + priceTo;
            }
            sql += " ORDER BY ImportDate DESC OFFSET ? ROWS FETCH NEXT 9 ROWS ONLY";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            preStm.setInt(2, (page - 1) * 9);
            rs = preStm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("Id");
                String title = rs.getString("Title");
                int price = rs.getInt("Price");
                int quantity = rs.getInt("Quantity");
                int authorId = rs.getInt("AuthorId");
                int categoryId = rs.getInt("CategoryId");
                String description = rs.getString("Description");
                Date importDate = rs.getDate("ImportDate");
                String image = rs.getString("Image");
                Author au = auDAO.findById(authorId);
                Category cat = catDAO.findById(categoryId);
                Book b = new Book(id, title, String.format("%,d", price), quantity, au, cat, description, importDate, image, "");
                listBook.add(b);
            }
        } finally {
            closeConnection();
        }
        return listBook;
    }

    public int countAll(String status) throws Exception {
        int count = 0;
        try {
            String sql = "SELECT COUNT(Id)"
                    + " FROM dbo.Books"
                    + " WHERE Status = ? AND Quantity > 0";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            rs = preStm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return count;
    }

    public int countByFilter(String searchValue, int category, int priceFrom, int priceTo, String status) throws Exception {
        int count = 0;
        try {
            String sql = "SELECT COUNT(Id)"
                    + " FROM dbo.Books"
                    + " WHERE Title LIKE '%" + searchValue + "%' AND Status = ?";
            if (category != 0) {
                sql += " AND CategoryId = " + category;
            }
            if (priceTo == 0 && priceFrom != 0) {
                sql += " AND Price >= " + priceFrom;
            } else if (priceTo != 0) {
                sql += " AND Price BETWEEN " + priceFrom + " AND " + priceTo;
            }
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            rs = preStm.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } finally {
            closeConnection();
        }
        return count;
    }

    public boolean addNew(String title, int price, int quantity, int authorId, int categoryId, String description, Date importDate, String image) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO dbo.Books (Title, Price, Quantity, AuthorId, CategoryId, Description, ImportDate, Image, Status)"
                    + " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, title);
            preStm.setInt(2, price);
            preStm.setInt(3, quantity);
            preStm.setInt(4, authorId);
            preStm.setInt(5, categoryId);
            preStm.setString(6, description);
            preStm.setDate(7, importDate);
            preStm.setString(8, image);
            preStm.setString(9, "active");
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateStatus(int id, String status) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE dbo.Books SET Status = ? WHERE Id = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, status);
            preStm.setInt(2, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public Book findById(int id) throws Exception {
        Book b = null;
        AuthorDAO auDAO = AuthorDAO.getInstance();
        CategoryDAO catDAO = CategoryDAO.getInstance();
        try {
            String sql = "SELECT Title, Price, Quantity, AuthorId, CategoryId, Description, ImportDate, Image, Status"
                    + " FROM dbo.Books"
                    + " WHERE Id = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                String title = rs.getString("Title");
                int price = rs.getInt("Price");
                int quantity = rs.getInt("Quantity");
                int authorId = rs.getInt("AuthorId");
                int categoryId = rs.getInt("CategoryId");
                String description = rs.getString("Description");
                Date importDate = rs.getDate("ImportDate");
                String image = rs.getString("Image");
                String status = rs.getString("Status");
                Author au = auDAO.findById(authorId);
                Category cat = catDAO.findById(categoryId);
                b = new Book(id, title, String.format("%,d", price), quantity, au, cat, description, importDate, image, status);
            }
        } finally {
            closeConnection();
        }
        return b;
    }
    
    public void inactiveBook(int id) throws Exception {
        try{
            String sql = "UPDATE dbo.Books SET Status = ? WHERE Id = ?";
            conn= MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "inactive");
            preStm.setInt(2, id);
            preStm.executeUpdate();
        } finally {
            closeConnection();
        }
    }

    public boolean updateDetail (int id, String title, int price, int quantity, int authorId, int categoryId, String description, String image) throws Exception{
        boolean check = false;
        try {
            String sql = "UPDATE dbo.Books"
                        + " SET Title = ?, Price = ?, Quantity = ?, AuthorId = ?, CategoryId = ?, Description = ?, Image = ?"
                        + " WHERE Id = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, title);
            preStm.setInt(2, price);
            preStm.setInt(3, quantity);
            preStm.setInt(4, authorId);
            preStm.setInt(5, categoryId);
            preStm.setString(6, description);
            preStm.setString(7, image);
            preStm.setInt(8, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}

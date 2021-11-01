/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import db.MyConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.dto.Order;
import model.dto.OrderDetail;
import model.dto.Book;

/**
 *
 * @author thaon
 */
public class OrderDAO {

    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;
    private static OrderDAO instance;

    private OrderDAO() {

    }
    
    public static OrderDAO getInstance(){
        if(instance == null){
            instance = new OrderDAO();
        }
        return instance;
    }

    public void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public String getLastOrderIDByUser(String username) throws Exception {
        String id = null;
        String sql = "SELECT Id FROM dbo.Orders WHERE CreateDate ="
                + "(SELECT MAX(CreateDate) FROM dbo.Orders WHERE Username = ?)"
                + " ORDER BY Id";
        try {
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                id = rs.getString("id");
            }
        } finally {
            closeConnection();
        }
        return id;
    }

    public boolean createOrder(String orderId, String username, int total, Date createDate, String status) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert into dbo.Orders(Id, Username, Total, CreateDate, Status) "
                    + "values(?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderId);
            preStm.setString(2, username);
            preStm.setFloat(3, total);
            preStm.setDate(4, createDate);
            preStm.setString(5, status);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean createOrderDetail(String orderDetailID, String OrderID, int bookID, int quantity, int price) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO dbo.OrderDetails(Id, OrderId, BookId, Quantity, Price)"
                    + "values(?,?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderDetailID);
            preStm.setString(2, OrderID);
            preStm.setInt(3, bookID);
            preStm.setInt(4, quantity);
            preStm.setFloat(5, price);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<Order>  findAllOrder (String username) throws Exception{
        List<Order> list = new ArrayList<>();
        try{
            String sql = "SELECT Id, Total, CreateDate, Status FROM dbo.Orders WHERE Username = ? ORDER BY CreateDate DESC";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username.trim());
            rs = preStm.executeQuery();
            while(rs.next()){
                String id = rs.getString("Id");
                int total = rs.getInt("Total");
                Date createDate = rs.getDate("CreateDate");
                String stattus = rs.getString("status");
                Order order = new Order(id, username, stattus, total, createDate);
                list.add(order);
            }
        }finally{
            closeConnection();
        }
        return list;
    }
    
    public List<OrderDetail> findOrderDetailByOrder (String orderId) throws Exception{
        List<OrderDetail> list = new ArrayList<>();
        BookDAO dao = BookDAO.getInstance();
        try{
            String sql = "SELECT Id, BookId, Quantity, Price FROM dbo.OrderDetails WHERE OrderId = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderId);
            rs = preStm.executeQuery();
            while(rs.next()){
                String id = rs.getString("Id");
                int bookId = rs.getInt("BookId");
                int quantity = rs.getInt("Quantity");
                int price = rs.getInt("Price");
                Book book  = dao.findById(bookId);
                OrderDetail detail = new OrderDetail(id, book, quantity, price);
                list.add(detail);
            }
        }finally{
            closeConnection();
        }
        return list;
    }
    
    public static void main(String[] args) {
        OrderDAO dao = getInstance();
        try{
            List<Order> list = dao.findAllOrder("user");
            for(Order order : list){
                System.out.println(order.toString());
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}

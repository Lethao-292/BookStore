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
import model.dto.Category;

/**
 *
 * @author thaon
 */
public class CategoryDAO implements Serializable{
    
    private Connection conn;
    private PreparedStatement preStm;
    private ResultSet rs;
    
    private static CategoryDAO instance;
    
    private CategoryDAO(){
        
    }
    
    public static CategoryDAO getInstance(){
        if(instance == null){
            instance = new CategoryDAO();
        }
        return instance;
    }
    
    private void closeConnection(){
        try{
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    
    public List<Category> findAll() throws Exception{
        List<Category> listCategory = new ArrayList<>();
        try{
            String sql = "SELECT Id, Name FROM dbo.Categories";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                Category cat = new Category(id, name);
                listCategory.add(cat);
            }
        }finally{
            closeConnection();
        }
        return listCategory;
    }
    
    public Category findById(int id) throws Exception{
        Category cat = null;
        try{
            String sql = "SELECT Name FROM dbo.Categories WHERE Id = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, id);
            rs = preStm.executeQuery();
            if(rs.next()){
                String name = rs.getString("Name");
                cat = new Category(id, name);
            }
        }finally{
            closeConnection();
        }
        return cat;
    }
}

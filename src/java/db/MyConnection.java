/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author thaon
 */
public class MyConnection {

    private static final String PORT = "1433";
    private static final String DATABASE_NAME = "BookStore";
    private static final String USER_NAME = "sa";
    private static final String PASS_WORD = "123456";

    public static Connection getMyConnection() throws Exception {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        conn = DriverManager.getConnection("jdbc:sqlserver://localhost: " + PORT + ";databaseName= " + DATABASE_NAME, USER_NAME, PASS_WORD);
        return conn;
    }
    
    public static void main(String[] args) {
        try{
            System.out.println(MyConnection.getMyConnection().toString());
        } catch (Exception e){
            e.printStackTrace();
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

/**
 *
 * @author thaon
 */
public class OrderDetail {
    private String id;
    private Book book;
    private int quantity;
    private int price;

    public OrderDetail() {
    }

    public OrderDetail(String id, Book book, int quantity, int price) {
        this.id = id;
        this.book = book;
        this.quantity = quantity;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public Book getBook() {
        return book;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
}

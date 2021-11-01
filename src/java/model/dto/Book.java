/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

import java.sql.Date;

/**
 *
 * @author thaon
 */
public class Book {

    private int id;
    private String title;
    private String price;
    private int quantity;
    private Author author;
    private Category category;
    private String description;
    private Date importDate;
    private String image;
    private String status;

    public Book() {

    }

    public Book(int id, String title, String price, int quantity, Author author, Category category, String description, Date importDate, String image, String status) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.author = author;
        this.category = category;
        this.description = description;
        this.importDate = importDate;
        this.image = image;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public Author getAuthor() {
        return author;
    }

    public Category getCategory() {
        return category;
    }

    public String getDescription() {
        return description;
    }

    public Date getImportDate() {
        return importDate;
    }

    public String getImage() {
        return image;
    }

    public String getStatus() {
        return status;
    }    

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

import java.util.HashMap;

/**
 *
 * @author thaon
 */
public class CartObj {
    
    private HashMap<Integer, Book> cartDetail;
    private String username;

    public CartObj(String username) {
        this.username = username;
        this.cartDetail = new HashMap<>();
    }

    public HashMap<Integer, Book> getCartDetail() {
        return cartDetail;
    }

    public String getUsername() {
        return username;
    }

    public void setCartDetail(HashMap<Integer, Book> cartDetail) {
        this.cartDetail = cartDetail;
    }

    public void setUsername(String username) {
        this.username = username;
    }   

    public void addToCart(Book book, int quantity) throws Exception {
        if (this.cartDetail.containsKey(book.getId())) {
            int newQuantity = this.cartDetail.get(book.getId()).getQuantity() + quantity;
            this.cartDetail.get(book.getId()).setQuantity(newQuantity);
        } else {
            this.cartDetail.put(book.getId(), book);
        }
    }

    public void remove(int bookId) throws Exception {
        if (this.cartDetail.containsKey(bookId)) {
            this.cartDetail.remove(bookId);
        }
    }

    public String getTotal() throws Exception {
        int total = 0;
        for (Book book : this.cartDetail.values()) {
            int bookPrice = Integer.parseInt(book.getPrice().replaceAll(",", ""));
            total += book.getQuantity() * bookPrice;
        }
        return String.format("%,d", total);
    }
    
    public void update (int id, int quantity){
        if(this.cartDetail.containsKey(id)){
            this.cartDetail.get(id).setQuantity(quantity);
        }
    }
    
}

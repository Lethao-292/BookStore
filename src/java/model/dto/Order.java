/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

import java.util.Date;
import java.util.List;

/**
 *
 * @author thaon
 */
public class Order {
    
    private String id, usename, status;
    private int total;
    private Date createDate;

    public Order() {
    }

    public Order(String id, String usename, String status, int total, Date createDate) {
        this.id = id;
        this.usename = usename;
        this.status = status;
        this.total = total;
        this.createDate = createDate;
    }

    public String getId() {
        return id;
    }

    public String getUsename() {
        return usename;
    }

    public String getStatus() {
        return status;
    }

    public int getTotal() {
        return total;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setUsename(String usename) {
        this.usename = usename;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
        
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thaon
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String SEARCH = "SearchController";
    private static final String REGISTER = "RegisterController";
    private static final String DETAIL = "DetailController";
    private static final String MANAGE = "ManagementController";
    private static final String ADD = "AddController";
    private static final String EDIT = "EditController";
    private static final String ADD_TO_CART = "AddToCartController";
    private static final String UPDATE_CART = "UpdateCartController";
    private static final String ORDER = "OrderController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Signup")) {
                url = REGISTER;
            } else if (action.equals("Detail")) {
                url = DETAIL;
            } else if (action.equals("Manage")) {
                url = MANAGE;
            } else if (action.equals("Add")) {
                url = ADD;
            } else if (action.equals("Edit")) {
                url = EDIT;
            } else if (action.equals("AddToCart")) {
                url = ADD_TO_CART;
            } else if (action.equals("Remove") || action.equals("UpdateCart")) {
                url = UPDATE_CART;
            } else if (action.equals("Order")) {
                url = ORDER;
            } else {
                request.setAttribute("error", "Invalid Action: " + action);
                url = ERROR;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

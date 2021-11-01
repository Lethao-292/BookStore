/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.OrderDAO;
import model.dto.Book;
import model.dto.CartObj;

/**
 *
 * @author thaon
 */
public class OrderController extends HttpServlet {

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
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            CartObj cart = (CartObj) session.getAttribute("cart");
            //List<ProductDTO> listproduct = (List<ProductDTO>) cart.getCart().values();
            String orderID = "";
            //
            OrderDAO orderDAO = OrderDAO.getInstance();

            String lastID = orderDAO.getLastOrderIDByUser(cart.getUsername());
            if (lastID != null) {
                String[] tmp = lastID.split("-");
                orderID = "OD-" + cart.getUsername() + "-" + (Integer.parseInt(tmp[2]) + 1);
            } else {
                orderID = "OD-" + cart.getUsername() + "-1";
            }

            Long mili = System.currentTimeMillis();
            boolean checkCreateOrder = orderDAO.createOrder(orderID, cart.getUsername(), Integer.parseInt(cart.getTotal().replaceAll(",", "")), new Date(mili), "waiting");
            if (checkCreateOrder) {
                int count = 0;
                for (Book dto : cart.getCartDetail().values()) {
                    count++;
                    String orderDetailID = orderID + "-" + count;
                    orderDAO.createOrderDetail(orderDetailID, orderID, dto.getId(), dto.getQuantity(), Integer.parseInt(dto.getPrice().replaceAll(",", "")));
                }
                session.removeAttribute("cart");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Successfully Order');");
                out.println("location='HomeController';");
                out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect("HomeController");
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

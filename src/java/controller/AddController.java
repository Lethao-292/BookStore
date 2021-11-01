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
import model.dao.AuthorDAO;
import model.dao.BookDAO;
import model.dao.CategoryDAO;
import model.dto.Author;
import model.dto.Category;

/**
 *
 * @author thaon
 */
public class AddController extends HttpServlet {

    private static final String ERROR = "error.jsp";

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
        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("txtTitle");
            String image = request.getParameter("txtImage");
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            int price = Integer.parseInt(request.getParameter("txtPrice"));
            int categoryOp = Integer.parseInt(request.getParameter("categoryOp"));
            String description = request.getParameter("description");
            String myAction = request.getParameter("myAction");
            
            System.out.println(myAction);

            AuthorDAO auDAO = AuthorDAO.getInstance();
            BookDAO bookDAO = BookDAO.getInstance();

            Author au;
            if(myAction.equals("Add Other")){
                String auName = request.getParameter("authorOp");
                au = auDAO.findByName(auName);
            } else {
                String auName = request.getParameter("txtAuthor");
                if(auName == null){
                    auName = "Unknow";
                }
                au = auDAO.findByName(auName);
                if(au == null){
                    au = auDAO.addNew(auName);
                }
            }

            Long mili = System.currentTimeMillis();
            Date importDate = new Date(mili);

            boolean check = bookDAO.addNew(title, price, quantity, au.getId(), categoryOp, description, importDate, image);
            if (check) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Successfully Edit');");
                out.println("location='ManagementController';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Edit Fail');");
                out.println("location='ManagementController';");
                out.println("</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
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

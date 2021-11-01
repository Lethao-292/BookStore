/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.dao.AuthorDAO;
import model.dao.BookDAO;
import model.dao.CategoryDAO;
import model.dto.Author;
import model.dto.Book;
import model.dto.Category;

/**
 *
 * @author thaon
 */
public class ManagementController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String VALID = "manage-product.jsp";

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
        String url = ERROR;
        try {
            String indexPage = request.getParameter("indexP");
            String status = request.getParameter("statusOp");
            BookDAO bookDAO = BookDAO.getInstance();
            CategoryDAO cateDAO = CategoryDAO.getInstance();
            AuthorDAO auDAO =  AuthorDAO.getInstance();
            
            List<Category> listCategory = null;                        
            List<Book> listBook = null;
            List<Author> listAuthor = null;

            int count = 0;
            int index = 1;
            
            if (indexPage != null && !indexPage.equals("")) {
                index = Integer.parseInt(indexPage);
            }
            
            if(status == null){
                status = "active";
            }
                                    
            listBook = bookDAO.findAllPaging(status, index);
            listCategory = cateDAO.findAll();
            listAuthor = auDAO.findAll();
            count = bookDAO.countAll(status);

            if (count == 0) {
                request.setAttribute("error", "There is no valid book");
            } else {
                int endPage = count / 9;
                if (count % 9 != 0) {
                    endPage++;
                }
                request.setAttribute("endP", endPage);                
                request.setAttribute("listB", listBook);
            }
            request.setAttribute("listAu", listAuthor);
            request.setAttribute("listC", listCategory);
            request.setAttribute("status", status);
            request.setAttribute("index", index);
            url = VALID;
        } catch (Exception e) {
            e.printStackTrace();
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

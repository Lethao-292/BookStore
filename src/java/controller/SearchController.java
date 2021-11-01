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
import model.dao.BookDAO;
import model.dao.CategoryDAO;
import model.dto.Book;
import model.dto.Category;

/**
 *
 * @author thaon
 */
public class SearchController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String VALID = "home.jsp";

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
            String categoryIdP = request.getParameter("categoryRadio");
            String searchValue = request.getParameter("txtSearch");
            String priceRange = request.getParameter("priceRange");
            String indexPage = request.getParameter("indexP");

            CategoryDAO cateDAO = CategoryDAO.getInstance();
            BookDAO bookDAO = BookDAO.getInstance();
            List<Book> listBook = null;
            List<Category> listCategory = null;

            int categoryId = 0;
            int count = 0;
            int index = 1;
            int priceFrom = 0;
            int priceTo = 0;
            String status = "active";

            if (indexPage != null && indexPage != "") {
                index = Integer.parseInt(indexPage);
            }

            if (categoryIdP != null && categoryIdP != "") {
                categoryId = Integer.parseInt(categoryIdP);
            }

            switch (priceRange) {
                case "under100":
                    priceFrom = 0;
                    priceTo = 100000;
                    break;
                case "100200":
                    priceFrom = 100000;
                    priceTo = 200000;
                    break;
                case "200500":
                    priceFrom = 200000;
                    priceTo = 500000;
                    break;
                case "500above":
                    priceFrom = 500000;
                    priceTo = 0;
                    break;
            }

            listBook = bookDAO.findByFilterPaging(searchValue, categoryId, priceFrom, priceTo, status, index);
            listCategory = cateDAO.findAll();
            count = bookDAO.countByFilter(searchValue, categoryId, priceFrom, priceTo, status);
            listCategory = cateDAO.findAll();

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
            request.setAttribute("listC", listCategory);
            request.setAttribute("searchValue", searchValue);
            request.setAttribute("categoryId", categoryId);
            request.setAttribute("price", priceRange);
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

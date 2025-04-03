/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookDAO;
import dal.GenreDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;
import model.Genre;

/**
 *
 * @author 84338
 */
@WebServlet(name = "AllBooksServlet", urlPatterns = {"/allbooks"})
public class AllBooksServlet extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AllBooksServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AllBooksServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String genre = request.getParameter("genre");//kieu gi cung ko null, it nhat la all
        String status = request.getParameter("status");
        BookDAO bookdao = new BookDAO();
        GenreDAO genredao = new GenreDAO();
        List<Book> listbook = bookdao.getBooksByGenreAndStatus(genre, status);
        List<Genre> listgenre = genredao.getAll();

        request.setAttribute("listbook", listbook);
        request.setAttribute("listgenre", listgenre);
        request.setAttribute("genre", genre);

        request.getRequestDispatcher("allbooks.jsp").forward(request, response);
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
        String genre = request.getParameter("genre");
        String namebook = request.getParameter("namebook"); //co the null hoac empty
        String status = request.getParameter("status");
        String choice = request.getParameter("choice"); //ko chon cai khac, mac dinh la 0

        BookDAO bookdao = new BookDAO();
        GenreDAO genredao = new GenreDAO();
        //khac o DAO  
        List<Book> listbook;
        if (!choice.equals("4") && !choice.equals("5")) {
            listbook = bookdao.getBooksByFilterSortAndSearch0123(choice, namebook, genre, status);
        } else if (choice.equals("4")) {
            listbook = bookdao.getBooksByFilterSortAndSearch4(choice, namebook, genre, status);
        } else {
            listbook = bookdao.getBooksByFilterSortAndSearch5(choice, namebook, genre, status);
        }

        List<Genre> listgenre = genredao.getAll();
        
        request.setAttribute("select", choice);
        request.setAttribute("listbook", listbook);
        request.setAttribute("listgenre", listgenre);
        request.setAttribute("genre", genre);

        request.getRequestDispatcher("allbooks.jsp").forward(request, response);
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

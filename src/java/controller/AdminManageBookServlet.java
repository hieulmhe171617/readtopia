/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author 84338
 */
@WebServlet(name = "AdminManageBookServlet", urlPatterns = {"/managebook"})
public class AdminManageBookServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminManageBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminManageBookServlet at " + request.getContextPath() + "</h1>");
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
        BookDAO bookdao = new BookDAO();
        String add = request.getParameter("add");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String authorId = request.getParameter("authorId");
        String publisher = request.getParameter("publisher");
        String releaseDate = request.getParameter("date");
        String image = request.getParameter("image");
        String descript = request.getParameter("descript");
        String status = request.getParameter("status");
        String genre[] = request.getParameterValues("genre");
        if (add != null) {
            //muon them book
            if (genre != null && genre.length > 0) {
                bookdao.addABook(name,
                        Integer.parseInt(authorId),
                        publisher, releaseDate, image, descript, status);
                int idbookadd = bookdao.takeIdABook(name,
                        Integer.parseInt(authorId),
                        publisher, releaseDate, image, descript, status);
                bookdao.addGenresForBookbyID(idbookadd, genre);
                request.setAttribute("option", "5");
                request.setAttribute("noti", "Add book succesful!");
            } else {
                request.setAttribute("option", "5");
                request.setAttribute("noti", "Please choose at least 1 genre");
            }

            request.getRequestDispatcher("adminprocess").forward(request, response);
        } else {
            // muon xoa
            //dau tien phai xoa the loai cua no trong bookgenre truoc, xong moi
            //xoa o bang Book
            bookdao.deleteABookCRUD(Integer.parseInt(id));
            request.setAttribute("option", "5");
            request.setAttribute("noti", "Delete book succesful!");
            request.getRequestDispatcher("adminprocess").forward(request, response);
        }
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
        BookDAO bookdao = new BookDAO();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String authorId = request.getParameter("authorId");
        String publisher = request.getParameter("publisher");
        String releaseDate = request.getParameter("date");
        String image = request.getParameter("image");
        String descript = request.getParameter("descript");
        String status = request.getParameter("status");
        String genre[] = request.getParameterValues("genre");

        if (genre != null && genre.length > 0) {
            bookdao.updateABook(
                    Integer.parseInt(id),
                    name, Integer.parseInt(authorId),
                    publisher, releaseDate, image, descript, status);
            bookdao.deleteBookGenreByBookID(Integer.parseInt(id));
            bookdao.addGenresForBookbyID(Integer.parseInt(id), genre);
            request.setAttribute("option", "5");
            request.setAttribute("noti", "Update book succesful!");
        } else {
            request.setAttribute("option", "5");
            request.setAttribute("noti", "Update book fail!");
        }
        request.getRequestDispatcher("adminprocess").forward(request, response);

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

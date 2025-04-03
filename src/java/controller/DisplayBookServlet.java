/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AuthorDAO;
import dal.BookDAO;
import dal.CommentDAO;
import dal.GenreDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Author;
import model.Book;
import model.Comment;
import model.Genre;
import model.Subcomment;
import model.User;

/**
 *
 * @author 84338
 */
@WebServlet(name = "DisplayBookServlet", urlPatterns = {"/displaybook"})
public class DisplayBookServlet extends HttpServlet {

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
            out.println("<title>Servlet DisplayBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DisplayBookServlet at " + request.getContextPath() + "</h1>");
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

        String id_raw = request.getParameter("id");
        int id;
        try {
            id = Integer.parseInt(id_raw);
            BookDAO bookdao = new BookDAO();
            AuthorDAO authordao = new AuthorDAO();
            GenreDAO genredao = new GenreDAO();
            CommentDAO commentdao = new CommentDAO();

            Book b = bookdao.getBookById(id);
            Author a = authordao.getAuthorById(b.getAuthorId());
            List<Comment> listC = commentdao.getCommentsByBookID(id);
            List<Genre> listgenre = genredao.getGenreByBookId(id);
            List<Book> listBook = bookdao.getRandomOrderOfBook(id);
            Double averate = bookdao.getAverageRatingBook(id); //id o day la bookid
            Integer numberrate = bookdao.getNumberOfRating(id);
            
            
            HttpSession session = request.getSession();
            if (session.getAttribute("useridsubcommented") != null) {
                List<Subcomment> listSub = commentdao.getSubcomments((Integer) session.getAttribute("useridsubcommented"),
                        id);
                session.removeAttribute("useridsubcommented");
                session.setAttribute("listSub", listSub);
            }
            if (session.getAttribute("user") != null) {
                User x = (User)session.getAttribute("user");
                int rating =(Integer) bookdao.findRatingByUserIDAndBookID(x.getId(), id);
                if (rating != 0) {
                    request.setAttribute("rating", rating);
                }
            }
            
            
            request.setAttribute("numberrate", numberrate);
            request.setAttribute("averate", averate);
            request.setAttribute("book", b);
            request.setAttribute("author", a);
            request.setAttribute("genreofbook", listgenre);
            request.setAttribute("listBook", listBook);
            request.setAttribute("listComment", listC);

            request.getRequestDispatcher("displaybook.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            System.out.println(e);
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
        int userID = Integer.parseInt(request.getParameter("userID"));
        int bookID = Integer.parseInt(request.getParameter("bookID"));

        CommentDAO commentDAO = new CommentDAO();
        List<Subcomment> list = commentDAO.getSubcomments(userID, bookID);
        HttpSession session = request.getSession();
        session.setAttribute("listSub", list);
        
        //tao bien flag xu ly doan load more comment trong display book
        session.setAttribute("idFlag", bookID);
        response.sendRedirect("displaybook?id=" + bookID);

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

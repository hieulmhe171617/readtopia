/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.AuthorDAO;
import dal.BookDAO;
import dal.GenreDAO;
import dal.NewFeedDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Admin;
import model.Author;
import model.Book;
import model.Book2;
import model.Genre;
import model.News;
import model.NumberOfGenre;
import model.NumberOfPost;
import model.NumberOfStatus;
import model.TopRatingBook;
import model.User;

/**
 *
 * @author 84338
 */
@WebServlet(name = "AdminProcessServlet", urlPatterns = {"/adminprocess"})
public class AdminProcessServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminProcessServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminProcessServlet at " + request.getContextPath() + "</h1>");
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
        NewFeedDAO newfeeddao = new NewFeedDAO();
        BookDAO bookdao = new BookDAO();
        AuthorDAO authordao = new AuthorDAO();
        GenreDAO genredao = new GenreDAO();
        AccountDAO accdao = new AccountDAO();
        String option = request.getParameter("option");
        String noti = (String) request.getAttribute("noti");
        if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("0"))
                || (option != null && option.equals("0"))) {

            List<NumberOfGenre> listNum = genredao.top5GenreHaveMostBook();
            for(NumberOfGenre x : listNum ){
                System.out.println(x.getGenre() + "==" +x.getNumbook());
            }
            request.setAttribute("listNumGenre", listNum);

            String mostfollow = authordao.AuthorhasMostFollow();
            request.setAttribute("mostfollow", mostfollow);

            List<TopRatingBook> topRating = bookdao.getTop5RatingBook();
            request.setAttribute("topRating", topRating);

            List<NumberOfStatus> numStatus = bookdao.getNumberOfStatus();
            request.setAttribute("numStatus", numStatus);

            List<NumberOfPost> numPost = newfeeddao.getNumberofPostbyYear();
            request.setAttribute("numPost", numPost);

            request.setAttribute("option", 0);
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("1"))
                || (option != null && option.equals("1"))) {
            List<Admin> listAdmin = accdao.getAllAdmins();
            request.setAttribute("option", 1);
            request.setAttribute("listAdmin", listAdmin);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("2"))
                || (option != null && option.equals("2"))) {
            List<User> listUser = accdao.getAllUsers();
            request.setAttribute("option", 2);
            request.setAttribute("listUser", listUser);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("3"))
                || (option != null && option.equals("3"))) {
            List<Genre> listGenre = genredao.getAllOrderAlphabet();
            request.setAttribute("option", 3);
            request.setAttribute("listGenre", listGenre);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("4"))
                || (option != null && option.equals("4"))) {
            List<Author> listAuthor = authordao.getAllAuthorByAlphabet();
            request.setAttribute("option", 4);
            request.setAttribute("listAuthor", listAuthor);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("5"))
                || (option != null && option.equals("5"))) {
            List<Book2> listBook = bookdao.getAllBookWithAuthornameByAlphabet();
            List<Author> listAuthorForBook = authordao.getAllAuthorByAlphabet();
            List<Genre> listGenre = genredao.getAll();
            request.setAttribute("option", 5);
            request.setAttribute("listBook", listBook);
            request.setAttribute("listAuthor2", listAuthorForBook);
            request.setAttribute("listGenre2", listGenre);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("6"))
                || (option != null && option.equals("6"))) {
            List<News> listNews = newfeeddao.getNewsPost();
            request.setAttribute("option", 6);
            request.setAttribute("listNews", listNews);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
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
        GenreDAO genredao = new GenreDAO();
        AuthorDAO authordao = new AuthorDAO();
        AccountDAO accdao = new AccountDAO();
        String option = request.getParameter("option");
        String noti = (String) request.getAttribute("noti");
        if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("2"))
                || (option != null && option.equals("2"))) {
            List<User> listUser = accdao.getAllUsers();
            request.setAttribute("option", 2);
            request.setAttribute("listUser", listUser);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("3"))
                || (option != null && option.equals("3"))) {
            List<Genre> listGenre = genredao.getAllOrderAlphabet();
            request.setAttribute("option", 3);
            request.setAttribute("listGenre", listGenre);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("4"))
                || (option != null && option.equals("4"))) {
            List<Author> listAuthor = authordao.getAllAuthorByAlphabet();
            request.setAttribute("option", 4);
            request.setAttribute("listAuthor", listAuthor);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        } else if ((String) request.getAttribute("option") != null
                && (((String) request.getAttribute("option")).equals("5"))
                || (option != null && option.equals("5"))) {
            List<Book2> listBook = bookdao.getAllBookWithAuthornameByAlphabet();
            List<Author> listAuthorForBook = authordao.getAllAuthorByAlphabet();
            List<Genre> listGenre = genredao.getAll();
            request.setAttribute("option", 5);
            request.setAttribute("listBook", listBook);
            request.setAttribute("listAuthor2", listAuthorForBook);
            request.setAttribute("listGenre2", listGenre);
            if (noti != null) {
                request.setAttribute("noti", noti);
            }
            request.getRequestDispatcher("adminhome.jsp").forward(request, response);
        }

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

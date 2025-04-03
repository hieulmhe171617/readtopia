/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.NewFeedDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.CommentPost;
import model.News;
import model.User;

/**
 *
 * @author 84338
 */
@WebServlet(name = "NewsServlet", urlPatterns = {"/news"})
public class NewsServlet extends HttpServlet {

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
            out.println("<title>Servlet NewsServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsServlet at " + request.getContextPath() + "</h1>");
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
        AccountDAO accdao = new AccountDAO();
        NewFeedDAO newfeeddao = new NewFeedDAO();
        List<News> listP = newfeeddao.getNewsPost();
        List<CommentPost> listC = newfeeddao.getCommentsPost();
        List<User> listU = accdao.getAllUser();

        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("listU", listU);

        request.getRequestDispatcher("news.jsp").forward(request, response);
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
        AccountDAO accdao = new AccountDAO();
        List<User> listU = accdao.getAllUser();
        NewFeedDAO newfeeddao = new NewFeedDAO();
        //co 2 truong hop
        //1 la filter theo bo loc ben trai
        //2 la tim kiem theo search ben tren
        //truong hop 1, filter theo bo loc ben trai
        List<News> listP = new ArrayList<>();
        List<CommentPost> listC = newfeeddao.getCommentsPost();
        String category = request.getParameter("category");
        String keyword = request.getParameter("keyword");
        if (category != null) {

            String yearFrom = request.getParameter("yearfrom");
            String yearTo = request.getParameter("yearto");
            if (category.equals("0") || category.equals("1")) {
                listP = newfeeddao.getNewsByFilter01(yearFrom, yearTo, Integer.parseInt(category));
            } else if (category.equals("2") || category.equals("3")) {
                listP = newfeeddao.getNewsByFilter23(yearFrom, yearTo, Integer.parseInt(category));
            } else {
                listP = newfeeddao.getNewsByFilter4(yearFrom, yearTo, Integer.parseInt(category));
            }

        }
        if (keyword != null) {
            listP = newfeeddao.getNewsByKeyWord(keyword);
        }
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("listU", listU);

        request.getRequestDispatcher("news.jsp").forward(request, response);

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

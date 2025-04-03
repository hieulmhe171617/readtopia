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
import java.util.List;
import model.News;
import model.Rating;
import model.User;
import model.ViewRating;

/**
 *
 * @author 84338
 */
@WebServlet(name="ViewinfoServlet", urlPatterns={"/viewinfo"})
public class ViewinfoServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewinfoServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewinfoServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("id");
        AccountDAO accdao = new AccountDAO();
        User u = accdao.getUserInfo(username);
        request.setAttribute("info", u);
        //can thong tin de hien thi
        List<ViewRating> listRate = accdao.getRatingOfUser(username);
        request.setAttribute("listrate", listRate);
        
        List<News> listnew = accdao.getNewsByUsername(username);
        request.setAttribute("listnews", listnew);
        //hien thi cac hoat dong gan day: rating sach nao, post nao, follow tac gia nao
        request.getRequestDispatcher("viewinfo.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //xu li xoa 1 post
        NewFeedDAO newfeedao = new NewFeedDAO();
        AccountDAO accdao = new AccountDAO();
        String newid = request.getParameter("newid");
        String username = request.getParameter("username");
        // goi den delete theo format CRUD nay
        //muon xoa 1 post thi can xoa het cmt cua post do truoc
        newfeedao.deleteANewsCRUD(Integer.parseInt(newid));
        
        User u = accdao.getUserInfo(username);
        request.setAttribute("info", u);
        //can thong tin de hien thi
        List<ViewRating> listRate = accdao.getRatingOfUser(username);
        request.setAttribute("listrate", listRate);
        
        List<News> listnew = accdao.getNewsByUsername(username);
        request.setAttribute("listnews", listnew);
        //hien thi cac hoat dong gan day: rating sach nao, post nao, follow tac gia nao
        request.getRequestDispatcher("viewinfo.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

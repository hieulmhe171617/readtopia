/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;

/**
 *
 * @author 84338
 */
@WebServlet(name="LoginAdminServlet", urlPatterns={"/loginadmin"})
public class LoginAdminServlet extends HttpServlet {
   
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
            out.println("<title>Servlet LoginAdminServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginAdminServlet at " + request.getContextPath () + "</h1>");
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
        request.getRequestDispatcher("loginadmin.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        AccountDAO accdao = new AccountDAO();
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember");
        
        Admin ad = accdao.getAdminByUserPass(username, password);
        //co 2 truong hop, dang nhap thanh cong hoac khong
        if (ad == null){
            //dang nhap fail
            request.setAttribute("error", "You don't permission to reach!");
            request.getRequestDispatcher("loginadmin.jsp").forward(request, response);
        } else {
                session.setAttribute("admin", ad);
                Cookie cadmin = new Cookie("adminusername", username);
                Cookie cadminpass = new Cookie("adminpass", password);
                Cookie cremadmin = new Cookie("cremadmin", remember);
                if (remember != null) {
                    cadmin.setMaxAge(60 * 60 * 24 * 60);
                    cadminpass.setMaxAge(60 * 60 * 24 * 60);
                    cremadmin.setMaxAge(60 * 60 * 24 * 60);

                } else {
                    cadmin.setMaxAge(0);
                    cadminpass.setMaxAge(0);
                    cremadmin.setMaxAge(0);
                }
                response.addCookie(cadmin);
                response.addCookie(cadminpass);
                response.addCookie(cremadmin);
                response.sendRedirect("adminhome");
        }
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

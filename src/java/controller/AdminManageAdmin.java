/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import model.Admin;

/**
 *
 * @author 84338
 */
@WebServlet(name = "AdminManageAdmin", urlPatterns = {"/adminmanage"})
public class AdminManageAdmin extends HttpServlet {

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
            out.println("<title>Servlet AdminManageAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminManageAdmin at " + request.getContextPath() + "</h1>");
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
        String add = request.getParameter("add");
        //thong tin cua admin
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        //---------
        if (add != null) {
            //tuc la muon them admin
            Admin ad = accdao.getAdminByUsername(username);
            if (ad == null) {
                //bang null tuc la chua co tai khoan admin nay, dc phep them
                accdao.addAdmin(username, password, email);
                request.setAttribute("option", "1");
                request.setAttribute("noti", "Add successful!");
                request.getRequestDispatcher("adminprocess").forward(request, response);
            } else {
                // khac null tuc la da co
                request.setAttribute("option", "1");
                request.setAttribute("noti", "Admin name already exist!");
                request.getRequestDispatcher("adminprocess").forward(request, response);
            }
        } else {
            //add bang null, muon update
            accdao.updateAdminInfo(username, password, email);
            request.setAttribute("option", "1");
            request.setAttribute("noti", "Update succesful!");
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
        
        String username = request.getParameter("username");
        AccountDAO accdao = new AccountDAO();
        accdao.deleteUserCRUD(username);
        request.setAttribute("option", "2");
        request.setAttribute("noti", "User has been deleted!");
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

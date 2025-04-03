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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author 84338
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/profile"})
public class ProfileServlet extends HttpServlet {

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
            out.println("<title>Servlet UserDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserDetailServlet at " + request.getContextPath() + "</h1>");
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
        request.setAttribute("option", "detail");
        request.getRequestDispatcher("profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        String detail = request.getParameter("detail");
        String changepass = request.getParameter("changepass");
        String out = request.getParameter("out");
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        String newpass1 = request.getParameter("newpass1");
        String newpass2 = request.getParameter("newpass2");
        String oldpass = request.getParameter("oldpass");

        //xu ly chon option show profile, change pass hoac log out
        if (detail != null) {
            request.setAttribute("option", "detail");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else if (changepass != null) {
            request.setAttribute("option", "changepass");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else if (out != null) {
            session.removeAttribute("newemail");
            session.removeAttribute("user");
            session.removeAttribute("listSub");
            session.removeAttribute("newfullname");
            session.removeAttribute("newgender");
            session.removeAttribute("idFlag");
            response.sendRedirect("home");
        }
        //xu ly update thong tin hoac thay doi mat khau
        User a = (User) session.getAttribute("user");
        if (a != null && email != null) {
            String fullname = request.getParameter("fullname");
            boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
            AccountDAO accountdao = new AccountDAO();
            accountdao.updateProfileUser(username, email, fullname, gender);
            request.setAttribute("option", "detail");
            request.setAttribute("noti", "Update succesfully!");
            session.setAttribute("newemail", email);
            session.setAttribute("newfullname", fullname);
            session.setAttribute("newgender", gender);

            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }

        if (a != null && a.getPassword().equals(oldpass) && newpass1.equals(newpass2)) {
            AccountDAO accountdao = new AccountDAO();
            accountdao.changePasswordUser(a.getUsername(), newpass1);
            request.setAttribute("option", "changepass");
            request.setAttribute("noti", "Update successful!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        } else if (a != null && (!a.getPassword().equals(oldpass) || !newpass1.equals(newpass2))) {
            request.setAttribute("option", "changepass");
            request.setAttribute("error", "Password wrong!");
            request.getRequestDispatcher("profile.jsp").forward(request, response);

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

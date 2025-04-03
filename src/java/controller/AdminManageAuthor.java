/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AuthorDAO;
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
@WebServlet(name = "AdminManageAuthor", urlPatterns = {"/authormanage"})
public class AdminManageAuthor extends HttpServlet {

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
            out.println("<title>Servlet AdminManageAuthor</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminManageAuthor at " + request.getContextPath() + "</h1>");
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
        AuthorDAO authordao = new AuthorDAO();
        //vao day co 2 truong hop: 1 la add, 2 la xoa
        String add = request.getParameter("add");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String descript = request.getParameter("descript");
        String award = request.getParameter("award");
        String image = request.getParameter("image");
        String country = request.getParameter("country");
        if (add != null) {
            authordao.addAnAuthor(name,
                    Integer.parseInt(birth), descript, award, image, country);
            request.setAttribute("option", "4");
            request.setAttribute("noti", "Add author successful!");
            request.getRequestDispatcher("adminprocess").forward(request, response);
        } else if (add == null) {
            //muon xoa
            authordao.deleteAnAuthorCRUD(Integer.parseInt(id));
            request.setAttribute("option", "4");
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
        AuthorDAO authordao = new AuthorDAO();        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String descript = request.getParameter("descript");
        String award = request.getParameter("award");
        String image = request.getParameter("image");
        String country = request.getParameter("country");
        //update
        if (request.getParameter("update") != null) {
            authordao.updateAnAuthor(id, name,
                    Integer.parseInt(birth), descript, award, image, country);
            request.setAttribute("option", "4");
            request.setAttribute("noti", "Update author successful!");
            request.getRequestDispatcher("adminprocess").forward(request, response);
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

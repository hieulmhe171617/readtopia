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
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Book;
import model.Cart;
import model.Item;

/**
 *
 * @author 84338
 */
@WebServlet(name = "MyBookServlet", urlPatterns = {"/mybook"})
public class MyBookServlet extends HttpServlet {

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
            out.println("<title>Servlet MyBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MyBookServlet at " + request.getContextPath() + "</h1>");
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
        List<Book> list = bookdao.getAllBook();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, list);
        int size = cart.countBooks();
        int count1 = cart.countReadBooks();
        int count2 = cart.countReadingBooks();
        int count3 = cart.countWantReadBooks();
        HttpSession session = request.getSession();

        session.setAttribute("size", size);
        session.setAttribute("count1", count1);
        session.setAttribute("count2", count2);
        session.setAttribute("count3", count3);

        request.setAttribute("cart", cart);
        request.getRequestDispatcher("mybooks.jsp").forward(request, response);
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
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        int status = Integer.parseInt(request.getParameter("readprocess"));
        BookDAO bookdao = new BookDAO();
        List<Book> list = bookdao.getAllBook();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        String s[] = txt.split("/");
        int len = s.length;
        if (status != 4) { //change process, 4 la xoa
            for (int i = 0; i < len; i++) {
                String n[] = s[i].split(":");
                if (Integer.parseInt(n[0]) == bookID) {
                    s[i] = n[0] + ":" + status;
                }
            }
        } else { //status = 4, xoa 
            for (int i = 0; i < len; i++) {
                String n[] = s[i].split(":");
                if (Integer.parseInt(n[0]) == bookID) {
                    for (int j = i; j < len - 1; j++) {
                        s[j] = s[j + 1];
                    }
                    len--;
                }
            }
        }
        txt = "";
        if (len >= 1) {
            txt += s[0];
        }
        for (int i = 1; i < len; i++) {
            txt += "/" + s[i];
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24 * 60 * 60 * 365);
        response.addCookie(c);
        response.sendRedirect("mybook");
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

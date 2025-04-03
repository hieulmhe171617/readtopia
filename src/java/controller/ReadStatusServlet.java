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
import java.util.ArrayList;
import java.util.List;
import model.Book;
import model.Cart;

/**
 *
 * @author 84338
 */
@WebServlet(name = "ReadStatusServlet", urlPatterns = {"/readstatus"})
public class ReadStatusServlet extends HttpServlet {

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
            out.println("<title>Servlet ReadStatusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReadStatusServlet at " + request.getContextPath() + "</h1>");
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
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        int status = Integer.parseInt(request.getParameter("status"));

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

        if (txt.isEmpty()) {
            txt = bookID + ":" + status;
        } else {
            String s[] = txt.split("/");
            int flag = -1;
            for (int i = 0; i < s.length; i++) {
                String n[] = s[i].split(":");
                if (Integer.parseInt(n[0]) == bookID) {
                    flag = i;
                    break;
                }

            }
            if (flag == -1) {
                txt += "/" + bookID + ":" + status;
            } else {
                s[flag] = bookID + ":" + status;
                txt = "";
                for (int i = 0; i < s.length; i++) {
                    if (i == 0) {
                        txt += s[i];
                    } else {
                        txt += "/" + s[i];
                    }
                }
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(2 * 24 * 60 * 60 * 30);
        response.addCookie(c);
        response.sendRedirect("displaybook?id=" + bookID);
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
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();

                }
            }
        }

        List<Integer> bookID = new ArrayList<>();
        if (!txt.isEmpty()) {
            String s[] = txt.split("/");
            for (int i = 0; i < s.length; i++) {
                String n[] = s[i].split(":");
                bookID.add(Integer.parseInt(n[0]));
            }

        }
        String filer = request.getParameter("filter");
        String bookname = request.getParameter("bookname");
        BookDAO bookdao = new BookDAO();
        if (filer == null) {
            int bookID1 = Integer.parseInt(request.getParameter("bookID"));
            int status = Integer.parseInt(request.getParameter("readprocess"));
            BookDAO bookdao1 = new BookDAO();
            List<Book> list = bookdao.getAllBook();
            Cookie[] arr1 = request.getCookies();
            String txt1 = "";
            if (arr != null) {
                for (Cookie o : arr1) {
                    if (o.getName().equals("cart")) {
                        txt1 += o.getValue();
                        o.setMaxAge(0);
                        response.addCookie(o);
                    }
                }
            }

            String s[] = txt1.split("/");
            int len = s.length;
            if (status != 4) { //change process, 4 la xoa
                for (int i = 0; i < len; i++) {
                    String n[] = s[i].split(":");
                    if (Integer.parseInt(n[0]) == bookID1) {
                        s[i] = n[0] + ":" + status;
                    }
                }
            } else { //status = 4, xoa 
                for (int i = 0; i < len; i++) {
                    String n[] = s[i].split(":");
                    if (Integer.parseInt(n[0]) == bookID1) {
                        for (int j = i; j < len - 1; j++) {
                            s[j] = s[j + 1];
                        }
                        len--;
                    }
                }
            }
            txt1 = "";
            if (len >= 1) {
                txt1 += s[0];
            }
            for (int i = 1; i < len; i++) {
                txt1 += "/" + s[i];
            }

            Cookie c = new Cookie("cart", txt1);
            c.setMaxAge(24 * 60 * 60 * 365);
            response.addCookie(c);
            response.sendRedirect("mybook");
        }

        if (filer != null && (filer.equals("0") || filer.equals("1")
                || filer.equals("2") || filer.equals("3"))) {
            List<Book> list = bookdao.getBooksByFilterAndKeyword(filer, bookname, bookID);
            Cart cart = new Cart();
            cart.cartHasSort(txt, list);
            request.setAttribute("cart", cart);

            request.getRequestDispatcher("mybooks.jsp").forward(request, response);
        } else if (filer != null && (filer.equals("4") || filer.equals("5"))) {
            List<Book> list = bookdao.getBooksByFilterAndKeywordAdvanced(filer, bookname, bookID);
            Cart cart = new Cart();
            cart.cartHasSort(txt, list);
            request.setAttribute("cart", cart);
            request.getRequestDispatcher("mybooks.jsp").forward(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.PlayerDAO;
import Model.player;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DPV
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {

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
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
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
        player player = (player) request.getSession().getAttribute("player");
        if (player != null) {
            response.sendRedirect("home");
            return;
        }
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String accept = request.getParameter("accept");
        String time = request.getParameter("time");
        PlayerDAO dao = new PlayerDAO();
        player checkUser = dao.CheckUsername(user);
        if (accept == null) {
            request.setAttribute("notify", "Vui lòng đọc kỹ và chấp nhận Điều khoản sử dụng.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (user.length() < 4 || user.length() > 16 || pass.length() < 4 || pass.length() > 16) {
            request.setAttribute("notify", "Thông tin đăng ký phải từ 4 đến 16 kí tự.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        if (checkUser != null) {
            request.setAttribute("notify", "Tên tài khoản đã có người khác đăng ký.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        dao.createAccount(user, pass, time);
        player player = dao.getplayer(user, pass);
        request.getSession().setAttribute("player", player);
        response.sendRedirect("home");
        
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

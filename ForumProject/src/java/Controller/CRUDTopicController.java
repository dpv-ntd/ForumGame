/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.PostsDAO;
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
@WebServlet(name = "CRUDTopicController", urlPatterns = {"/topics"})
public class CRUDTopicController extends HttpServlet {

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
            out.println("<title>Servlet CRUDTopicController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CRUDTopicController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        PostsDAO dao = new PostsDAO();
        if (action != null) {
            if (action.equals("delete")) {
                String id = request.getParameter("id");
                dao.deleteComment(id);
                dao.deletePosts(id);
                response.sendRedirect("home");
                return;
            }
            if (action.equals("del")) {
                String id = request.getParameter("id");
                dao.deletePosts(id);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("hot")) {
                String id = request.getParameter("id");
                dao.updateHot(id);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("new")) {
                String id = request.getParameter("id");
                dao.updateNew(id);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("normal")) {
                String id = request.getParameter("id");
                dao.updateNormal(id);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("lock")) {
                String id = request.getParameter("id");
                dao.updateLock(id);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("unlock")) {
                String id = request.getParameter("id");
                dao.updateUnlock(id);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
            if (action.equals("like")) {
                String id = request.getParameter("id");
                player player = (player) request.getSession().getAttribute("player");
                String userID = String.valueOf(player.getId());
                
                dao.updateLike(id);
                dao.updateUserIDLike(id, userID);
                String urlPrev = (String) request.getSession().getAttribute("urlPrev");
                response.sendRedirect(urlPrev);
                return;
            }
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
        processRequest(request, response);
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

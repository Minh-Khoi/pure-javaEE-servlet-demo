/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.UserDAO;
import model.dto.User;

/**
 *
 * @author USER
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController","/turnbackToSearchBoard"})
public class LoginController extends HttpServlet {

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
        if (request.getServletPath().equals("/LoginController")){
            login(request,response);
        } else if (request.getServletPath().equals("/turnbackToSearchBoard")){
            turnbackToSearchBoard(request, response);
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
        processRequest(request, response);
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

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); 
        String psw = request.getParameter("psw");
        UserDAO userdao = new UserDAO();
        User user = userdao.readByID(id);
        if (user.getPassword().equals(psw)){
            HttpSession session = request.getSession();
            session.setAttribute("usingUser", user);
//            System.out.println("Login successfully");
            List<User> list = userdao.readAll();
//            System.out.println(list.get(0));
            request.setAttribute("usingUser", user);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/searchboard-user.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
    
    private void turnbackToSearchBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id")); 
        String psw = request.getParameter("psw");
        UserDAO userdao = new UserDAO();
        User user = userdao.readByID(id);
        if (user.getPassword().equals(psw)){
//            System.out.println("Login successfully");
            List<User> list = userdao.readAll();
//            System.out.println(list.get(0));
            request.setAttribute("usingUser", user);
            request.setAttribute("list", list);
            request.getRequestDispatcher("/searchboard-user.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}

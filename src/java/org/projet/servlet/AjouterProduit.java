/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.projet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.projet.db.ProduitDB;
import org.projet.entites.*;

/**
 *
 * @author f
 */
public class AjouterProduit extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            HttpSession ses = request.getSession(true);
            String ref=request.getParameter("ref");
            String nom=request.getParameter("nom_prod");
            String quant=request.getParameter("quant");
            String prix=request.getParameter("prix");
            String type=request.getParameter("nom_mar");
            String type_prod=request.getParameter("type_prod");
            Produit produit=new Produit();
            Stock stock=new Stock();
            produit.setRef(Integer.parseInt(ref));
            produit.setNom(nom);
            produit.setType_prod(type_prod);
            stock.setRef(Integer.parseInt(ref));
            stock.setQuant(Integer.parseInt(quant));
            stock.setPrix(Float.parseFloat(prix));
            stock.setType((String) ses.getAttribute("type_enligne"));
            produit.setType_prod(type_prod);
            ProduitDB.ajouter(produit,stock);
            ProduitDB.ajouter_stock(stock);
            response.sendRedirect("PageResp.jsp");
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

}

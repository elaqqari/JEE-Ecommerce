/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.projet.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.projet.beans.CartItemBean;

/**
 *
 * @author f
 */
@WebServlet(name = "Validation", urlPatterns = {"/Validation"})
public class Validation extends HttpServlet {

    

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
        PrintWriter out =response.getWriter();
        HttpSession ses = request.getSession(true);
        String cart = request.getParameter("items");
        ArrayList<CartItemBean> carte = (ArrayList <CartItemBean>) ses.getAttribute("listCart");
        double tot= (double) ses.getAttribute("TotalCart");
        int id=(int) ses.getAttribute("id_user");
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
            String sql="insert into commande(id_liv, id_util, date_com, total) values(1,"+id+",NOW(),"+tot+");";
            Statement st =conn.createStatement();
            //PreparedStatement ps1=conn.prepareStatement("insert into commande(id_liv, id_util, date_com, total) values(?,?,?,?)");
            int j =st.executeUpdate(sql,Statement.RETURN_GENERATED_KEYS);
            if (j > 0) {
                ResultSet rs = st.getGeneratedKeys();
                if (rs.next()){
                    int risultato=rs.getInt(1);
                    
                    
                    for(int i=0;i<carte.size();i++){
                PreparedStatement ps=conn.prepareStatement("insert into ligne_com(ref_prod, nom_mar,id_com, quant) values(?,?,?,?)");
                ps.setInt(1, carte.get(i).getRef());
                ps.setString(2, carte.get(i).getPartNumber());
                ps.setInt(3,risultato);
                ps.setInt(4, carte.get(i).getQuantity());
                ps.execute();
            }
            
        }
                response.sendRedirect("paiement.jsp");
            }
            
            
        }catch (Exception e){
            System.out.print(e);
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
        doGet(request, response);
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

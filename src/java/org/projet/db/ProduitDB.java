/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.projet.db;

import java.sql.*;
import org.projet.entites.Produit;
import org.projet.entites.Stock;

/**
 *
 * @author f
 */
public class ProduitDB {
    public static Connection getConnection(){
        Connection conn= null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/projet","root", "");
           
        }
        catch(Exception e){
            System.out.println(e);
        }
        return conn;
    }
    
    public static int ajouter(Produit produit,Stock stock){
        int status =0;
        try{
            Connection conn=ProduitDB.getConnection();
            
            PreparedStatement ps1=conn.prepareStatement("update stock set quant= quant + "+stock.getQuant()+" where ref_prod= " +stock.getRef()+" and nom_mar='"+stock.getType()+"';");
            PreparedStatement ps=conn.prepareStatement("insert into produit(ref_prod, nom_prod,type_prod) values(?,?,?)");
            PreparedStatement ps2=conn.prepareStatement("insert into stock(nom_mar,ref_prod,quant,prix) values(?,?,?,?)");
            ps.setInt(1,produit.getRef());
            ps.setString(2,produit.getNom());           
            ps.setString(3, produit.getType_prod());
            ps2.setString(1, stock.getType());
            ps2.setInt(2, stock.getRef());
            ps2.setInt(3, stock.getQuant());
            ps2.setFloat(4, stock.getPrix());
            Statement st = conn.createStatement();
            ResultSet rs;
            rs = st.executeQuery("select * from produit,stock where produit.ref_prod= " + produit.getRef()+" and produit.ref_prod=stock.ref_prod and stock.nom_mar= '"+stock.getType()+"';");
            
            if(rs.next()){
                status=ps1.executeUpdate();
            }
            else{
                status = ps.executeUpdate();
                
            }
            
            
            conn.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
        return status;
        
    }
    
    
    public static int ajouter_stock(Stock stock){
        int status=0;
        
        try{
            Connection conn=ProduitDB.getConnection();
           
            PreparedStatement ps2=conn.prepareStatement("insert into stock(nom_mar,ref_prod,quant,prix) values(?,?,?,?)");
            ps2.setString(1, stock.getType());
            ps2.setInt(2, stock.getRef());
            ps2.setInt(3, stock.getQuant());
            ps2.setFloat(4, stock.getPrix());
            Statement st = conn.createStatement();
            ResultSet rs2;
            rs2= st.executeQuery("select* from stock where ref_prod="+stock.getRef()+" and nom_mar='"+stock.getType()+"' ;");
            if(rs2.next()){
                
            }
            else{
                status=ps2.executeUpdate();
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        
        return status;
    }
    
    public static int supprimer(Stock stock){
        int status=0;
        try{
            Connection conn=ProduitDB.getConnection();
            PreparedStatement sup=conn.prepareStatement("delete from stock where ref_prod ="+stock.getRef()+" and nom_mar='"+stock.getType()+"';");
            Statement st=conn.createStatement();
            ResultSet rs;
            
            rs=st.executeQuery("select * from stock where ref_prod ="+stock.getRef()+" and nom_mar='"+stock.getType()+"' ;");
            if(rs.next()){
                status=sup.executeUpdate();
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        
        return status;
    }
    
    public static int update(Stock stock){
        int status=0;
        try{
            Connection conn=ProduitDB.getConnection();
            PreparedStatement sup=conn.prepareStatement("update stock set prix = "+stock.getPrix()+" where ref_prod = "+stock.getRef()+" and nom_mar='"+stock.getType()+"';");
            Statement st=conn.createStatement();
            ResultSet rs;
            
            rs=st.executeQuery("select * from stock where ref_prod ="+stock.getRef()+" and nom_mar='"+stock.getType()+"';");
            if(rs.next()){
                status=sup.executeUpdate();
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        
        return status;
    }
    
    public static int search(Produit produit,Stock stock){
        int status=0;
        try{
            Connection conn = ProduitDB.getConnection();
            PreparedStatement sup=conn.prepareStatement("select nom_prod,prix,nom_mar from produit,stock where stock.ref_prod=produit.ref_prod and nom_prod='"+produit.getNom()+"';");
            Statement st=conn.createStatement();
            ResultSet rs;
            
            rs=st.executeQuery("select * from stock where ref_prod ="+produit.getRef()+" and nom_mar='"+stock.getType()+"';");
            if(rs.next()){
                status=sup.executeUpdate();
            }
            
        }
        catch(Exception e){
            System.out.println(e);
        }
        
        
        return status;
        
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.projet.beans;

/**
 *
 * @author f
 */
public class CartItemBean {
    private int ref;
    private String strPartNumber;
    private String strModelDescription;
    private double dblUnitCost;
    private int iQuantity;
    private double dblTotalCost;

    public int getRef() {
        return ref;
    }

    public void setRef(int ref) {
        this.ref = ref;
    }
     
    
    
    public String getPartNumber() {
        return strPartNumber;
    }
    public void setPartNumber(String strPartNumber) {
        this.strPartNumber = strPartNumber;
    }
    public String getModelDescription() {
        return strModelDescription;
    }
    public void setModelDescription(String strModelDescription) {
        this.strModelDescription = strModelDescription;
    }
    public double getUnitCost() {
        return dblUnitCost;
    }
    public void setUnitCost(double dblUnitCost) {
        this.dblUnitCost = dblUnitCost;
    }
    public int getQuantity() {
        return iQuantity;
    }
    public void setQuantity(int quantity) {
        iQuantity = quantity;
    }
    public double getTotalCost() {
        return dblTotalCost;
    }
    public void setTotalCost(double dblTotalCost) {
        this.dblTotalCost = dblTotalCost;
    }

    @Override
    public String toString() {
        return "CartItemBean{" + "ref=" + ref + ", strPartNumber=" + strPartNumber + ", strModelDescription=" + strModelDescription + ", dblUnitCost=" + dblUnitCost + ", iQuantity=" + iQuantity + ", dblTotalCost=" + dblTotalCost + '}';
    }
    
    
}

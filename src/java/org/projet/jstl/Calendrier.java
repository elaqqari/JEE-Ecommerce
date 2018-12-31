/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.projet.jstl;

/**
 *
 * @author f
 */
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author f
 */
public class Calendrier {
    private Calendar calendrier;

    public Calendrier() {
        calendrier= Calendar.getInstance();
    }
    public Date getTemps(){
        return calendrier.getTime();
    }
    public int getHeure(){
        return calendrier.get(Calendar.HOUR_OF_DAY);
    }

    public Calendar getCalendrier() {
        return calendrier;
    }

    public void setCalendrier(Calendar calendrier) {
        this.calendrier = calendrier;
    }
    
}

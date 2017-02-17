/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import graficos.VentanaGestionPrincipal;
import graficos.VentanaLogin;

/**
 
 * @author tdrs
 */
public class main {
    public static void main(String[] args) {
        Conexion.getConnection();
        Mecanico.updateFields();
        if(Mecanico.getPrivate()){
            VentanaLogin v = new VentanaLogin();
            v.setVisible(true);
        }else{
            VentanaGestionPrincipal v = new VentanaGestionPrincipal();
            v.setName(Mecanico.getName());
            v.setVisible(true);
        }
        
        
    }
}

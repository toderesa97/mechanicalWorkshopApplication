/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JOptionPane;


/**
 *
 * @author tdrs
 */
public class Mecanico {
    private static String password;
    private static String name;
    private static String username;
    private static boolean iamprivate = false;

    public static String getPassword() {
        return password;
    }

    public static String getName() {
        return name;
    }

    public static String getUsername() {
        return username;
    }

    public static void setPassword(String password) {
       
        Mecanico.password = password;
    }

    public static void setName(String name) {
        Mecanico.name = name;
    }

    public static void setUsername(String username) {
        Mecanico.username = username;
        
    }
    
    public static void setPrivate(boolean b){
        Mecanico.iamprivate = b;
    }
    
    public static boolean getPrivate(){
        return iamprivate;
    }
    
    public static void stablish(String nombre, String usuario, String contrasenia, int i){
        
        try{
            Connection cnx = Conexion.getConnection();
            String sql = String.format("update mecanico set nombre='%s',usuario='%s'"
                    + ",contrasenia='%s',iamprivate=%d;", nombre,usuario,contrasenia,i);
            cnx.prepareStatement(sql).executeUpdate();
        }catch(Exception e){
            JOptionPane.showMessageDialog(null,"Parece que hubo un error al actualizar");
        }
        updateFields();
        
    }
    
    public static void updateFields(){
        String []datos = new String [4];
        
        try {
            String sql = "select * from mecanico";
            Connection cnx = Conexion.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                Mecanico.name = rs.getString(1);
                
                Mecanico.username=rs.getString(2);
                Mecanico.password=rs.getString(3);
                Mecanico.iamprivate=(rs.getString(4).equals("1")) ? true:false;
                
            }
            
            
        } catch (Exception e) {
            
        }
    }
    
}

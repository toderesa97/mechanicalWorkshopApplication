/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Toderesa97
 */
public class Conexion {

    private static Connection cnx = null;

    public static Connection getConnection(){
        if (cnx == null) {
            try {
                cnx = DriverManager.getConnection("jdbc:mysql://localhost/TALLER", 
                        "root", "");
            } catch (SQLException ex) {
                JOptionPane.showMessageDialog(null, "Unable to connect with database");
            }
        }
        return cnx;
    }

    public static void closeConnection() throws SQLException {
        if (cnx != null) {
            cnx.close();
        }
    }

}
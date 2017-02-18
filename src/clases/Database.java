/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;


import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author tdrs
 */
public class Database {
    private static List<String> myTables;
    private static String databaseName;
    
    public static boolean update(String sql){
        try{
            
            Connection cnx = Conexion.getConnection();
            cnx.prepareStatement(sql).executeUpdate();
            return true;
        }catch(SQLException e){
            return false;
        }
    }
    
    public static boolean modify(String sql){
        return false;
    }
    
    public static boolean erase(String sql){
        try{
            
            Connection cnx = Conexion.getConnection();
            cnx.prepareStatement(sql).executeUpdate();
            return true;
        }catch(SQLException e){
            return false;
        }
    }
    
    public static ResultSet query(String sql){
        try{
            Connection cnx = Conexion.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            return rs;
        }catch(SQLException e){
            return null;
        }
    }
    
    public static String[] getData(String sql){
        try{
            Connection cnx = Conexion.getConnection();
            Statement st = cnx.createStatement();
            ResultSet rs = st.executeQuery(sql);
            String[] customerData = new String[7];
            while(rs.next()){
                customerData[0]=rs.getString(1);
                customerData[1]=rs.getString(2);
                customerData[2]=rs.getString(3);
                customerData[3]=rs.getString(4);
                customerData[4]=rs.getString(5);
                customerData[5]=rs.getString(6);
                customerData[6]=rs.getString(7);
            
            }
            return customerData;
        }catch(SQLException e){
            return null;
        }
    }
}

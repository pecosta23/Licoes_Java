/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.*;
/**
 *
 * @author pedro
 */
public class ConectaDB {
    public static Connection conectar()throws ClassNotFoundException{
        Connection conexao = null;
        try{
            Class.forName("com.mysql.jdbc.Driver"); //Type DB server port db
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancoxpto", "root", "");
            return conexao;
        }
        catch(SQLException ex){
            System.out.print("Erro: " + ex);
        }
        return conexao;
    }
}

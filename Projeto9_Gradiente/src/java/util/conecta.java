/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author pedro
 */
public class conecta {
    public static Connection conectar()throws ClassNotFoundException{
        //connection recebe var conexao 
        Connection conexao = null;
        //tentando conectar ao banco
        try{
            Class.forName("com.mysql.jdbc.Driver"); //Type DB server port db, meu banco dbinscricaouser
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbgradiente", "root", "");
            return conexao;
        }
        //se der ruim, SQL Exception do tipo classe não encontrada
        catch(SQLException ex){
            System.out.print("Erro: " + ex);
        }
        return conexao;
    }
}

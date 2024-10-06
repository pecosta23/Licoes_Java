/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;
import java.sql.*;
/**
 *
 * @author pedro
 * dia 1 06/10/2024, criação do diagrama de classe já feito
 *                   banco de dados, feito.
 *                   criação da classe de conexao.
 */
public class ConexaoDB {
    //classe bublica de conexao recebe metodo conectar
    public static Connection conectar()throws ClassNotFoundException{
        //connection recebe var conexao 
        Connection conexao = null;
        //tentando conectar ao banco
        try{
            Class.forName("com.mysql.jdbc.Driver"); //Type DB server port db, meu banco dbinscricaouser
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbinscricaouser", "root", "");
            return conexao;
        }
        //se der ruim, SQL Exception do tipo classe não encontrada
        catch(SQLException ex){
            System.out.print("Erro: " + ex);
        }
        return conexao;
    }
}

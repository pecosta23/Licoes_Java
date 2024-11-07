/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import model1.Dados;
import util.ConectDB;

/**
 *
 * @author pedro
 */
public class DadosDAO {
    public boolean Cadastro(Dados p_dados) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "INSERT INTO dados (nome, email, nasc) VALUES ('" + p_dados.getNome() +                                                                                         
                                                                     "','" + p_dados.getEmail() +
                                                                     "','" + p_dados.getNasc() + ")";        
            stmt.executeUpdate(sql); //GO - Insert, Delete, Update
            //fechando conexao depois da inserção dos dados 
            conexao.close();
            return true;
        }
        catch(SQLException ex){
            System.out.println("Exception " + ex);
            return false;
        }
    }
}

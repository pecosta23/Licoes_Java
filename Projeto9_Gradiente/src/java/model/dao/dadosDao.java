/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.dados;
import util.conecta;

/**
 *
 * @author pedro
 */
public class dadosDao {
    public boolean Cadastro(dados p_dados) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = conecta.conectar();
            String sql = "INSERT INTO dados (nome, email, nasc) VALUES (?,?,?)";
            PreparedStatement stmt = conexao.prepareStatement(sql);
             
            stmt.setString(1, p_dados.getNome());
            stmt.setString(2, p_dados.getEmail());
            stmt.setTimestamp(3, Timestamp.valueOf(p_dados.getNasc()));
            
            stmt.executeUpdate(); //GO - Insert, Delete, Update
            //fechando conexao depois da inserção dos dados 
            conexao.close();
            return true;
        }
        catch(SQLException ex){
            System.out.println("Exception " + ex);
            return false;
        }
        
        catch(ClassNotFoundException x){
            System.out.println("Erro desconhcido" + x);
            return false;
        }
    }
}

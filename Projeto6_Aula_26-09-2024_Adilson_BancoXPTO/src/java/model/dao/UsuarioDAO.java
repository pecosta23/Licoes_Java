/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import model.Usuario;
import model.dao.UsuarioDAO;
import util.ConectaDB;
/**
 *
 * @author pedro
 */
public class UsuarioDAO {
    //atributos 
    
    //metodos
    public boolean insUsu(Usuario p_usuario) throws ClassNotFoundException{
        //inserir
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            //INSERT into usuario (login, fone, email, senha) VALUES ("ana", "(11)95588-3344", "ana@uol.com", "123456");
            String sql = "INSERT into usuario (login, fone, email, senha) VALUES ('" + p_usuario.getLogin() +
                                                                                  "', '" + p_usuario.getFone() + 
                                                                                  "', '" + p_usuario.getEmail() +
                                                                                  "', '" + p_usuario.getSenha() + "')";
            stmt.executeUpdate(sql); //GO - Insert, Delete, Update
            
            conexao.close();
            return true;
        }
        catch(SQLException ex){
            System.out.println("Exception " + ex);
            return false;
        }
    }
}

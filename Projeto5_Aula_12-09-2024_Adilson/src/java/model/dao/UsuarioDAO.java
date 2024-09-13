/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Usuario;
import java.sql.*;
import util.ConectaDB;

/**
 *
 * @author pedro
 */
public class UsuarioDAO {
    //atributo
    
    //metodo
    public Usuario consultar(Usuario p_usuario){
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * from usuario where usuario = '" + p_usuario.getUsuario() + "'";
        }
        catch(SQLException ex){
            
        }
        return p_usuario;
    }
}

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
    public Usuario consultar(Usuario p_usuario) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM usuarios WHERE usuario = '" + p_usuario.getUsuario() + "' and senha = '" + p_usuario.getSenha() + "'";
            ResultSet rs = stmt.executeQuery(sql); //GO
            
            int n_reg = 0;
            while (rs.next()){
                n_reg++;
            }
            conexao.close();
            
            if (n_reg == 0){
                return null;  
            }else{
                return p_usuario;
            }
        }
        catch(SQLException ex){
            System.out.println("Exception " + ex);
            return null;
        }
    }
}

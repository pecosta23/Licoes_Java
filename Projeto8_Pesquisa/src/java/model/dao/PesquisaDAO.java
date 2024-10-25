/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import model.Pesquisa;
import util.ConexaoDB;

/**
 *
 * @author pedro
 */
public class PesquisaDAO {
    //classe pública Dados DAO com o método de insricao para conseguir inscrever o user no sorteio
    //try catch com o mesmo tipo de exception (conexaoDB) de ausência de classe 
    public boolean Envia(Pesquisa p_pesquisa) throws ClassNotFoundException{
        //inserir
        Connection conexao = null;
        try{
            conexao = ConexaoDB.conectar();
            Statement stmt = conexao.createStatement();
            //
            String sql = "INSERT INTO pesquisa (nome, email, Q1, Q2, Q3, Q4, Q5) VALUES ('"
                                                                                        + p_pesquisa.getNome() + "','" 
                                                                                        + p_pesquisa.getEmail() + "'," 
                                                                                        + p_pesquisa.getQ1() + "," 
                                                                                        + p_pesquisa.getQ2() + "," 
                                                                                        + p_pesquisa.getQ3() + "," 
                                                                                        + p_pesquisa.getQ4() + "," 
                                                                                        + p_pesquisa.getQ5() + ")";       
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
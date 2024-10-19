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
            //insert into dados (nome, CPF, DDD, num, email, dtNasc, endereco) 
            //values ("ana", "35525285812", "11", "996759988", "ana@testedasilva.com", "20/05/2001", "Rua Cruzes Fiel, 89");
            String sql = "INSERT INTO pesquisa (resposta1, resposta2, resposta3, resposta4, resposta5) VALUES ('" + p_pesquisa.getResposta1()+
                                                                                                  "','" + p_pesquisa.getResposta2()+
                                                                                                  "','" + p_pesquisa.getResposta3()+ 
                                                                                                  "','" + p_pesquisa.getResposta4()+
                                                                                                  "','" + p_pesquisa.getResposta5()+ ")";        
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
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Pesquisa;
import util.ConexaoDB;
import java.util.List;

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
            String sql = "INSERT INTO pesquisa (nome, email, q1, q2, q3, q4, q5) VALUES ('"
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
    
    public Pesquisa consPesqId(Pesquisa p_pesq) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConexaoDB.conectar();
            Statement stmt = conexao.createStatement();
            //
            String sql = "SELECT * FROM pesquisa where pkid = " + p_pesq.getID();
            
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while(rs.next()){
               p_pesq.setID(Integer.parseInt(rs.getString("pkid")));
               p_pesq.setNome(rs.getString("nome"));
               p_pesq.setEmail(rs.getString("email"));
               p_pesq.setQ1(Integer.parseInt(rs.getString("q1")));
               p_pesq.setQ2(Integer.parseInt(rs.getString("q2")));
               p_pesq.setQ3(Integer.parseInt(rs.getString("q3")));
               p_pesq.setQ4(Integer.parseInt(rs.getString("q4")));
               p_pesq.setQ5(Integer.parseInt(rs.getString("q5")));
            n_reg++;
        }
        conexao.close();
     
        if(n_reg ==0){
            return null;
        }else{
            return p_pesq;
            }
        }catch(SQLException ex){
            System.out.println("Erro");
        }       
        return null;
    }
    
    public List consPesqLista() throws ClassNotFoundException{
        
        List lista = new ArrayList();
        
        Connection conexao = null;
        try{
            conexao = ConexaoDB.conectar();
            Statement stmt = conexao.createStatement();
            //
            String sql = "SELECT * FROM pesquisa";
            
            ResultSet rs = stmt.executeQuery(sql);
            
            int n_reg = 0;
            while(rs.next()){
               Pesquisa pesquisa = new Pesquisa();
               pesquisa.setID(Integer.parseInt(rs.getString("pkid")));
               pesquisa.setNome(rs.getString("nome"));
               pesquisa.setEmail(rs.getString("email"));
               pesquisa.setQ1(Integer.parseInt(rs.getString("q1")));
               pesquisa.setQ2(Integer.parseInt(rs.getString("q2")));
               pesquisa.setQ3(Integer.parseInt(rs.getString("q3")));
               pesquisa.setQ4(Integer.parseInt(rs.getString("q4")));
               pesquisa.setQ5(Integer.parseInt(rs.getString("q5")));
               lista.add(pesquisa);
            n_reg++;
        }
        conexao.close();
     
        if(n_reg ==0){
            return null;
        }else{
            return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro");
        }       
        return null;
    }
 
    public boolean Excluir(Pesquisa p_pesquisa) throws ClassNotFoundException{
        //inserir
        Connection conexao = null;
        try{
            conexao = ConexaoDB.conectar();
            Statement stmt = conexao.createStatement();
            //
            String sql = "DELETE FROM pesquisa where pkid=" + p_pesquisa.getID();       
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
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;

import model.Pesquisa;
import java.sql.*;
import util.ConectaDB;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author alunocmc
 */
public class PesquisaDAO {
    // Atrib.
    
    //Método
    public boolean insPesq(Pesquisa p_pesq) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //INSERT INTO pesquisa(nome, email, Q1, Q2, Q3, Q4, dt_pesq) VALUES ('Bia','bia@umc.br', 3, 4, 1, 5, '2024/10/31');         
            String sql = "INSERT INTO pesquisa(nome, email, Q1, Q2, Q3, Q4, dt_pesq) VALUES ('" + p_pesq.getNome()+ "'," +
                                                                                   "'" + p_pesq.getEmail()+ "'," +
                                                                                       + p_pesq.getQ1()+ ", " +
                                                                                       + p_pesq.getQ2()+ ", " +
                                                                                       + p_pesq.getQ3()+ ", "
                                                                                       + p_pesq.getQ4()+ 
                                                                                 ", '" + p_pesq.getDt_pesq()+  "')";
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }   
    
    public Pesquisa consPesqId(Pesquisa p_pesq) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //SELECT * FROM pesquisa where pkid = 5;
            String sql = "SELECT * FROM pesquisa where pkid = " + p_pesq.getId();
            ResultSet rs = stmt.executeQuery(sql);
                        
            int n_reg = 0;
            while (rs.next()) {                
                p_pesq.setId(Integer.parseInt( rs.getString("pkid")));
                p_pesq.setNome(rs.getString("nome"));
                p_pesq.setEmail(rs.getString("email"));
                p_pesq.setQ1(Integer.parseInt( rs.getString("Q1") ));
                p_pesq.setQ2(Integer.parseInt( rs.getString("Q2") ));                
                p_pesq.setQ3(Integer.parseInt( rs.getString("Q3") ));
                p_pesq.setQ4(Integer.parseInt( rs.getString("Q4") ));
                p_pesq.setDt_pesq( rs.getString("dt_pesq"));
                p_pesq.setDt_update(rs.getString("dt_update"));
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return p_pesq;               
            }
        }catch(SQLException ex){
            System.out.println("Exception: " + ex);
            return null;
        } 
    } 
    
    public List consPesqLista() throws ClassNotFoundException{
        
        List lista = new ArrayList();
        
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //SELECT * FROM pesquisa
            String sql = "SELECT * FROM pesquisa";
            ResultSet rs = stmt.executeQuery(sql);
                        
            int n_reg = 0;
            while (rs.next()) {
                Pesquisa pesquisa = new Pesquisa();
                pesquisa.setId(Integer.parseInt( rs.getString("pkid")));
                pesquisa.setNome(rs.getString("nome"));
                pesquisa.setEmail(rs.getString("email"));
                pesquisa.setQ1(Integer.parseInt( rs.getString("Q1") ));
                pesquisa.setQ2(Integer.parseInt( rs.getString("Q2") ));                
                pesquisa.setQ3(Integer.parseInt( rs.getString("Q3") ));
                pesquisa.setQ4(Integer.parseInt( rs.getString("Q4") ));
                pesquisa.setDt_pesq( rs.getString("dt_pesq"));
                pesquisa.setDt_update(rs.getString("dt_update"));
                lista.add(pesquisa);
                n_reg++;
            }
            conexao.close();
            
            if (n_reg==0){
                return null;
            }else{
                return lista;               
            }
        }catch(SQLException ex){
            System.out.println("Exception: " + ex);
            return null;
        } 
    }  
    
    public boolean exPesqId(Pesquisa p_pesq) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //DELETE FROM pesquisa WHERE pkid=6;
            String sql = "DELETE FROM pesquisa WHERE pkid=" + p_pesq.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }  
    
    public boolean altPesq(Pesquisa p_pesq) throws ClassNotFoundException{
        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
                        //UPDATE pesquisa SET nome='Talita', email='talita@umc.br', Q1=3, Q2=3, Q3=3, Q4=3, dt_pesq='2024-11-14' WHERE pkid=3         
            String sql = "UPDATE pesquisa SET nome='" + p_pesq.getNome()+ "'," + 
                                                    "email='" + p_pesq.getEmail()+ "'," +
                                                    "Q1=" + p_pesq.getQ1()+ ", " +
                                                    "Q2=" + p_pesq.getQ2()+ ", " +
                                                    "Q3=" + p_pesq.getQ3()+ ", " +
                                                    "Q4=" + p_pesq.getQ4()+ ", " +
                                                    "dt_update='" + p_pesq.getDt_update()+  "' WHERE pkid=" + p_pesq.getId();
            stmt.executeUpdate(sql); //GO - Executar - Insert / Delete / Update
            return true;
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }    
}

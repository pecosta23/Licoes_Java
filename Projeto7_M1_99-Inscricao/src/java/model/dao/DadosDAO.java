/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;
import java.sql.*;
import model1.Dados;
import util.ConexaoDB;
import java.time.*;
import java.time.format.*;
/**
 *
 * @author pedro
 * dia 1 06/10/2024 criação do Data Access Object
 *                  não possui atributos, já estão no Dados (package model1)
 *                  depois das classes criação dos index's
 */
public class DadosDAO {
    //classe pública Dados DAO com o método de insricao para conseguir inscrever o user no sorteio
    //try catch com o mesmo tipo de exception (conexaoDB) de ausência de classe 
    public boolean Inscricao(Dados p_dados) throws ClassNotFoundException{
        //inserir
        Connection conexao = null;
        try{
            conexao = ConexaoDB.conectar();
            Statement stmt = conexao.createStatement();
            //insert into dados (nome, CPF, DDD, num, email, dtNasc, endereco) 
            //values ("ana", "35525285812", "11", "996759988", "ana@testedasilva.com", "20/05/2001", "Rua Cruzes Fiel, 89");
            String sql = "INSERT INTO dados (nome, CPF, DDD, num, email, dtNasc, endereco) VALUES ('" + p_dados.getNome() +
                                                                                                  "','" + p_dados.getCPF() +
                                                                                                  "','" + p_dados.getDDD() + 
                                                                                                  "','" + p_dados.getNum() +
                                                                                                  "','" + p_dados.getEmail() +
                                                                                                  "','" + p_dados.getDtNasc() +
                                                                                                  "','" + p_dados.getEndereco() + "')";
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
    
    //classe publica type booleana pra ver se a pessoa tem mais de 18 anos
    //porque estamos lidando com um sorteio de bebidas alcoolicas
    public static boolean Validar(String DtNasc){
        DateTimeFormatter validador = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate dataNascimento = LocalDate.parse(DtNasc, validador);
        LocalDate dataHoje = LocalDate.now();
        
        //calculo
        int idade = Period.between(dataNascimento, dataHoje).getYears();
        
        return idade >= 18;
    }
}

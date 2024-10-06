/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// importando tudo do java sql para utilizar nos métodos
package source;
import java.sql.*;
import javax.swing.JOptionPane;
/**
 *
 * @author pedro
 * dia 1 -> 05/10/2024 crição dos métodos
 *          inserção de dados no banco e afins
 */
public class ControleCalcFinan {
    private Connection conexao;
    private PreparedStatement sql;
    private ResultSet lista;
    
    Dados dados = new Dados();
    
    public void Conexao(){
        //variaveis de acesso ao banco 
        String servidor = "Localhost: 3306";
        String usuario = "root";
        String senha = "";
        String banco = "bdfinanciamento";
        //localizando o nome do driver
        String nomedriver = "com.mysql.cj.jdbc.Driver";
        //bloco try cacth para ativar o driverr
        
        try{
            Class.forName(nomedriver);
            //criando a conexao
            String local = "jdbc:mysql://"+servidor+"/"+banco+"?useTimezone=true&serverTimezone=UTC";
            conexao = DriverManager.getConnection(local, usuario, senha);
            conexao.createStatement();
        }
        catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, "Erro com o driver!");
        }
        catch(SQLException e){
            JOptionPane.showMessageDialog(null, "Erro de conexão com o banco de dados!");
        }
    }
    
    //metodo para listar os tipos de financimentos disponiveis (caso queira utilizar algum do banco de dados)
    public void Listar(){
        try{
            sql = conexao.prepareStatement("select * from dados");
            lista = sql.executeQuery();
            while(lista.next()){
                System.out.println(" Valor Financiado: "+ lista.getString("valorFinanciado") + " Número de Parcelas: " + lista.getString("numParcelas") 
                        + "Taxa Juros: " + lista.getString("taxaJuros"));
            }
        }
        catch(SQLException e){
            JOptionPane.showMessageDialog(null,"Erro SQL!");
        }
    }
    
    //metodo para cadastrar noivas informações de financiamento (valor, entrada, parcelas...)
    public void Cadastrar(double valorFinanciamento, int numParcelas, double taxaJuros){
        //primeiro, armazenar os dados
        dados.setValorFinanciado(valorFinanciamento);
        dados.setNumParcelas(numParcelas);
        dados.setTaxaJuros(taxaJuros);
        try{
            sql = conexao.prepareStatement("Insert into dados (valorFinanciado, numParcelas, taxaJuros) values (?,?,?)");
            sql.setDouble(1, valorFinanciamento);
            sql.setInt(2, numParcelas);
            sql.setDouble(3, taxaJuros);
            
            //var para verificar execução do statement de cadastro (insert)
            int verificar = sql.executeUpdate();
            
            //condicao para validar retorno da var acima de 0 executou normal
            //abaixo deu erro
            if (verificar > 0 ){
                JOptionPane.showMessageDialog(null, "Cadastro dos dados realizado com sucesso!");
            }else{
                JOptionPane.showMessageDialog(null, "Uma ou mais informações estão incompletas");
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro do cadastro");
        }
    }  
    
    //proximo metodo (botao)
}

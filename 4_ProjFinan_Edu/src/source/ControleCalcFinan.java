/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// importando tudo do java sql para utilizar nos métodos
package source;
import java.awt.HeadlessException;
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
        String banco = "dbfinanciamento";
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
                System.out.println("ID do Financiamento:"+ lista.getString("idFinan") + "   Valor Financiado:"+ lista.getString("valorFinanciado") 
                        + "   Numero de Parcelas:" + lista.getString("numParcelas") + "   Taxa Juros:" + lista.getString("taxaJuros"));
            }
        }
        catch(SQLException e){
            JOptionPane.showMessageDialog(null,"Erro SQL!");
        }
    }
    
    //metodo para cadastrar novas informações de financiamento (valor, entrada, parcelas...)
    public void Cadastrar(int idFinan, double valorFinanciamento, int numParcelas, double taxaJuros){
        //primeiro, armazenar os dados
        dados.setIdFinan(idFinan);
        dados.setValorFinanciado(valorFinanciamento);
        dados.setNumParcelas(numParcelas);
        dados.setTaxaJuros(taxaJuros);
        try{
            sql = conexao.prepareStatement("Insert into dados (idFinan, valorFinanciado, numParcelas, taxaJuros) values (?,?,?,?)");
            sql.setInt(1,idFinan);
            sql.setDouble(2, valorFinanciamento);
            sql.setInt(3, numParcelas);
            sql.setDouble(4, taxaJuros);
            
            //var para verificar execução do statement de cadastro (insert)
            int x = sql.executeUpdate();
            
            //condicao para validar retorno da var acima de 0 executou normal
            //abaixo deu erro
            if (x > 0 ){
                JOptionPane.showMessageDialog(null, "Cadastro dos dados realizado com sucesso!");
            }else{
                JOptionPane.showMessageDialog(null, "Uma ou mais informações estão incompletas");
            }
        }
        catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null, "Erro no cadastro, este ID de Financiamento já está sendo utilizado!");
        }
    }  
    
    //proximo metodo (botao consultar (consulta os financimentos mais realizados))
    public String Consultar(int idFinan){
        String consulta="";
        try{
            sql = conexao.prepareStatement("select * from dados where idFinan = ?");
            sql.setInt(1, idFinan);
            lista = sql.executeQuery();
            if (lista.next()){
                consulta += lista.getString("valorFinanciado");
                consulta += ";";
                consulta += lista.getString("numParcelas");
                consulta += ";";
                consulta += lista.getString("taxaJuros");
            }
            else{
                JOptionPane.showMessageDialog(null,"Registro não encontrado!");
            }
        }
        catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null,"Erro SQl!");
        }
        return consulta;
    }
     
    //proximo metodo (botao de calcular do tipo SAC)
    public double CalcularSAC(double valorFinanciamento, int numParcelas, double taxaJuros){
        //condições para analisar se algum dos valores for equivalente a zero
        if (valorFinanciamento <= 0) {
            System.out.println("O valor do financiamento deve ser maior que 0.");
            return 0;
        }
        if (numParcelas <= 0) {
            System.out.println("O numero de parcelas deve ser maior que 0.");
            return 0;
        }
        if (taxaJuros <= 0) {
            System.out.println("A taxa de juros deve ser maior que 0.");
            return 0;
        } 
        double amortizacao = valorFinanciamento/ numParcelas;
        
        System.out.println("Prestacao SAC:");
        
        for (int x = 1; x <= numParcelas; x++){
            double divida = valorFinanciamento - amortizacao * (x-1);
            double juros = divida * taxaJuros;
            double parcela = amortizacao * juros;
            
            System.out.println(" Parcela " + x + ": Amortizacao -> " + amortizacao + ", Juros -> " + juros + ", Parcela Mensal -> " + parcela);
        }
        return 0;
    }
    
    //proximo metodo (botao de calcular do tipo PRICE)
    public double CalcularPRICE(double valorFinanciamento, int numParcelas, double taxaJuros) {
        //condições para validar se caso um dos valores informados seja 0
        if (valorFinanciamento <= 0) {
            System.out.println("O valor do financiamento deve ser maior que 0.");
            return 0;
        }
        if (numParcelas <= 0) {
            System.out.println("O numero de parcelas deve ser maior que 0.");
            return 0;
        }
        if (taxaJuros <= 0) {
            System.out.println("A taxa de juros deve ser maior que 0.");
            return 0;
        } 
        double j = taxaJuros;  // Taxa de juros por período mensal

        // Fórmula da prestação no sistema PRICE
        double parcela = valorFinanciamento * j / (1 - Math.pow(1 + j, -numParcelas));

        System.out.println("Prestacao PRICE: ");

        for (int y = 1; y <= numParcelas; y++) {
            double divida = valorFinanciamento * Math.pow(1 + j, y) - parcela * (Math.pow(1 + j, y) - 1) / j;
            double juros = divida * j;
            double amortizacao = parcela - juros;

            System.out.println("Parcela " + y + ": Amortizacao -> " + amortizacao + ", Juros -> " + juros + ", Parcela Mensal -> " + parcela);
        }
        return 0;
    }
    
    //próximo método (botão de exlcuir um financiamento consultado)
    public void Excluir(int idFinan) throws SQLException{
            sql=conexao.prepareStatement("delete from dados where idFinan="+idFinan);
            int x = sql.executeUpdate();
            if (x >0){
                JOptionPane.showMessageDialog(null, "Registro de financiamento excluído com sucesso!");
            }
            else{
                JOptionPane.showMessageDialog(null, "ID de financiamento não encontrado");
            }
    }
    
    //método alterar os dados de um financimaento (é possível consultar e alterar, ou mudar um dado que foi cadastrado errado)
    public void Alterar(int idFinan, double valorFinanciado, int numParcelas, double taxaJuros){
        try{
            sql=conexao.prepareStatement("update dados set valorFinanciado='"+valorFinanciado+"',numParcelas='"+numParcelas+"',taxaJuros='"+taxaJuros+"' where idFinan="+idFinan);
            int x =sql.executeUpdate();
            if (x >0){
                JOptionPane.showMessageDialog(null, "Os dados do financiamento foram alterados com sucesso!");
            }
            else{
                JOptionPane.showMessageDialog(null, "O ID do financiamento não foi encontrado");
            }
        }
        catch(HeadlessException | SQLException e){
            JOptionPane.showMessageDialog(null, "Erro SQL!");
        }
    }  
}

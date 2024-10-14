import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class ControleNota {
    private Connection conexao;
    private Statement comando;
    private PreparedStatement sql;
    private ResultSet lista;
    
    Aluno aluno = new Aluno();
    
    public void Conexao(){
        //criacao das cariaveis para acesso ao mysql
        String nomeservidor = "Localhost:3306";
        String usuario = "root";
        String senha = "";
        String nomebanco = "bdalunos";
        // variavel que contem o nome do driver
        String drivername="com.mysql.cj.jdbc.Driver";
        //ativando o driver
        try{
            //ativar o driver
            Class.forName(drivername);
            //criando a conexao ao banco de dados
            String url="jdbc:mysql://"+nomeservidor+"/"+nomebanco+"?useTimezone=true&serverTimezone=UTC";
            conexao = DriverManager.getConnection(url, usuario, senha);
            comando = conexao.createStatement();
        }
        catch (ClassNotFoundException e){
            JOptionPane.showMessageDialog(null, "Erro de driver");
        }
        catch (Exception e){
            JOptionPane.showMessageDialog(null, "Erro ao conectar ao banco de dados");
        }    
    }      
    public void Cadastrar(int rgm, String nm, double n1, double n2){
        //armazenando os dados nos atributos da classe Aluno
        aluno.setRgm(rgm);
        aluno.setNome(nm);
        aluno.setNota1(n1);
        aluno.setNota2(n2);   
        try{ 
        sql = conexao.prepareStatement("Insert into alunos (rgm, nome, nota1, nota2) values (?,?,?,?)");
        sql.setInt(1, aluno.getRgm());
        sql.setString(2, aluno.getNome());
        sql.setDouble(3, aluno.getNota1());
        sql.setDouble(4, aluno.getNota2());
        int verifica = sql.executeUpdate();
        if (verifica > 0){
            JOptionPane.showMessageDialog(null,"Registro com sucesso");
        }
        else{
              JOptionPane.showMessageDialog(null, "Erro ao registrar");
        }  
        }
        catch (Exception e){
            JOptionPane.showMessageDialog(null,"RGM já cadastrado!");
        }
    } 
    public void Listar(){
        try{
            sql = conexao.prepareStatement("select * from alunos");
            lista = sql.executeQuery();
            while(lista.next()){
                System.out.println(" RGM: "+ lista.getString("rgm") + " Nome: " + lista.getString("nome") 
                        + " Nota 1: " + lista.getString("nota1") + " Nota 2: " + lista.getString("nota2"));
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,"Erro SQL!");
        }
    }
    public String Consultar(int numrgm){
        String dados="";
        try{
            sql = conexao.prepareStatement("select * from alunos where rgm = ?");
            sql.setInt(1, numrgm);
            lista = sql.executeQuery();
            if (lista.next()){
                dados += lista.getString("nome");
                dados += ";";
                dados += lista.getString("nota1");
                dados += ";";
                dados += lista.getString("nota2");
            }
            else{
                JOptionPane.showMessageDialog(null,"Registro não encontrado!");
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,"Erro SQl!");
        }
        return dados;
    }
    public void Excluir(int numrgm){
        try{
            sql=conexao.prepareStatement("delete from alunos where rgm="+numrgm);
            int verifica = sql.executeUpdate();
            if (verifica>0){
                JOptionPane.showMessageDialog(null, "Registro alterado com sucesso!");
            }
            else{
                JOptionPane.showMessageDialog(null, "Aluno não encontrado");
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro SQL!");
        }
    }
    public void Alterar(int numrgm, String nm, double n1, double n2){
        try{
            sql=conexao.prepareStatement("update alunos set nome='"+nm+"',nota1='"+n1+"',nota2='"+n2+"' where rgm="+numrgm);
            int verifica=sql.executeUpdate();
            if (verifica>0){
                JOptionPane.showMessageDialog(null, "Registro alterado com sucesso!");
            }
            else{
                JOptionPane.showMessageDialog(null, "Aluno não encontrado");
            }
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null, "Erro SQL!");
        }
    }
    public double CalcMedia(double n1, double n2){
        return (n1+n2)/2;    
    }
}

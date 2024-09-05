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
}
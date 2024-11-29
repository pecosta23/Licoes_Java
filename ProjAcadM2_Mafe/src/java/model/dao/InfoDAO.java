/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.dao;
/**
 *
 * @author pedro
 */
//importando extensoes necessarias
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import model.Info;
import util.ConexDB;
//criação da classe que armazenará os métodos (DAO)

import java.sql.Connection;

public class InfoDAO {
    //escolhi inserir os dados dessa maneira, acho que fica mais facil de identificar
    public boolean InserirAlu(Info dados) throws ClassNotFoundException {
        Connection conex = null;
        PreparedStatement stmt = null;
        
        try {
            conex = ConexDB.conectar();  // Conectando ao banco de dados
            
            String sql = "INSERT INTO alunos (id, nome_completo, data_nascimento, sexo, cpf, rg, endereco, telefone_contato, email, estado_civil, historico_medico, alergias, uso_medicamento, exame_medico, escolha_plano, forma_pagamento, dados_bancarios, resp_legal, assinatura_termo_condicoes, assinatura_contrato_servicos, assinatura_termo_responsabilidade, status_pagamento) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            stmt = conex.prepareStatement(sql);
            
            // Setando os parâmetros
            stmt.setInt(1, dados.getID());
            stmt.setString(2, dados.getNomeCompleto());
            stmt.setString(3, dados.getDataNascimento());
            stmt.setString(4, dados.getSexo());
            stmt.setString(5, dados.getCpf());
            stmt.setString(6, dados.getRg());
            stmt.setString(7, dados.getEndereco());
            stmt.setString(8, dados.getTelefoneContato());
            stmt.setString(9, dados.getEmail());
            stmt.setString(10, dados.getEstadoCivil());
            stmt.setString(11, dados.getHistoricoMedico());
            stmt.setString(12, dados.getAlergias());
            stmt.setString(13, dados.getUsoMedicamento());
            stmt.setInt(14, dados.getExameMedico());//int
            stmt.setString(15, dados.getEscolhaPlano());
            stmt.setString(16, dados.getFormaPagamento());
            stmt.setString(17, dados.getDadosBancarios());
            stmt.setInt(18, dados.getRespLegal());
            stmt.setInt(19, dados.getAssinaturaTermoCondicoes());//int
            stmt.setInt(20, dados.getAssinaturaContratoServicos());//int
            stmt.setInt(21, dados.getAssinaturaTermoResponsabilidade());//int
            stmt.setBoolean(22, true);//fez matricula -> pagou -> está em dia

            // Executando a query
            int camposInseridos = stmt.executeUpdate();
            
            return camposInseridos > 0;
            
        }catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
    public List TodosDados() throws ClassNotFoundException, SQLException{
        //array para trazer dados em lista
        List dados = new ArrayList();
        Connection conex = null;
        //bloco para tentar realizar a consulta
        try{
            conex = ConexDB.conectar();
            Statement stmt = conex.createStatement();
            String sql = "SELECT * FROM alunos";
            ResultSet rs = stmt.executeQuery(sql);
            //enquanto existir dados trazer
            int index = 0;
            while(rs.next()){
                Info inf = new Info();
                // Setando os parâmetros
                inf.setID(Integer.parseInt(rs.getString("id")));
                inf.setNomeCompleto(rs.getString("nome_completo"));
                inf.setDataNascimento(rs.getString("data_nascimento"));
                inf.setSexo(rs.getString("sexo"));
                inf.setCpf(rs.getString("cpf"));
                inf.setRg(rs.getString("rg"));
                inf.setEndereco(rs.getString("endereco"));
                inf.setTelefoneContato(rs.getString("telefone_contato"));
                inf.setEmail(rs.getString("email"));
                inf.setEstadoCivil(rs.getString("estado_civil"));
                inf.setHistoricoMedico(rs.getString("historico_medico"));
                inf.setAlergias(rs.getString("alergias"));
                inf.setUsoMedicamento(rs.getString("uso_medicamento"));
                inf.setExameMedico(Integer.parseInt(rs.getString("exame_medico")));//int
                inf.setEscolhaPlano(rs.getString("escolha_plano"));
                inf.setFormaPagamento(rs.getString("forma_pagamento"));
                inf.setDadosBancarios(rs.getString("dados_bancarios"));
                inf.setRespLegal(Integer.parseInt(rs.getString("resp_legal")));//int
                inf.setAssinaturaTermoCondicoes(Integer.parseInt(rs.getString("assinatura_termo_condicoes")));//int
                inf.setAssinaturaContratoServicos(Integer.parseInt(rs.getString("assinatura_contrato_servicos")));//int
                inf.setAssinaturaTermoResponsabilidade(Integer.parseInt(rs.getString("assinatura_termo_responsabilidade")));//int
                dados.add(inf);
                index++;
            }
            conex.close();
            //caso nenhum index retorna vazio
            if (index==0){
                return null;
            }else{
                //contem info mostra (dados)
                return dados;               
            }
        }catch(SQLException ex){
            System.out.println("Exception: " + ex);
            return null;
        }
    }       
    
    public boolean Maior18(String data_nascimento) {
    //Data de nascimento para local date
    DateTimeFormatter formt = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    LocalDate dataNasc = LocalDate.parse(data_nascimento, formt);
    LocalDate atual = LocalDate.now();
    // Calculo
    int idade = Period.between(dataNasc, atual).getYears();
    //True se maior de 18, false se menor
    return idade >= 18;
}
    
    public String verPendencia(int ID) throws ClassNotFoundException {
        //procura por a data da matricula que é preenchida de forma automatica quando 
        //o aluno realiza matricula e bate com o status de pagamento, tudo isso pelo ID do aluno
    String sql = "SELECT data_matricula, status_pagamento FROM alunos WHERE id = ?";
    Connection conex = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        conex = ConexDB.conectar(); //Conecta
        stmt = conex.prepareStatement(sql);
        stmt.setInt(1, ID);
        rs = stmt.executeQuery();

        if (rs.next()) {
            Date dataMatricula = rs.getDate("data_matricula");
            boolean statusPagamento = rs.getBoolean("status_pagamento");

            //Calcula a diferença entre a data de matrícula e a data atual (duração de 30 dias/ um mês)
            // ou seja, de mês em mês ele atualiza
            LocalDate atual = LocalDate.now();
            //tive que colocar dataMatriculaLocal para entender que é uma passagem para localDate
            LocalDate dataMatriculaLocal = dataMatricula.toLocalDate();
            long diferenca = ChronoUnit.MONTHS.between(dataMatriculaLocal, atual);

            //Verificando a pendencia (se houver)
            if (statusPagamento || diferenca < 1) {
                return "Não há saldo devedor.";
            } else {
                return "Aluno com pendências.";
            }
        } else {
            return "Aluno não encontrado.";
        }

    } catch (SQLException e) {
        return "Erro ao consultar pendências.";
    } 
}
    
    public boolean ExAlu(Info dados) throws ClassNotFoundException {
    Connection conexao = null;
        try {
            conexao = ConexDB.conectar();
            Statement stmt = conexao.createStatement();

            //primeiro verifica sse o cara existe no BD, como que vai excluir sem nem saber que existe...
            String confereExis = "SELECT COUNT(*) AS total FROM alunos WHERE id=" + dados.getID();
            ResultSet rs = stmt.executeQuery(confereExis);

            //aqui ele pega os dados do select e bate no total, se for maior que 0 executa, se não o ID não existe no BD
            if (rs.next() && rs.getInt("total") > 0) {
                //exclui se existir
                String sql = "DELETE FROM alunos WHERE id=" + dados.getID();
                stmt.executeUpdate(sql);
                return true;
            } else {
                //se não existe
                return false;
            }
        } catch (SQLException ex) {
            System.out.println("Erro: Não foi possível exlcuir o aluno");
            return false;
        }
}  
    
    public boolean AtualizarAlu(Info dados) throws ClassNotFoundException {
        //realiza conexao
        Connection conex = null;
        try {
        // Estabelece a conexão com o banco de dados
        conex = ConexDB.conectar();
        Statement stmt = conex.createStatement();

        // Query SQL de atualização
        String sql = "UPDATE alunos SET " +
                     "nome_completo='" + dados.getNomeCompleto() + "', " +
                     "data_nascimento='" + dados.getDataNascimento() + "', " +
                     "sexo='" + dados.getSexo() + "', " +
                     "cpf='" + dados.getCpf() + "', " +
                     "rg='" + dados.getRg() + "', " +
                     "endereco='" + dados.getEndereco() + "', " +
                     "telefone_contato='" + dados.getTelefoneContato() + "', " +
                     "email='" + dados.getEmail() + "', " +
                     "estado_civil='" + dados.getEstadoCivil() + "', " +
                     "historico_medico='" + dados.getHistoricoMedico() + "', " +
                     "alergias='" + dados.getAlergias() + "', " +
                     "uso_medicamento='" + dados.getUsoMedicamento() + "', " +
                     "exame_medico=" + dados.getExameMedico() + ", " +
                     "escolha_plano='" + dados.getEscolhaPlano() + "', " +
                     "forma_pagamento='" + dados.getFormaPagamento() + "', " +
                     "dados_bancarios='" + dados.getDadosBancarios() + "', " +
                     "resp_legal=" + dados.getRespLegal() + ", " +
                     "assinatura_termo_condicoes=" + dados.getAssinaturaTermoCondicoes() + ", " +
                     "assinatura_contrato_servicos=" + dados.getAssinaturaContratoServicos() + ", " +
                     "assinatura_termo_responsabilidade=" + dados.getAssinaturaTermoResponsabilidade() + " " +
                     "WHERE id=" + dados.getID();
  
            //Executando a query
            stmt.executeUpdate(sql);

            return true;//Retorna true se a linha foi atualizada
        } catch(SQLException ex){
            System.out.println("Erro:" + ex);
            return false;
        }
    }
    
    public Info consDadosPorId(Info dados) throws ClassNotFoundException {
        //realiza conexao
        Connection conexao = null;
        try {
            conexao = ConexDB.conectar();
            Statement stmt = conexao.createStatement();
            //consulta todos os dados por ID
            String sql = "SELECT * FROM alunos WHERE ID = " + dados.getID();
            ResultSet rs = stmt.executeQuery(sql);

            int n_reg = 0;
            while (rs.next()) {
                dados.setID(rs.getInt("id"));
                dados.setNomeCompleto(rs.getString("nome_completo"));
                dados.setDataNascimento(rs.getString("data_nascimento"));
                dados.setSexo(rs.getString("sexo"));
                dados.setCpf(rs.getString("cpf"));
                dados.setRg(rs.getString("rg"));
                dados.setEndereco(rs.getString("endereco"));
                dados.setTelefoneContato(rs.getString("telefone_contato"));
                dados.setEmail(rs.getString("email"));
                dados.setEstadoCivil(rs.getString("estado_civil"));
                dados.setHistoricoMedico(rs.getString("historico_medico"));
                dados.setAlergias(rs.getString("alergias"));
                dados.setUsoMedicamento(rs.getString("uso_medicamento"));
                dados.setExameMedico(rs.getInt("exame_medico"));
                dados.setEscolhaPlano(rs.getString("escolha_plano"));
                dados.setFormaPagamento(rs.getString("forma_pagamento"));
                dados.setDadosBancarios(rs.getString("dados_bancarios"));
                dados.setRespLegal(rs.getInt("resp_legal"));
                dados.setAssinaturaTermoCondicoes(rs.getInt("assinatura_termo_condicoes"));
                dados.setAssinaturaContratoServicos(rs.getInt("assinatura_contrato_servicos"));
                dados.setAssinaturaTermoResponsabilidade(rs.getInt("assinatura_termo_responsabilidade"));
                dados.setStatusPagamento(rs.getBoolean("status_pagamento"));
                n_reg++;
            }
            conexao.close();

            if (n_reg == 0) {
                return null;
            } else {
                return dados;
            }
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex);
            return null;
        }
    }   
}

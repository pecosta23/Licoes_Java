<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>

<%@page import="model.Info"%>
<%@page import="model.dao.InfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Matrículas dos alunos atuais</h3>
        <% 
        //instanciando a classe
        InfoDAO infoDAO = new InfoDAO();
        //fazendo o array
        List<Info> lista = new ArrayList<>();
        lista = (infoDAO.TodosDados());

        int index = 0 ;
        //out.println("<br><br> <img src='../imagem/logo.jpg' alt=''/>");
        //out.println("<h3><b>Matrículas dos alunos atuais</b></h3>");
        //loop para cada aluno  
        for( int x = 0; x <= lista.size()-1; x++){            
            out.println("<br><br> <b>#:</b> " + x); 
            out.println("<br> <b>ID:</b> " + lista.get(x).getID());
            out.println("<br> Nome Completo: " + lista.get(x).getNomeCompleto());
            out.println("<br> Data de Nascimento: " + lista.get(x).getDataNascimento());
            out.println("<br> Sexo: " + lista.get(x).getSexo());
            out.println("<br> CPF: " + lista.get(x).getCpf());
            out.println("<br> RG: " + lista.get(x).getRg());
            out.println("<br> Endereço: " + lista.get(x).getEndereco());
            out.println("<br> Telefone de Contato: " + lista.get(x).getTelefoneContato());
            out.println("<br> E-mail: " + lista.get(x).getEmail());
            //out.println("<br> Estado Civil: " + lista.get(x).getEstadoCivil());
            out.println("<br> Histórico Médico: " + lista.get(x).getHistoricoMedico());
            out.println("<br> Alergias: " + lista.get(x).getAlergias());
            out.println("<br> Uso de Medicamento: " + lista.get(x).getUsoMedicamento());
            //out.println("<br> Exame Médico: " + lista.get(x).getExameMedico());
            out.println("<br> Escolha do Plano: " + lista.get(x).getEscolhaPlano());
            out.println("<br> Forma de Pagamento: " + lista.get(x).getFormaPagamento());
            out.println("<br> Dados Bancários: " + lista.get(x).getDadosBancarios());
            //out.println("<br> Responsável Legal: " + lista.get(x).getRespLegal());
            //out.println("<br> Assinatura Termo de Condições: " + lista.get(x).getAssinaturaTermoCondicoes());
            //out.println("<br> Assinatura Contrato de Serviços: " + lista.get(x).getAssinaturaContratoServicos());
            //out.println("<br> Assinatura Termo de Responsabilidade: " + lista.get(x).getAssinaturaTermoResponsabilidade());
            index++;                           
        }
        out.println("<br><br><b>Quantidade de alunos atuais: </b>" + index + "<br>");
        //out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");       
        %>
        <p><a href="../index.html">Retorno</a></p>
    </body>
</html>

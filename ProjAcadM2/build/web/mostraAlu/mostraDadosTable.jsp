<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>
<%--imports necessários--%>
<%@page import="model.Info"%>
<%@page import="model.dao.InfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listando todos os dados (tabela)</title>
    </head>
    <body>
        <h3><b>Matrículas dos alunos atuais</b><br></h3>
        <%              
        //instanciando classe
        InfoDAO infoDAO = new InfoDAO();
        //fazendo array
        List<Info> dados = new ArrayList<>();
        dados = infoDAO.TodosDados();
        //index para loop
        int index = 0 ;
        //out.println("<br><br> <img src='../imagem/logo.jpg' alt=''/>");
        //out.println("<br><b>Matrículas dos alunos atuais</b>");           
        %>      
        
        <!<!-- Cabeçalho -->
        <table border="1">
                <tr>
                    <th>#</th>
                    <th>Id</th>
                    <th>Data de Nascimento</th>
                    <th>Sexo</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Endereço</th>
                    <th>Telefone de Contato</th>
                    <th>E-mail</th>
                    <%--<th>Estado Civil</th>--%>
                    <th>Histórico Médico</th>
                    <th>Alergias</th>
                    <th>Uso de Medicamento</th>
                    <%--<th>Exame Médico</th>--%>
                    <th>Escolha do Plano</th>
                    <th>Forma de Pagamento</th>
                    <th>Dados Bancários</th>
                    <%--<th>Responsável Legal</th>
                    <th>Assinatura Termo de Condições</th>
                    <th>Assinatura Contrato de Serviços</th>
                    <th>Assinatura Termo de Responsabilidade</th>--%>
                </tr>                     
        <%
        for(int y = 0; y <= dados.size()-1; y++){            
        %>            
            <tr>
                <td><%=y+1%></td>
                <td><%=dados.get(y).getID()%></td>
                <td><%=dados.get(y).getDataNascimento()%></td>
                <td><%=dados.get(y).getSexo()%></td>
                <td><%=dados.get(y).getCpf()%></td>
                <td><%=dados.get(y).getRg()%></td>
                <td><%=dados.get(y).getEndereco()%></td>
                <td><%=dados.get(y).getTelefoneContato()%></td>
                <td><%=dados.get(y).getEmail()%></td>
                <%--<td><%=dados.get(y).getEstadoCivil()%></td>--%>
                <td><%=dados.get(y).getHistoricoMedico()%></td>
                <td><%=dados.get(y).getAlergias()%></td>
                <td><%=dados.get(y).getUsoMedicamento()%></td>
                <%--<td><%=dados.get(y).getExameMedico()%></td>--%>
                <td><%=dados.get(y).getEscolhaPlano()%></td>
                <td><%=dados.get(y).getFormaPagamento()%></td>
                <td><%=dados.get(y).getDadosBancarios()%></td>
                <%--<td><%=dados.get(y).getRespLegal()%></td>
                <td><%=dados.get(y).getAssinaturaTermoCondicoes()%></td>
                <td><%=dados.get(y).getAssinaturaContratoServicos()%></td>
                <td><%=dados.get(y).getAssinaturaTermoResponsabilidade()%></td>--%>
            </tr>
        <%
            index++;                           
        }
        %>
        </table>
        <%
            out.println("<br><br><b>Quantidade de alunos atuais: </b>" + index + "<br>");
            //out.println("<br><br><b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");        
        %>
        <p><a href="../index.html">Retorno</a></p>
    </body>
</html>

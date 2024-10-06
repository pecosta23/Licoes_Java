<%-- 
    Document   : inscricao
    Created on : 6 de out. de 2024, 17:07:07
    Author     : pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model1.Dados"%>
<%@page import="model.dao.DadosDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <!-- Entrada dos dados do form com as diversas classes e métodos do java -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscrição</title>
    </head>
    <body>
        <h1>Se inscreva hoje no sorteio</h1>
        <%
            //entrada dos dados 
            String nome = request.getParameter("nome");
            String CPF = request.getParameter("CPF");
            //Integer DDD = Integer.parseInt(request.getParameter("DDD"));
            //Integer num = Integer.parseInt(request.getParameter("num"));
            String DDD = request.getParameter("DDD");
            String num = request.getParameter("num");
            String email = request.getParameter("email");
            String dtNasc = request.getParameter("dtNasc");
            String endereco = request.getParameter("endereco");
            
            //instanciando 
            Dados dados = new Dados();
            dados.setNome(nome);
            dados.setCPF(CPF);
            dados.setDDD(DDD);
            dados.setNum(num);
            dados.setEmail(email);
            dados.setDtNasc(dtNasc);
            dados.setEndereco(endereco);
                
            DadosDAO dadosDAO = new DadosDAO();
            //condição que leva ao metodo de inscrição da classe DAO
            //caso seja inserido com sucesso (if - ok), erro (else - not ok)
            if(dadosDAO.Inscricao(dados)){
                out.println("Login realizado com sucesso");
            }else{ 
                out.println("Erro, usuário não cadastrado");
            }
        %>
    </body>
</html>

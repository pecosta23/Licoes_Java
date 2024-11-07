<%-- 
    Document   : cadastro
    Created on : 20 de out. de 2024, 13:36:18
    Author     : pedro
--%>

<%@page import="model.dao.DadosDAO"%>
<%@page import="model1.Dados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String nasc = request.getParameter("nasc");
     
            Dados dados = new Dados();
            dados.setNome(nome);
            dados.setEmail(email);
            dados.setNasc(nasc);
            
            DadosDAO dadosDAO = new DadosDAO();
            if(dadosDAO.Cadastro(dados)){
                out.println("Dados inserido com sucesso");
            } else {
                out.println("Erro no cadastro");
            }
        %>
    </body>
</html>

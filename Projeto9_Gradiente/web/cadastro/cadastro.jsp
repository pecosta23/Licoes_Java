<%-- 
    Document   : cadastro
    Created on : 20 de out. de 2024, 13:36:18
    Author     : pedro
--%>

<%@page import="model.dao.dadosDao"%>
<%@page import="model.dados"%>
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
     
            dados dados = new dados();
            dados.setNome(nome);
            dados.setEmail(email);
            dados.setNasc(nasc);
            
            dadosDao dadosDao = new dadosDao();
            if(dadosDao.Cadastro(dados)){
                out.println("Dados inseridos com sucesso");
            } else {
                out.println("Erro no cadastro");
            }
        %>
    </body>
</html>

<%-- 
    Document   : pesquisa
    Created on : 17 de out. de 2024, 21:29:33
    Author     : pedro
--%>

<%@page import="model.dao.PesquisaDAO"%>
<%@page import="model.Pesquisa"%>
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
         
        String resposta1 = request.getParameter("resposta1");
        String resposta2 = request.getParameter("resposta2");    
        String resposta3 = request.getParameter("resposta3");
        String resposta4 = request.getParameter("resposta4");
        String resposta5 = request.getParameter("resposta5");
            
        Pesquisa pesquisa = new Pesquisa();    
            
        pesquisa.setResposta1(resposta1);
        pesquisa.setResposta2(resposta2);
        pesquisa.setResposta3(resposta3);
        pesquisa.setResposta4(resposta4);
        pesquisa.setResposta5(resposta5);
        
        PesquisaDAO pesquisaDAO = new PesquisaDAO();
        
        if (pesquisaDAO.Envia(pesquisa)){
            out.println("Dados enviados com sucesso");
        }else{
            out.println("Erro, os dados não puderem ser enviados");
        }    
        %>
    </body>
</html>

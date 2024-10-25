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
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        int r1 = Integer.parseInt(request.getParameter("r1"));
        int r2 = Integer.parseInt(request.getParameter("r2"));    
        int r3 = Integer.parseInt(request.getParameter("r3"));
        int r4 = Integer.parseInt(request.getParameter("r4"));
        int r5 = Integer.parseInt(request.getParameter("r5"));
            
        Pesquisa pesquisa = new Pesquisa();  
        
        pesquisa.setNome(nome);
        pesquisa.setEmail(email);
        pesquisa.setQ1(r1);
        pesquisa.setQ2(r2);
        pesquisa.setQ3(r3);
        pesquisa.setQ4(r4);
        pesquisa.setQ5(r5);
        
        PesquisaDAO pesquisaDAO = new PesquisaDAO();
        
        if (pesquisaDAO.Envia(pesquisa)){
            out.println("Dados enviados com sucesso");
        }else{
            out.println("Erro, os dados não foram enviados");
        }    
        %>
    </body>
</html>

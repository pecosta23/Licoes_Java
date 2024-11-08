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
        <title>Consulta ID</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%     
        int ID = Integer.parseInt(request.getParameter("ID"));
            
        Pesquisa pesq = new Pesquisa();  
        
        pesq.setID(ID);
        
        PesquisaDAO pesquisaDAO = new PesquisaDAO();
        
        if(pesquisaDAO.Excluir(pesq)){
            out.println("ID excluído com sucesso");     
        }else{
            out.println("Erro");
        }    
        %>
    </body>
</html>

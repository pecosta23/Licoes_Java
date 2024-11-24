<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>Pesquisa - Excluir (Identificação)</h3>
        <%
        //Entrada/Receber
        int id = Integer.parseInt( request.getParameter("id") );

        // Instância e atrib de valor
        Pesquisa pesq = new Pesquisa();
        pesq.setId(id);
       
        //Insert
        PesquisaDAO pesqDAO = new PesquisaDAO();
        if(pesqDAO.exPesqId(pesq) ){
            out.println("Registro excluido!");        
        }else{
           out.println("Registro não excluído!!!");
        }
        %>
    </body>
</html>

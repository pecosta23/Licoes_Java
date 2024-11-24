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
        <h1>Pesquisa</h1>
        <%
        //Entrada/Receber
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        int r1 = Integer.parseInt( request.getParameter("r1") );
        int r2 = Integer.parseInt( request.getParameter("r2") );
        int r3 = Integer.parseInt( request.getParameter("r3") );
        int r4 = Integer.parseInt( request.getParameter("r4") ); 

        // Instância e atrib de valor
        Pesquisa pesq = new Pesquisa();
        pesq.setNome(nome);
        pesq.setEmail(email);
        pesq.setQ1(r1);
        pesq.setQ2(r2);
        pesq.setQ3(r3);        
        pesq.setQ4(r4);
        pesq.setDt_pesq(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())); //Converte a data atual do tipo Date para String , já formatando.
        
        //Insert
        PesquisaDAO pesqDAO = new PesquisaDAO();
        if(pesqDAO.insPesq(pesq)){
            out.println("Registro inserido com sucesso!");
        }else{
           out.println("Erro! Registro não inserido!!!");
        }
        %>
    </body>
</html>

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
        <h3>Pesquisa - Consulta Geral (Lista / Resgistro)</h3>
        <%
        //Entrada/Receber
        
        // Instância e atrib de valor
               
        //Insert
        PesquisaDAO pesqDAO = new PesquisaDAO();
         
        List<Pesquisa> lista = new ArrayList<>();
        lista = pesqDAO.consPesqLista();

        int n_reg = 0 ;
        out.println("<br><br> <img src='../imagem/logo.jpg' alt=''/>");
        out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
            
        for( int i = 0; i <= lista.size()-1; i++){            
            out.println("<br><br> #: " + i);
            out.println("<br> Id.: " + lista.get(i).getId());
            out.println("<br> Data: " + lista.get(i).getDt_pesq());
            out.println("<br> Data Update: " + lista.get(i).getDt_update());
            out.println("<br> <b>Nome:</b> " + lista.get(i).getNome());
            out.println("<br> E-mail: " + lista.get(i).getEmail());
            out.println("<br> Questão 1: " + lista.get(i).getQ1());
            out.println("<br> Questão 2: " + lista.get(i).getQ2());
            out.println("<br> Questão 3: " + lista.get(i).getQ3());
            out.println("<br> Questão 4: " + lista.get(i).getQ4());                            
            n_reg++;                           
        }
       out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
       out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");        
        %>

    </body>
</html>

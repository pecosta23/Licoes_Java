<%-- 
    Document   : pesquisa
    Created on : 17 de out. de 2024, 21:29:33
    Author     : pedro
--%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
        
        PesquisaDAO pesquisaDAO = new PesquisaDAO();
        
        List<Pesquisa> lista = new ArrayList<>();
        lista = pesquisaDAO.consPesqLista();
        
        int n_reg = 0;       
        out.println("<b>Pesquisa de satisfação - Registros</b> ");
        
        out.println("<br><br> # | ID | Data| Nome | E-mail <br>");
        
        for(int i = 0; i <= lista.size()-1 ; i++){
            //out.println("");
            out.println("<b>Identificação: </b> "  + lista.get(i).getID() + "<br>");
            out.println("<b>Nome: </b> "  + lista.get(i).getNome() + "<br>");
            out.println("<b>E-mail </b> "  + lista.get(i).getEmail() + "<br>");
            out.println("<b>Resposta 1: </b> "  + lista.get(i).getQ1() + "<br>");
            out.println("<b>Resposta 2: </b> "  + lista.get(i).getQ2() + "<br>");
            out.println("<b>Resposta 3: </b> "  + lista.get(i).getQ3() + "<br>");
            out.println("<b>Resposta 4: </b> "  + lista.get(i).getQ4() + "<br>");
            out.println("<b>Resposta 5: </b> "  + lista.get(i).getQ5() + "<br><br>");    
            n_reg++;
        }
        %>
    </body>
</html>

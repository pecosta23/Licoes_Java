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
        <h3>Pesquisa - Consulta Geral (Lista / Linhas)</h3>
        <%              
        //Consulta
        PesquisaDAO pesqDAO = new PesquisaDAO();
         
        List<Pesquisa> lista = new ArrayList<>();
        lista = pesqDAO.consPesqLista();

        int n_reg = 0 ;
        out.println("<br><br> <img src='../imagem/logo.jpg' alt=''/>");
        out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
            
        out.println("<br><br> # | Id. | Data | Data Update | Nome | e-mail <br>" );
        out.println("_____________________________________ <br>" );
        for( int i = 0; i <= lista.size()-1; i++){            
            out.println(i +" - "+ lista.get(i).getId() +" - "+ lista.get(i).getDt_pesq() +" - "+ lista.get(i).getDt_update()+" - "+ lista.get(i).getNome() +" - "+ lista.get(i).getEmail() +"<br>");                         
            n_reg++;                           
        }
       out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
       out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");        
        %>

    </body>
</html>

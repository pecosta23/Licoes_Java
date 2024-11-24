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
        <title>Consulta (Tabela)</title>
    </head>
    <body>
        <h3>Pesquisa - Consulta Geral (Tabela)</h3>
        <%              
        //Consulta
        PesquisaDAO pesqDAO = new PesquisaDAO();
         
        List<Pesquisa> lista = new ArrayList<>();
        lista = pesqDAO.consPesqLista();

        int n_reg = 0 ;
        out.println("<br><br> <img src='../imagem/logo.jpg' alt=''/>");
        out.println("<br> <b>Pesquisa de Satisfação - Registros</b>");
            
        %>      
        
        <!<!-- Cabeçalho -->
        <table border="1">
                <tr>
                    <th>#</th>
                    <th>Id.</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>R1</th>
                    <th>R2</th>
                    <th>R3</th>
                    <th>R4</th>
                    <th>Data</th>
                    <th>Data Update</th>
                </tr>                     
        <%
        for( int i = 0; i <= lista.size()-1; i++){            
        %>            
            <tr>
                    <td><%=i+1%></td>
                    <td><%=lista.get(i).getId()%></td>
                    <td><%=lista.get(i).getNome()%></td>
                    <td><%=lista.get(i).getEmail()%></td>
                    <td><%=lista.get(i).getQ1()%></td>
                    <td><%=lista.get(i).getQ2()%></td>
                    <td><%=lista.get(i).getQ3()%></td>
                    <td><%=lista.get(i).getQ4()%></td>
                    <td><%=lista.get(i).getDt_pesq()%></td>
                    <td><%=lista.get(i).getDt_update()%></td>
            </tr>
        <%
            n_reg++;                           
        }
        %>
        </table>
        <%
            out.println("<br><br> <b>Registros: </b>" + n_reg + "<br>");
            out.println("<br><br> <b> Legenda:</b> <br> <img src='../imagem/escala.jpg' alt=''/>");        
        %>

    </body>
</html>

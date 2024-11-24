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
        <h3>Pesquisa - Consulta (Identificação)</h3>
        <%
        //Entrada/Receber
        int id = Integer.parseInt( request.getParameter("id") );

        // Instância e atrib de valor
        Pesquisa pesq = new Pesquisa();
        pesq.setId(id);
       
        //Insert
        PesquisaDAO pesqDAO = new PesquisaDAO();
        if(pesqDAO.consPesqId(pesq) != null){
            //out.println("Registro encontrado!");
            out.println("<b>Identificação: </b>" + pesq.getId() + "<br>");
            out.println("<b>Nome: </b>" + pesq.getNome()+ "<br>");
            out.println("<b>E-mail: </b>" + pesq.getEmail()+ "<br>");  
            out.println("<b>Resp. 1: </b>" + pesq.getQ1()+ "<br>");            
            out.println("<b>Resp. 2: </b>" + pesq.getQ2()+ "<br>");            
            out.println("<b>Resp. 3: </b>" + pesq.getQ3()+ "<br>");            
            out.println("<b>Resp. 4: </b>" + pesq.getQ4()+ "<br>");            
            out.println("<b>Data: </b>" + pesq.getDt_pesq()+ "<br>");     
            out.println("<b>Data Update: </b>" + pesq.getDt_update()+ "<br>");   
        }else{
           out.println("Registro não encontrado!!!");
        }
        %>
    </body>
</html>

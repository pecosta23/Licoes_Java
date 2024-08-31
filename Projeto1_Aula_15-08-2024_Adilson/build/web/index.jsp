<%-- 
    Document   : index
    Created on : 15 de ago. de 2024, 20:10:01
    Author     : pedro
    App        : Teste Aula 2, dia 15-08-2024
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" import="java.lang.*, java.math.*, java.util.*, java.text.Annotation.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%-- Teste de novo comentário  --%>
        <h1>Hello World!</h1>
        <%
            
            int dia = Integer.parseInt((new SimpleDateFormat("dd")).format(new Date()));
            String mes = (new SimpleDateFormat("MMMM")).format(new Date());
            int ano = Integer.parseInt((new SimpleDateFormat("Y")).format(new Date()));
                       
            
            out.println("Hoje é dia " + dia + " de " + mes + " de " + ano + ".");
            
            
            
            %>
    </body>
</html>

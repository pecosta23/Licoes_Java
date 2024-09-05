<%-- 
    Document   : Senos
    Created on : 31 de ago. de 2024, 16:23:22
    Author     : pedro
--%>

<%@page contentType="text/html" import="java.util.*, java.text.*, java.lang.*" pageEncoding="UTF-8"%>
<%@page import="Dados.Senos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calcula Seno</title>
    </head>
    <body>
        <%
            //instancia do obj
            Senos Sen = new Senos();
            
            //atribuicao de valores
            Sen.setSen(Float.parseFloat(request.getParameter("sen")));
            
            //entrada
            //out.println("<br><b>O Seno do ângulo (Sen.CalcSen()) é: </b>" + Sen.getSen());
            out.println("<br><b>O Seno do ângulo é: </b>" + Sen.CalcSen(Sen.getSen()));
   
            
            %>
    </body>
</html>

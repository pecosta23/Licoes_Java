<%-- 
    Document   : Cadastro
    Created on : 15 de ago. de 2024, 21:05:38
    Author     : pedro
    Projeto    : Projeto de tipo Cadastro para servidor (post?)
--%>

<%@page contentType="text/html" import="java.lang.*, java.text.*, java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro</h1>
        <%
           //Entrada
           int id = Integer.parseInt(request.getParameter("id"));
           String equip = request.getParameter("eq");
           String marca = request.getParameter("mar");
           float valor = Float.parseFloat(request.getParameter("vr"));
           
           //Processamento - Regras de Negócio
           if (id == 12345){
                out.println("<br>Equipamento em Promoção "+id);
            }
            else{
                out.println("<br>Item com preço normal");
            }
           if (valor >= 500){
           out.println("<br>Equipamento normal<br>");
            }
            else{
           out.println("<br>Equipamento premium<br>");
            }
            
            
           //Saída
           out.println("<br><b>Identificador.......:</b>" + id);
           out.println("<br><b>Equipamento......:</b>" + equip);
           out.println("<br><b>Marca..................:</b>" + marca);
           out.println("<br><b>Valor....................:</b>" + valor);
            

          
        %>
        
    </body>
</html>

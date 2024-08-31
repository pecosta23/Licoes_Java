<%-- 
    Document   : Controle de produto
    Created on : 29 de ago. de 2024, 20:18:00
    Author     : Pedro Costa
    
--%>

<%@page contentType="text/html" import="java.util.*, java.text.*, java.lang.*" pageEncoding="UTF-8"%>
<%@page import="Dados.Produtos"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Produtos</title>
    </head>
    <body>
        <h1>Produtos</h1>
        
        <%
            //instancia do obj 
            Produtos prod = new Produtos();
            
            //atribuicao de valores
            prod.setId(Integer.parseInt(request.getParameter("id")));
            prod.setNome(request.getParameter("pr"));
            prod.setValor(Float.parseFloat(request.getParameter("vr")));
            prod.setValor(Float.parseFloat(request.getParameter("vr2")));
            
            out.println("<br><b>Identificador: </b>" + prod.getId());
            out.println("<br><b>Nome: </b>" + prod.getNome());
            //out.println("<br><b>Mensalidade: </b>" + prod.getValor());
            out.println("<br><b>Promoção, desconto: </b>" + prod.calcDesc(prod.getValor()));
            out.println("<br><b>Valor total com desconto: </b>" + (prod.getValor()-prod.calcDesc(prod.getValor())));
           
            out.println("<br><b>Promoção, desconto: </b>" + prod.calcDesc20(prod.getValor2()));
            out.println("<br><b>Valor total com desconto: </b>" + (prod.getValor()-prod.calcDesc20(prod.getValor2())));
           

        %>
    </body>
</html>

<%-- 
    Document   : Paciente
    Created on : 22 de ago. de 2024, 20:25:01
    Author     : Pedro Costa
    programa    : Controla de Pacientes
--%>

<%@page contentType="text/html" import="java.text.*, java.lang.*, java.util.*" pageEncoding="UTF-8"%>
<%@page import="Dados.Pacientes"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pacientes</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <%
            //instancia do obj
            Pacientes pac = new Pacientes();
            
            //entrada
            pac.setId(Integer.parseInt(request.getParameter("id")));
            pac.setNome(request.getParameter("nome"));
            pac.setMensal(Float.parseFloat(request.getParameter("men")));
            //process
            float parcela = pac.getMensal()/ 2;


            //saida
            out.println("<br><b>Identificador: </b>" + pac.getId());
            out.println("<br><b>Nome: </b>" + pac.getNome());
            out.println("<br><b>Mensalidade: </b>" + pac.getMensal());
            out.println("<br><b>Mensalidade com 50% de desconto: </b>" + parcela);
         %>
    </body>
</html>

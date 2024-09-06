<%-- 
    Document   : controle de funcionarios
    Created on : 5 de set. de 2024, 20:02:25
    Author     : pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*, java.lang.*" %>
<%@page import="dados.Funcionarios" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Funcionários</title>
    </head>
    <body>
        <h1>Funcionários</h1>
        <%    
        //instanciar obj
        Funcionarios func = new Funcionarios();
        
        //atribuicao de valor
        func.setId(Integer.parseInt(request.getParameter("id")));
        func.setNome(request.getParameter("nom"));
        func.setSalar(Float.parseFloat(request.getParameter("sal")));
        //func.setNasc(new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("nasc")));
        func.setNasc(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("nasc")));
 
        //saida
        out.println("<br><b>Identificador.: </b>" + func.getId());
        out.println("<br><b>Nome.............: </b>" + func.getNome());
        out.println("<br><b>Salário...........: </b>" + func.getSalar());
        out.println("<br><b>Nascimento...: </b>" + new SimpleDateFormat("yyyy-MM-dd").format(func.getNasc()));
        out.println("<br><b>Um terço de férias...: </b>" + func.calcFerias(func.getSalar()));
        %>
    </body>
</html>

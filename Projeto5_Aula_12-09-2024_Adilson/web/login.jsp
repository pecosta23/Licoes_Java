<%-- 
    Document   : login
    Created on : 19 de set. de 2024, 21:16:37
    Author     : pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "control.ControleUsuario"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login loja</title>
    </head>
    <body>
        <h1>Login</h1>
        <%
            String login = request.getParameter("login");
            String password = request.getParameter("pw");
                  
            ControleUsuario ctrlUsu = new ControleUsuario();
            if (ctrlUsu.logar (login, password)){
                out.println("Acesso permitido! " + login);
            }else{
                out.println("Acesso <b>negado</b>");
            }
        %>
    </body>
</html>

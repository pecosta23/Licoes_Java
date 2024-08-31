<%-- 
    Document   : programa de acesso
    Created on : 22 de ago. de 2024, 19:43:01
    Author     : pedro
    Programa   : acesso adilson dia 22/08/2024
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Acesso</title>
    </head>
    <body>
        <h1>Login</h1>
        
        <% 
            //entrada           
            String user = request.getParameter("login");
            String password = request.getParameter("pw");
            
            //decisao
            //if (user == "admin"){ n funciona
            if (user.equals("admin") && password.equals("1234")){
                out.println("acesso liberado");
            }else
            {
                out.println("acesso negado");
            }
            
            //saida
            
        
        
        
        
        %>
    </body>
</html>

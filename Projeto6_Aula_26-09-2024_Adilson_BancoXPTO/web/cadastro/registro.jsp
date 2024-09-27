<%-- 
    Document   : registro
    Created on : 26 de set. de 2024, 21:19:15
    Author     : pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
    </head>
    <body>
        <h1>Registrar</h1>
        <%
            //entrada
            String login = request.getParameter("login");
            String fone = request.getParameter("fone");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
            
            //instanciar
            Usuario usu = new Usuario();
            usu.setLogin(login);
            usu.setLogin(fone);
            usu.setLogin(email);
            usu.setLogin(senha);
            
            UsuarioDAO usuDAO = new UsuarioDAO();
            
            if(usuDAO.insUsu(usu)){
                out.println("Login realizado com sucesso");
            }else{ 
                out.println("Erro, usuário não cadastrado");
            }
        %>
    </body>
</html>

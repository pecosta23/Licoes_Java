<%-- 
    Document   : cadastro
    Created on : 20 de out. de 2024, 13:36:18
    Author     : pedro
--%>

<%@page import="model.dao.dadosDao"%>
<%@page import="model.dados"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background-color: white; /* Fundo branco */
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                font-family: Arial, sans-serif;
                text-align: center; /* Centraliza o texto */
            }
            .message {
                background: radial-gradient(circle at 30% 30%, #ffcc80, #9575cd, #3e2723); /* Gradiente similar ao anterior */
                padding: 20px;
                border-radius: 10px;
                color: white; /* Cor do texto */
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2); /* Sombra */
            }
        </style>
    </head>
    <body>
        <div class="message">
            <h2>Mensagem:</h2>
            <%
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String nasc = request.getParameter("nasc");
        
                dados dados = new dados();
                dados.setNome(nome);
                dados.setEmail(email);
                dados.setNasc(nasc);
                
                dadosDao dadosDao = new dadosDao();
                if(dadosDao.Cadastro(dados)){
                    out.println("Dados inseridos com sucesso");
                } else {
                    out.println("Erro no cadastro");
                }
            %>
        </div>
    </body>
</html>

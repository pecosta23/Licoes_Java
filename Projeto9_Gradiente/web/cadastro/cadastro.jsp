<%-- 
    Document   : cadastro
    Created on : 20 de out. de 2024, 13:36:18
    Author     : pedro
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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
                width: 300px; /* Tamanho da esfera */
                height: 300px; /* Tamanho da esfera */
                background: radial-gradient(circle at 30% 30%, #ffcc80, #9575cd, #3e2723); /* Gradiente inicial */
                padding: 20px;
                border-radius: 50%;
                display: flex;
                justify-content: center; /* Centraliza o texto horizontalmente */
                align-items: center;  /* Centraliza o texto verticalmente */
                color: white; /* Cor do texto */
                text-align: center;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2), inset 0 0 50px rgba(255, 255, 255, 0.1); /* Sombra externa e brilho interno */
                animation: animateGradient 10s ease infinite; /* Adiciona a animação ao gradiente */
                background-size: 200% 200%;       
            }

            /* Animação para o gradiente de fundo */
            @keyframes animateGradient {
                0% {
                    background-position: 0% 50%;
                }
                50% {
                    background-position: 100% 50%;
                }
                100% {
                    background-position: 0% 50%;
                }
            }
        </style>
    </head>
    <body>
        <div class="message">
            <%
                String nome = request.getParameter("nome");
                String email = request.getParameter("email");
                String nascStr = request.getParameter("nasc");//obtem como String
        
                //de str para localdate
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
                LocalDateTime nasc = LocalDateTime.parse(nascStr, formatter);
                
                //obj dos dados, definição de atr
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

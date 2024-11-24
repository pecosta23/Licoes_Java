<%-- 
    Document   : verPendencias
    Created on : 16 de nov. de 2024, 18:54:37
    Author     : pedro
--%>

<%@page import="model.Info"%>
<%@page import="model.dao.InfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< HEAD
        <title>Consultando pendências</title>
=======
        <title>JSP Page</title>
>>>>>>> 52af563aa8ed40b8e3c6c54e35b11c2e381873d3
    </head>
    <body>
        <h1>Resposta do Servidor:</h1>
        <%
            //armazena os catch do método VerPendencia
            //só tive que criar o jsp pra pegar o ID e um try catch de NumberFormat, mais nada
            //oq tb n aconteceria pq deixei o html pra receber number só, mas é isso aí
            String mensagem = "";
            try {
                //Pega o ID do form
                int ID = Integer.parseInt(request.getParameter("ID"));

                //instanciando classe
                InfoDAO infoDAO = new InfoDAO();

                //Chama o método
                mensagem = infoDAO.verPendencia(ID);
            } catch (NumberFormatException e) {
                mensagem = "ID inválido. Por favor, insira um número.";
            } catch (Exception e) {
                mensagem = "Erro ao verificar pendências.";
                e.printStackTrace();
            }
        %>
            <!-- Exibe o resultado -->
            <p>Status do Aluno: <b><%= mensagem %></b></p>
            <p><a href="../index.html">Retorno</a></p>
    </body>
</html>

<%@page import="model.Info"%>
<%@page import="model.dao.InfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Aluno</title>
        <style>
            body {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                margin: 0;
                font-family: 'Arial', sans-serif;
                height: 100vh;
                background-color: #1d1d1b;
                color: #DADA79;
            }

            h1 {
                font-size: 24px;
                font-weight: 600;
                margin-bottom: 20px;
                color: #DADA79;
            }

            p {
                font-size: 18px;
                color: #ccc;
                margin-bottom: 20px;
            }

            b {
                color: #DADA79;
            }

            a {
                text-decoration: none;
                color: #1d1d1b;
                background-color: #DADA79;
                padding: 10px 20px;
                border-radius: 5px;
                transition: background-color 0.3s, color 0.3s;
            }

            a:hover {
                background-color: #ccc;
                color: #1d1d1b;
            }
        </style>
    </head>
    <body>
        <h1>Resposta do Servidor:</h1>
        <%
            String mensagem = "";
            try {
                int ID = Integer.parseInt(request.getParameter("ID"));

                Info info = new Info();
                info.setID(ID);
                InfoDAO infoDAO = new InfoDAO();

                if (infoDAO.ExAlu(info)) {
                    mensagem = "Aluno excluído com sucesso!";
                } else {
                    mensagem = "Erro, o registro não pode ser excluído.";
                }
            } catch (NumberFormatException e) {
                mensagem = "ID inválido. Por favor, insira um número.";
            } catch (Exception e) {
                mensagem = "Erro ao tentar excluir o aluno.";
                e.printStackTrace();
            }
        %>
        <p>Status da Operação: <b><%= mensagem %></b></p>
        <p><a href="../index.html">Retorno</a></p>
    </body>
</html>
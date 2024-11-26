<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>

<%@page import="model.Info"%>
<%@page import="model.dao.InfoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alunos matriculados</title>
    <style>
        body {
            display: flex;
            margin: 0;
            font-family: 'Arial', sans-serif;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #2f2f2f;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            box-sizing: border-box;
        }

        .logo-img {
            width: 150px;
            margin: 40px 0;
        }

        .sidebar nav {
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;
        }

        .sidebar nav a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #ddd;
            padding: 10px 15px;
            margin-top: 20px;
            background-color: #3a3a3a;
            border-radius: 5px;
            transition: background-color 0.3s;
            width: 80%;
            height: 30px;
            font-size: 14px;
            text-align: left;
        }

        .sidebar nav a img.nav-icon {
            width: 16px;
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
        }

        .sidebar nav a:hover {
            background-color: #4a4a4a;
        }

        .sidebar nav a.active-link {
            background-color: #DADA79;
            color: #1d1d1b;
            font-weight: bold;
        }

        .main-content {
            flex-grow: 1;
            background-color: #1d1d1b;
            padding: 40px;
            color: #fff;
            overflow-y: auto;
        }

        h3 {
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            color: #DADA79;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        th {
            background-color: #d7d67b;
            color: #1d1d1b;
            font-weight: bold;
        }

        a {
            color: #d7d67b;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <img src="logo.png" alt="Logo Coliseu" class="logo-img">
        <nav>
            <a href="../matAlu/indexMat.html"><img src="Vector-3.png" alt="Matrícula" class="nav-icon"> Faça uma matrícula</a>
            <a href="../mostraAlu/mostraDados.jsp"><img src="Vector-2.png" alt="Alunos" class="nav-icon"> Alunos matriculados</a> 
            <a href="../pendAlu/indexPendAlu.html"><img src="Vector-1.png" alt="Pendências" class="nav-icon"> Pendências</a> 
            <a href="../ExAlu/indexExAlu.html"><img src="Vector.png" alt="Excluir" class="nav-icon"> Exclua um registro</a>
            <a href="../attPendAlu/AttAlu.html"><img src="Vector-4.png" alt="Alterar" class="nav-icon"> Altere um registro</a>
        </nav>
    </div>
    <div class="main-content">
        <h3>Matrículas dos Alunos Atuais</h3>
        <%
            // Instanciando a classe
            InfoDAO infoDAO = new InfoDAO();
            // Fazendo o array
            List<Info> lista = infoDAO.TodosDados();
            int index = 0;
        %>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nome Completo</th>
                    <th>Data de Nascimento</th>
                    <th>Sexo</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Endereço</th>
                    <th>Telefone</th>
                    <th>E-mail</th>
                    <th>Histórico Médico</th>
                    <th>Alergias</th>
                    <th>Uso de Medicamento</th>
                    <th>Escolha do Plano</th>
                    <th>Forma de Pagamento</th>
                    <th>Dados Bancários</th>
                </tr>
            </thead>
            <tbody>
                <% for(int x = 0; x < lista.size(); x++) { %>
                    <tr>
                        <td><%= x %></td>
                        <td><%= lista.get(x).getID() %></td>
                        <td><%= lista.get(x).getNomeCompleto() %></td>
                        <td><%= lista.get(x).getDataNascimento() %></td>
                        <td><%= lista.get(x).getSexo() %></td>
                        <td><%= lista.get(x).getCpf() %></td>
                        <td><%= lista.get(x).getRg() %></td>
                        <td><%= lista.get(x).getEndereco() %></td>
                        <td><%= lista.get(x).getTelefoneContato() %></td>
                        <td><%= lista.get(x).getEmail() %></td>
                        <td><%= lista.get(x).getHistoricoMedico() %></td>
                        <td><%= lista.get(x).getAlergias() %></td>
                        <td><%= lista.get(x).getUsoMedicamento() %></td>
                        <td><%= lista.get(x).getEscolhaPlano() %></td>
                        <td><%= lista.get(x).getFormaPagamento() %></td>
                        <td><%= lista.get(x).getDadosBancarios() %></td>
                    </tr>
                    <% index++; %>
                <% } %>
            </tbody>
        </table>
        <p><b>Quantidade de alunos atuais: </b><%= index %></p>
        <p><a href="../index.html">Retorno</a></p>
    </div>
</body>
</html>
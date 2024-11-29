<%@ page import="model.dao.InfoDAO" %>
<%@ page import="model.Info" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Matrícula</title>
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
        <h1>Resposta do servidor:</h1>
        <%
            // Capturando os dados do form
            String nome_completo = request.getParameter("nome_completo");
            String data_nascimento = request.getParameter("data_nascimento");
            String sexo = request.getParameter("sexo");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String endereco = request.getParameter("endereco");
            String telefone_contato = request.getParameter("telefone_contato");
            String email = request.getParameter("email");
            String estado_civil = request.getParameter("estado_civil");
            String historico_medico = request.getParameter("historico_medico");
            String alergias = request.getParameter("alergias");
            String uso_medicamentos = request.getParameter("uso_medicamento");
            String exame_medico = request.getParameter("exame_medico");
            String escolha_plano = request.getParameter("escolha_plano");
            String forma_pagamento = request.getParameter("forma_pagamento");
            String dados_bancarios = request.getParameter("dados_bancarios");
            String resp_legal = request.getParameter("resp_legal");
            String assinatura_termo_condicoes = request.getParameter("assinatura_termo_condicoes");
            String assinatura_contrato_servicos = request.getParameter("assinatura_contrato_servicos");
            String assinatura_termo_responsabilidade = request.getParameter("assinatura_termo_responsabilidade");

            // Criando objeto
            Info dados = new Info();
            dados.setNomeCompleto(nome_completo);
            dados.setDataNascimento(data_nascimento);
            dados.setSexo(sexo);
            dados.setCpf(cpf);
            dados.setRg(rg);
            dados.setEndereco(endereco);
            dados.setTelefoneContato(telefone_contato);
            dados.setEmail(email);
            dados.setEstadoCivil(estado_civil);
            dados.setHistoricoMedico(historico_medico);
            dados.setAlergias(alergias);
            dados.setUsoMedicamento(uso_medicamentos);
            dados.setExameMedico(Integer.parseInt(exame_medico));
            dados.setEscolhaPlano(escolha_plano);
            dados.setFormaPagamento(forma_pagamento);
            dados.setDadosBancarios(dados_bancarios);
            dados.setRespLegal(Integer.parseInt(resp_legal));
            dados.setAssinaturaTermoCondicoes(Integer.parseInt(assinatura_termo_condicoes));
            dados.setAssinaturaContratoServicos(Integer.parseInt(assinatura_contrato_servicos));
            dados.setAssinaturaTermoResponsabilidade(Integer.parseInt(assinatura_termo_responsabilidade));

            //Inserindo
            InfoDAO infoDAO = new InfoDAO();
            if (infoDAO.Maior18(data_nascimento)){               
                boolean sucesso = infoDAO.InserirAlu(dados);
                if (sucesso) {
                    out.println("<p>A matrícula do aluno foi realizada com sucesso!</p>");
                } else {
                    out.println("<p>Erro ao inserir os dados de matrícula.</p>");
                }
            } else {
                //Menor de idade
                out.println("<p>Erro, aluno <b>menor</b> de 18 anos. Verifique os dados de matrícula.</p>");
            }
        %> 
        <p><a href="../index.html">Retorno</a></p>
    </body>
</html>
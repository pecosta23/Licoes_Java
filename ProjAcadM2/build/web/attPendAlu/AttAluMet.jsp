<%-- 
    Document   : AttPendAlu
    Created on : 22 de nov. de 2024, 21:20:30
    Author     : pedro
--%>

<%@page import="model.dao.InfoDAO"%>
<%@page import="model.Info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualiza Infos. Alu</title>
    </head>
    <body>
        <h1>Resposta do Servidor:</h1>
        <%
            //entrada, parametros a receber
            int ID = Integer.parseInt(request.getParameter("id"));
            String nomeCompleto = request.getParameter("nome_completo");
            String dataNascimento = request.getParameter("data_nascimento");
            String sexo = request.getParameter("sexo");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String endereco = request.getParameter("endereco");
            String telefoneContato = request.getParameter("telefone_contato");
            String email = request.getParameter("email");
            String estadoCivil = request.getParameter("estado_civil");
            String historicoMedico = request.getParameter("historico_medico");
            String alergias = request.getParameter("alergias");
            String usoMedicamento = request.getParameter("uso_medicamento");
            int exameMedico = Integer.parseInt(request.getParameter("exame_medico"));
            String escolhaPlano = request.getParameter("escolha_plano");
            String formaPagamento = request.getParameter("forma_pagamento");
            String dadosBancarios = request.getParameter("dados_bancarios");
            int respLegal = Integer.parseInt(request.getParameter("resp_legal"));
            int assinaturaTermoCondicoes = Integer.parseInt(request.getParameter("assinatura_termo_condicoes"));
            int assinaturaContratoServicos = Integer.parseInt(request.getParameter("assinatura_contrato_servicos"));
            int assinaturaTermoResponsabilidade = Integer.parseInt(request.getParameter("assinatura_termo_responsabilidade"));

            //instanciando o obj e atribuindo o valor correspondente de cada camnpo
            Info dados = new Info();
            dados.setID(ID);
            dados.setNomeCompleto(nomeCompleto);
            dados.setDataNascimento(dataNascimento);
            dados.setSexo(sexo);
            dados.setCpf(cpf);
            dados.setRg(rg);
            dados.setEndereco(endereco);
            dados.setTelefoneContato(telefoneContato);
            dados.setEmail(email);
            dados.setEstadoCivil(estadoCivil);
            dados.setHistoricoMedico(historicoMedico);
            dados.setAlergias(alergias);
            dados.setUsoMedicamento(usoMedicamento);
            dados.setExameMedico(exameMedico);
            dados.setEscolhaPlano(escolhaPlano);
            dados.setFormaPagamento(formaPagamento);
            dados.setDadosBancarios(dadosBancarios);
            dados.setRespLegal(respLegal);
            dados.setAssinaturaTermoCondicoes(assinaturaTermoCondicoes);
            dados.setAssinaturaContratoServicos(assinaturaContratoServicos);
            dados.setAssinaturaTermoResponsabilidade(assinaturaTermoResponsabilidade);
            
            //atulizando dados 
            InfoDAO infoDAO = new InfoDAO();
            if(infoDAO.AtualizarAlu(dados)){
                out.println("Informações atualizadas com sucesso!");
            }else{
                out.println("Erro, as alterações não foram salvas");
            }         
        %>
        <p><a href="../index.html">Retorno</a>
    </body>
</html>

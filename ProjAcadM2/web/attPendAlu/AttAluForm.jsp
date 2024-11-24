<%-- 
    Document   : AttPendAluForm
    Created on : 22 de nov. de 2024, 21:37:37
    Author     : pedro
--%>

<%@page import="model.dao.InfoDAO"%>
<%@page import="model.Info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizando dados</title>
    </head>
    <body>
        <h1>Atualização de informações pessoais</h1>
        <%
        //entrada, parametros a receber
        int ID = Integer.parseInt(request.getParameter("ID"));

        //Instancia e atribuicao de valor
        Info info = new Info();
        info.setID(ID);
       
        //Insert
        InfoDAO infoDAO = new InfoDAO();
        if(infoDAO.consDadosPorId(info) != null){
            out.println("Registro encontrado! Atualize as informações"); 
        %>
        <form name="formMatricula" action="AttAluMet.jsp" method="POST">
            <br><!-- Dados pessoais -->
                Identificador: <input type="text" name="id" value="<%=info.getID()%>" readonly="true"> <p>
                <%--//Identificador: <input type="text" name="id" value="<%=info.getID()%>"> <p>--%>
                <label for="nome_completo">Nome Completo:</label>
                <input type="text" id="nome_completo" name="nome_completo" value="<%= info.getNomeCompleto() %>" required><br><br>

                <label for="data_nascimento">Data de Nascimento:</label>
                <input type="date" id="data_nascimento" name="data_nascimento" value="<%= info.getDataNascimento() %>" required><br><br>

                <label for="sexo">Sexo:</label>
                <select id="sexo" name="sexo" required>
                    <option value="Masculino" <%= info.getSexo().equals("Masculino") ? "selected" : "" %>>Masculino</option>
                    <option value="Feminino" <%= info.getSexo().equals("Feminino") ? "selected" : "" %>>Feminino</option>
                    <option value="Outro" <%= info.getSexo().equals("Outro") ? "selected" : "" %>>Outro</option>
                </select><br><br>

                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" value="<%= info.getCpf()%>" required><br><br>

                <label for="rg">RG:</label>
                <input type="text" id="rg" name="rg" value="<%= info.getRg() %>" required><br><br>

                <label for="endereco">Endereço:</label>
                <input type="text" id="endereco" name="endereco" value="<%= info.getEndereco() %>" required><br><br>

                <label for="telefone_contato">Telefone de Contato:</label>
                <input type="tel" id="telefone_contato" name="telefone_contato" value="<%= info.getTelefoneContato() %>" required><br><br>

                <label for="email">E-mail:</label>
                <input type="email" id="email" name="email" value="<%= info.getEmail() %>" required><br><br>

                <label for="estado_civil">Estado Civil:</label>
                <select id="estado_civil" name="estado_civil" required>
                    <option value="Solteiro" <%= info.getEstadoCivil().equals("Solteiro") ? "selected" : "" %>>Solteiro</option>
                    <option value="Casado" <%= info.getEstadoCivil().equals("Casado") ? "selected" : "" %>>Casado</option>
                    <option value="Divorciado" <%= info.getEstadoCivil().equals("Divorciado") ? "selected" : "" %>>Divorciado</option>
                    <option value="Viúvo" <%= info.getEstadoCivil().equals("Viúvo") ? "selected" : "" %>>Viúvo</option>
                </select><br><br>

                <!-- Histórico médico -->
                <label for="historico_medico">Histórico Médico:</label><br>
                <textarea id="historico_medico" name="historico_medico" required><%= info.getHistoricoMedico() %></textarea><br><br>

                <label for="alergias">Alergias:</label><br>
                <textarea id="alergias" name="alergias" required><%= info.getAlergias() %></textarea><br><br>

                <label for="uso_medicamento">Uso de Medicamentos:</label><br>
                <textarea id="uso_medicamento" name="uso_medicamento" required><%= info.getUsoMedicamento() %></textarea><br><br>

                <label for="exame_medico">Exame Médico:</label><br>
                <input type="radio" id="exame_sim" name="exame_medico" value="1" <%= info.getExameMedico() == 1 ? "checked" : "" %>>
                <label for="exame_sim">Sim</label>
                <input type="radio" id="exame_nao" name="exame_medico" value="0" <%= info.getExameMedico() == 0 ? "checked" : "" %>>
                <label for="exame_nao">Não</label><br><br>

                <!-- Plano -->
                <label for="escolha_plano">Escolha o Plano:</label>
                <select id="escolha_plano" name="escolha_plano" required>
                    <option value="Plano Básico" <%= info.getEscolhaPlano().equals("Plano Básico") ? "selected" : "" %>>Plano Básico</option>
                    <option value="Plano Premium" <%= info.getEscolhaPlano().equals("Plano Premium") ? "selected" : "" %>>Plano Premium</option>
                    <option value="Plano VIP" <%= info.getEscolhaPlano().equals("Plano VIP") ? "selected" : "" %>>Plano VIP</option>
                </select><br><br>

                <label for="forma_pagamento">Forma de Pagamento:</label>
                <select id="forma_pagamento" name="forma_pagamento" required>
                    <option value="Cartão de Crédito" <%= info.getFormaPagamento().equals("Cartão de Crédito") ? "selected" : "" %>>Cartão de Crédito</option>
                    <option value="Boleto" <%= info.getFormaPagamento().equals("Boleto") ? "selected" : "" %>>Boleto</option>
                    <option value="Transferência Bancária" <%= info.getFormaPagamento().equals("Transferência Bancária") ? "selected" : "" %>>Transferência Bancária</option>
                </select><br><br>

                <label for="dados_bancarios">Dados Bancários:</label><br>
                <textarea id="dados_bancarios" name="dados_bancarios" required><%= info.getDadosBancarios() %></textarea><br><br>

                <label for="resp_legal">Responsável Legal:</label><br>
                <input type="radio" id="resp_sim" name="resp_legal" value="1" <%= info.getRespLegal() == 1 ? "checked" : "" %>>
                <label for="resp_sim">Sim</label>
                <input type="radio" id="resp_nao" name="resp_legal" value="0" <%= info.getRespLegal() == 0 ? "checked" : "" %>>
                <label for="resp_nao">Não</label><br><br>

                <!-- Assinaturas -->
                <label for="assinatura_termo_condicoes">Assinatura dos Termos e Condições:</label><br>
                <input type="radio" id="termo_sim" name="assinatura_termo_condicoes" value="1" <%= info.getAssinaturaTermoCondicoes() == 1 ? "checked" : "" %>>
                <label for="termo_sim">Sim</label>
                <input type="radio" id="termo_nao" name="assinatura_termo_condicoes" value="0" <%= info.getAssinaturaTermoCondicoes() == 0 ? "checked" : "" %>>
                <label for="termo_nao">Não</label><br><br>

                <label for="assinatura_contrato_servicos">Assinatura do Contrato de Serviços:</label><br>
                <input type="radio" id="contrato_sim" name="assinatura_contrato_servicos" value="1" <%= info.getAssinaturaContratoServicos() == 1 ? "checked" : "" %>>
                <label for="contrato_sim">Sim</label>
                <input type="radio" id="contrato_nao" name="assinatura_contrato_servicos" value="0" <%= info.getAssinaturaContratoServicos() == 0 ? "checked" : "" %>>
                <label for="contrato_nao">Não</label><br><br>

                <label for="assinatura_termo_responsabilidade">Assinatura do Termo de Responsabilidade:</label><br>
                <input type="radio" id="responsabilidade_sim" name="assinatura_termo_responsabilidade" value="1" <%= info.getAssinaturaTermoResponsabilidade() == 1 ? "checked" : "" %>>
                <label for="responsabilidade_sim">Sim</label>
                <input type="radio" id="responsabilidade_nao" name="assinatura_termo_responsabilidade" value="0" <%= info.getAssinaturaTermoResponsabilidade() == 0 ? "checked" : "" %>>
                <label for="responsabilidade_nao">Não</label><br><br>

                <!-- Botões -->
                <button type="reset">Limpar</button>
                <button type="submit">Registrar</button>
            </form>
        <%       
        }else{
           out.println("Erro ao atualizar informações!");
        }
        %>    
    </body>
</html>

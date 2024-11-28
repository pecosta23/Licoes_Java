<%@page import="model.dao.InfoDAO"%>
<%@page import="model.Info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atualizando dados</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <!--<h1>Atualização de informações pessoais</h1>-->
        <%
        int ID = Integer.parseInt(request.getParameter("ID"));
        Info info = new Info();
        info.setID(ID);

        InfoDAO infoDAO = new InfoDAO();
        if(infoDAO.consDadosPorId(info) != null){
            //out.println("Registro encontrado! Atualize as informações"); 
        %>
    <div class="main-content">
        <h2>Formulário de Atualização</h2>
        <div class="steps">
            <span id="step-1" class="step active">1. Dados pessoais</span>
            <span id="step-2" class="step">2. Histórico médico</span>
            <span id="step-3" class="step">3. Plano</span>
            <span id="step-4" class="step">4. Termos de responsabilidade</span>
            <span id="step-5" class="step">5. Assinaturas</span>
        </div>
            <form name="formAttAlu" action="AttAluMet.jsp" method="POST">
            <!-- Dados pessoais -->
            <label  for="id">Identificador:</label>
            <input type="text" id="id" name="id" value="<%= info.getID() %>" readonly="true"><br>

            <label for="nome_completo">Nome Completo:</label>
            <input type="text" id="nome_completo" name="nome_completo" value="<%= info.getNomeCompleto() %>" maxlength="100" required><br>

            <label for="data_nascimento">Data de Nascimento:</label>
            <input type="date" id="data_nascimento" name="data_nascimento" value="<%= info.getDataNascimento() %>" required><br>

            <label for="sexo">Sexo:</label>
            <select id="sexo" name="sexo" required>
                <option value="Masculino" <%= "Masculino".equals(info.getSexo()) ? "selected" : "" %>>Masculino</option>
                <option value="Feminino" <%= "Feminino".equals(info.getSexo()) ? "selected" : "" %>>Feminino</option>
                <option value="Outro" <%= "Outro".equals(info.getSexo()) ? "selected" : "" %>>Outro</option>
            </select><br>

            <label for="cpf">CPF:</label>
            <input type="text" id="cpf" name="cpf" value="<%= info.getCpf() %>" maxlength="11" required><br>

            <label for="rg">RG:</label>
            <input type="text" id="rg" name="rg" value="<%= info.getRg() %>" maxlength="9" required><br>

            <label for="endereco">Endereço:</label>
            <input type="text" id="endereco" name="endereco" value="<%= info.getEndereco() %>" maxlength="200" required><br>

            <label for="telefone_contato">Telefone de Contato:</label>
            <input type="tel" id="telefone_contato" name="telefone_contato" value="<%= info.getTelefoneContato() %>" maxlength="11" required><br>

            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" value="<%= info.getEmail() %>" maxlength="90" required><br>

            <label for="estado_civil">Estado Civil:</label>
            <select id="estado_civil" name="estado_civil" required>
                <option value="Solteiro" <%= "Solteiro".equals(info.getEstadoCivil()) ? "selected" : "" %>>Solteiro</option>
                <option value="Casado" <%= "Casado".equals(info.getEstadoCivil()) ? "selected" : "" %>>Casado</option>
                <option value="Divorciado" <%= "Divorciado".equals(info.getEstadoCivil()) ? "selected" : "" %>>Divorciado</option>
                <option value="Viúvo" <%= "Viúvo".equals(info.getEstadoCivil()) ? "selected" : "" %>>Viúvo</option>
            </select><br>

            <!-- Histórico médico -->
            <label for="historico_medico">Histórico Médico:</label><br>
            <textarea id="historico_medico" name="historico_medico" maxlength="110" required><%= info.getHistoricoMedico() %></textarea><br>

            <label for="alergias">Alergias:</label><br>
            <textarea id="alergias" name="alergias" maxlength="110" required><%= info.getAlergias() %></textarea><br><br>

            <label for="uso_medicamento">Uso de Medicamentos:</label><br>
            <textarea id="uso_medicamento" name="uso_medicamento" maxlength="110" required><%= info.getUsoMedicamento() %></textarea><br>

            <label for="exame_medico">Exame Médico:</label><br>
            <input type="radio" id="exame_sim" name="exame_medico" value="1" <%= info.getExameMedico() == 1 ? "checked" : "" %>>
            <label for="exame_sim">Sim</label>
            <input type="radio" id="exame_nao" name="exame_medico" value="0" <%= info.getExameMedico() == 0 ? "checked" : "" %>>
            <label for="exame_nao">Não</label><br>

            <!-- Plano -->
            <label for="escolha_plano">Escolha o Plano:</label>
            <select id="escolha_plano" name="escolha_plano" required>
                <option value="Plano Básico" <%= "Plano Básico".equals(info.getEscolhaPlano()) ? "selected" : "" %>>Plano Básico</option>
                <option value="Plano Premium" <%= "Plano Premium".equals(info.getEscolhaPlano()) ? "selected" : "" %>>Plano Premium</option>
                <option value="Plano VIP" <%= "Plano VIP".equals(info.getEscolhaPlano()) ? "selected" : "" %>>Plano VIP</option>
            </select><br>

            <label for="forma_pagamento">Forma de Pagamento:</label>
            <select id="forma_pagamento" name="forma_pagamento" required>
                <option value="Cartão de Crédito" <%= "Cartão de Crédito".equals(info.getFormaPagamento()) ? "selected" : "" %>>Cartão de Crédito</option>
                <option value="Boleto" <%= "Boleto".equals(info.getFormaPagamento()) ? "selected" : "" %>>Boleto</option>
                <option value="Transferência Bancária" <%= "Transferência Bancária".equals(info.getFormaPagamento()) ? "selected" : "" %>>Transferência Bancária</option>
            </select><br>

            <label for="dados_bancarios">Dados Bancários:</label><br>
            <textarea id="dados_bancarios" name="dados_bancarios" maxlength="110" required><%= info.getDadosBancarios() %></textarea><br>

            <label for="resp_legal">Responsável Legal:</label><br>
            <input type="radio" id="resp_sim" name="resp_legal" value="1" <%= info.getRespLegal() == 1 ? "checked" : "" %>>
            <label for="resp_sim">Sim</label>
            <input type="radio" id="resp_nao" name="resp_legal" value="0" <%= info.getRespLegal() == 0 ? "checked" : "" %>>
            <label for="resp_nao">Não</label><br>

            <!-- Assinaturas -->
            <label for="assinatura_termo_condicoes">Assinatura dos Termos e Condições:</label><br>
            <input type="radio" id="termo_sim" name="assinatura_termo_condicoes" value="1" <%= info.getAssinaturaTermoCondicoes() == 1 ? "checked" : "" %>>
            <label for="termo_sim">Sim</label>
            <input type="radio" id="termo_nao" name="assinatura_termo_condicoes" value="0" <%= info.getAssinaturaTermoCondicoes() == 0 ? "checked" : "" %>>
            <label for="termo_nao">Não</label><br>

            <label for="assinatura_contrato_servicos">Assinatura do Contrato de Serviços:</label><br>
            <input type="radio" id="contrato_sim" name="assinatura_contrato_servicos" value="1" <%= info.getAssinaturaContratoServicos() == 1 ? "checked" : "" %>>
            <label for="contrato_sim">Sim</label>
            <input type="radio" id="contrato_nao" name="assinatura_contrato_servicos" value="0" <%= info.getAssinaturaContratoServicos() == 0 ? "checked" : "" %>>
            <label for="contrato_nao">Não</label><br>

            <label for="assinatura_termo_responsabilidade">Assinatura do Termo de Responsabilidade:</label><br>
            <input type="radio" id="responsabilidade_sim" name="assinatura_termo_responsabilidade" value="1" <%= info.getAssinaturaTermoResponsabilidade() == 1 ? "checked" : "" %>>
            <label for="responsabilidade_sim">Sim</label>
            <input type="radio" id="responsabilidade_nao" name="assinatura_termo_responsabilidade" value="0" <%= info.getAssinaturaTermoResponsabilidade() == 0 ? "checked" : "" %>>
            <label for="responsabilidade_nao">Não</label><br>

            <!-- Botões -->
            <button type="reset">Limpar</button>
            <button type="submit">Registrar</button>
        </form>

    </div>
        <%
        } else {
            out.println("Resposta do Servidor:");
            out.println("<br><br><b>Aluno não encontrado</b>");
        }
        %>
    </body>
</html>
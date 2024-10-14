<%-- 
    Document   : inscricao
    Created on : 6 de out. de 2024, 17:07:07
    Author     : pedro
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model1.Dados"%>
<%@page import="model.dao.DadosDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Entrada dos dados do form com as diversas classes e métodos do java -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscrição</title>
    </head>
    <body>
        <h1>Se inscreva hoje no sorteio</h1>
        <%
            //entrada dos dados 
            String nome = request.getParameter("nome");
            String CPF = request.getParameter("CPF");
            //Integer DDD = Integer.parseInt(request.getParameter("DDD"));
            //Integer num = Integer.parseInt(request.getParameter("num"));
            String DDD = request.getParameter("DDD");
            String num = request.getParameter("num");
            String email = request.getParameter("email");
            String dtNasc = request.getParameter("dtNasc");
            String endereco = request.getParameter("endereco");
            String checkNews = request.getParameter("checkNews");
                  
            //instanciando 
            Dados dados = new Dados();
            //atribuição de valor
            dados.setNome(nome);
            dados.setCPF(CPF);
            dados.setDDD(DDD);
            dados.setNum(num);
            dados.setEmail(email);
            dados.setDtNasc(dtNasc);
            dados.setEndereco(endereco);
            
            if(checkNews != null){
                dados.setCheckNews(true);
            }else{
                dados.setCheckNews(false);
            }
            
            DadosDAO dadosDAO = new DadosDAO();       
            //condição que verifica maioridade
            if (dadosDAO.Validar(dtNasc)) {
                //condição que leva ao metodo de inscrição da classe DAO
                //caso seja inserido com sucesso (if - ok), erro (else - not ok)
                if(dadosDAO.Inscricao(dados)){
                    out.println("Inscrição realizada com sucesso");
                }else{ 
                    out.println("Erro, usuário não pode ser inscrito");
                }
            }else {
            response.getWriter().println("Você deve ser maior de 18 anos para se inscrever no sorteio.");
            }
        %>
        <p><a href="index_inscricao.html">Retornar</a>
    </body>
</html>

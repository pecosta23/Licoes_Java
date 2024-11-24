<%-- 
    Document   : pesquisa
    Created on : 24 de out. de 2024, 21:03:29
    Author     : alunocmc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pesquisa"%>
<%@page import="model.dao.PesquisaDAO"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquisa - Alteração </title>
       <!-- <link href="../style/styles.css" rel="stylesheet" type="text/css"/> -->
    </head>
    <body>
        <h3>Pesquisa - Alteração (Identificação)</h3>
        <%
        //Entrada/Receber
        int id = Integer.parseInt( request.getParameter("id") );

        // Instância e atrib de valor
        Pesquisa pesq = new Pesquisa();
        pesq.setId(id);
       
        //Insert
        PesquisaDAO pesqDAO = new PesquisaDAO();
        if(pesqDAO.consPesqId(pesq) != null){
            //out.println("Registro encontrado!")
        %>  
            
        <form method="post" action="updatePesq.jsp">
            <%--Identificador: <input type="text" name="id" value="<%=pesq.getId()%>" readonly="true"> <p>--%>
            Identificador: <input type="text" name="id" value="<%=pesq.getId()%>"><p>
                Nome: <input type="text" name="nome" value="<%=pesq.getNome()%>" minlength="3" maxlength="10"> <p>            
            E-mail <input type="email" name="email" value="<%=pesq.getEmail()%>" minlength="3" maxlength="15"> <p>                     
            1. Como você classifica nosso atendimento? 
            <input type="text" name="r1" value="<%=pesq.getQ1()%>"><p>                    
            2. Como você avalia a pontualidade do técnico que lhe atendeu? 
            <input type="text" name="r2" value="<%=pesq.getQ2()%>"><p>                                 
            3. Como você avalia o tempo de atendimento? 
            <input type="text" name="r3" value="<%=pesq.getQ3()%>"><p>                              
            4. Você recomendaria nossa empresa para outro cliente? 
            <input type="text" name="r4" value="<%=pesq.getQ4()%>"><p>                                 
            Escolha a data: <input type="date" name="dt_update" value="<%=pesq.getDt_update()%>">                
            <input type="submit" value="Salvar!">
        </form>        
        <%       
            out.println("<br><img src='../imagem/escala.jpg' alt=''/>");
        }else{
           out.println("Registro não encontrado!!!");
        }
        %>
    </body>
</html>

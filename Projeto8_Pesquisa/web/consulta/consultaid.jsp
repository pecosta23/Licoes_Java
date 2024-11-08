<%-- 
    Document   : pesquisa
    Created on : 17 de out. de 2024, 21:29:33
    Author     : pedro
--%>
<%@page import="model.dao.PesquisaDAO"%>
<%@page import="model.Pesquisa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta ID</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%     
        int ID = Integer.parseInt(request.getParameter("ID"));
            
        Pesquisa pesq = new Pesquisa();  
        
        pesq.setID(ID);
        
        PesquisaDAO pesquisaDAO = new PesquisaDAO();
        
        if (pesquisaDAO.consPesqId(pesq) != null){
            //out.println("");
            out.println("<b>Identificação: </b> "  + pesq.getID()+ "<br>");
            out.println("<b>Nome: </b> "  + pesq.getNome() + "<br>");
            out.println("<b>E-mail </b> "  + pesq.getEmail() + "<br>");
            out.println("<b>Resposta 1: </b> "  + pesq.getQ1() + "<br>");
            out.println("<b>Resposta 2: </b> "  + pesq.getQ2() + "<br>");
            out.println("<b>Resposta 3: </b> "  + pesq.getQ3() + "<br>");
            out.println("<b>Resposta 4: </b> "  + pesq.getQ4() + "<br>");
            out.println("<b>Resposta 5: </b> "  + pesq.getQ5());
            
        }else{
            out.println("Erro");
        }    
        %>
    </body>
</html>

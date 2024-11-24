<%-- 
    Document   : exAlu
    Created on : 16 de nov. de 2024, 19:58:41
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
        <title>Excluindo Aluno</title>
=======
        <title>JSP Page</title>
>>>>>>> 52af563aa8ed40b8e3c6c54e35b11c2e381873d3
    </head>
    <body>
        <h1>Resposta do Servidor:</h1>
        <%
<<<<<<< HEAD
            //passando paremtros
            int ID = Integer.parseInt(request.getParameter("ID"));
            
            //Instanciando classes e atribuindo valores
=======
            
            int ID = Integer.parseInt(request.getParameter("ID"));
            
>>>>>>> 52af563aa8ed40b8e3c6c54e35b11c2e381873d3
            Info info = new Info();
            info.setID(ID);
            InfoDAO infoDAO = new InfoDAO();
            
<<<<<<< HEAD
            //condicao bool para excluir
=======
>>>>>>> 52af563aa8ed40b8e3c6c54e35b11c2e381873d3
            if(infoDAO.ExAlu(info)){
                out.println("Aluno excluído com sucesso!");
            } else{
                out.println("Erro, o registro não pode ser excluído.");
            }     
            %>
            <p><a href="../index.html">Retorno</a></p>
    </body>
</html>

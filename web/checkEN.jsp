<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Login" %>
<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
        <title> Bom Asilo </title>
    </head>
    <body>
        <% Login log = new Login();
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            boolean status = log.verificarUsuario(login, senha);
            System.out.println("Teste");
            if (status == true) {
                //out.print("Login realizado com sucesso. Usuario:" + log.emailUsuario + " Tipo Acesso: " + log.tipoAcesso);

                session.setAttribute("tipoAcesso", log.getTipoAcesso());
                session.setAttribute("usuarioLogado", log.getLogin());

                System.out.println(log.getTipoAcesso());
                if (log.getTipoAcesso().equals("familiar")) {
                    // System.out.println("entrou familiar");
                    response.sendRedirect("menufamiliarEN.jsp");

                } else {
                    // System.out.println("entrou outros");
                    response.sendRedirect("menuEN.jsp");
                }
            } else {
                /* Criado tratamento para só ir para a tela de esqueci senha se errar a senha 3 vezes */
                Integer i = (Integer) session.getAttribute("i");
                System.out.println("i =" + i);
                if (i == null) {
                    session.setAttribute("i", 1);
                    response.sendRedirect("indexEN.html");
                } else if (i < 2) {

                    session.setAttribute("i", ++i);
                    response.sendRedirect("indexEN.html");
                }
            }
            
        out.write("You have mistaken your password 3 times!\n");
        %>

</body>
</html>
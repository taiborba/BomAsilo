/* 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
*/
package modelos;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import util.Conexao;

public class Login {

    private String emailUsuario = "";
    private String tipoAcesso = "";
    private String login = "";
    private boolean result = false;
    private String senha = "";

    public boolean verificarUsuario(String login, String senha) {
        String sql = "";
        Connection con = Conexao.conectar();
        //INSTRUÇÃO SQL
        sql += "select emailUsuario, tipoAcesso, login, senha from usuario ";
        sql += "where login = " + "'" + login + "'";
        sql += "and senha = " + "'" + senha + "'";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                this.result = true;
                this.emailUsuario = rs.getString("emailUsuario");
                this.tipoAcesso = rs.getString("tipoAcesso");
                this.login = rs.getString("login");
                this.senha = rs.getString("senha");
            }
        } catch (SQLException e) {
            System.err.println("Erro de conexão na base de dados" + e);
        }
        return result;
    }

    public boolean verificarEmail(String emailUsuario) {
        String sql = "";
        Connection con = Conexao.conectar();
        //INSTRUÇÃO SQL
        sql += "select login, tipoAcesso, senha from usuario ";
        sql += "where emailUsuario = " + "'" + emailUsuario + "'";
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                result = true;
                login = rs.getString("login");
                senha = rs.getString("senha");
                tipoAcesso = rs.getString("tipoAcesso");

            }
        } catch (SQLException e) {
            System.err.println("Erro de conexão na base de dados" + e);
        }
        return result;
    }

    public boolean mandaEmail(String emailUsuario) {
        Properties props = new Properties();
        /**
         * Parâmetros de conexão com servidor Gmail
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props,
                // Entra na Conta
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("Sistemabom.asilo@gmail.com",
                        "bomasilo123");
            }
        });
        /**
         * Ativa Debug para sessão
         */
        session.setDebug(true);
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("sistemabom.asilo@gmail.com"));
            //Remetente
            System.out.println("aqui");
            Address[] toUser = InternetAddress //Destinatário(s)
                    .parse(emailUsuario);
            message.setRecipients(Message.RecipientType.TO, toUser);
            message.setSubject("Recuperação de Senha - BOM ASILO");//Assunto
            message.setText("  Olá! \n\n Recebemos uma solicitação de RECUPERAÇÃO DE SENHA na sua conta do Bom Asilo. \n"
                           + " Caso não tenha sido você que enviou a solicitação, apenas ignore este e-mail. \n\n"
                           + "Sua senha é: " + this.senha + "\n\n"
                           + "Atensiosamente, \n"
                           + "Equipe Bom Asilo.");
            /**
             * Método para enviar a mensagem criada
             */
            Transport.send(message);
            result = true;
            System.out.println("Feito!!!");

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getTipoAcesso() {
        return tipoAcesso;
    }

    public void setTipoAcesso(String tipoAcesso) {
        this.tipoAcesso = tipoAcesso;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public boolean isResult() {
        return result;
    }

    public void setResult(boolean result) {
        this.result = result;
    }
    
    
    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

}
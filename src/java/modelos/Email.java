/* 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
*/
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.Conexao;

public class Email {
    private String emailUsuario;
    private String login;
    private String senha;
    private String tipoAcesso;

    @Override
    public String toString() {
        return "Usuario{" + "emailUsuario=" + emailUsuario + ", login=" + login + ", senha=" + senha + ", tipoAcesso=" + tipoAcesso + '}';
    }

  
  public Email consultarRecupera(String pEmail) {
            this.emailUsuario = pEmail;
            // declarando comando de execucao do banco de dados
            String  sql  = "select emailUsuario, login, senha, tipoAcesso";
                    sql += " from usuario";
                    sql += " where emailUsuario = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Email em = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.emailUsuario);
               // System.out.println(stm);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   em = new Email();
                   em.setEmailUsuario(rs.getString("emailUsuario"));
                   em.setLogin(rs.getString("login"));
                   em.setSenha(rs.getString("senha"));
                   em.setTipoAcesso(rs.getString("tipoAcesso"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return em;
	}
       
    
    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTipoAcesso() {
        return tipoAcesso;
    }

    public void setTipoAcesso(String tipoAcesso) {
        this.tipoAcesso = tipoAcesso;
    }
}

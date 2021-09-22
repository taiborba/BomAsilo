package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Usuario {

     // Variaveis 
    private String emailUsuario;
    private String login;
    private String senha;
    private String tipoAcesso;

    @Override
    public String toString() {
        return "Usuario{" + "emailUsuario=" + emailUsuario + ", login=" + login + ", senha=" + senha + ", tipoAcesso=" + tipoAcesso + '}';
    }

    public boolean incluirUsuario() {
            // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO usuario ";
                   sql += "(emailUsuario, login, senha, tipoAcesso)";
                   sql += " VALUES(?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.emailUsuario);
                stm.setString(2, this.login);
                stm.setString(3, this.senha);
                stm.setString(4, this.tipoAcesso);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    
	public boolean alterarUsuario() {
	// declarando comando de execucao do banco de dados
            String sql  = "UPDATE usuario ";
                   sql += "set emailUsuario = ?, ";
                   sql += "    senha        = ?, ";
                   sql += "    tipoAcesso   = ? ";
                   sql += " where login      = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.emailUsuario);
                stm.setString(2, this.senha);
                stm.setString(3, this.tipoAcesso);
                stm.setString(4, this.login);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

	public boolean excluirUsuario() {
        // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM usuario ";
               sql += " WHERE login = ? ";
               sql += " AND emailUsuario = ? ";
                 
               
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.login);
            stm.setString(2, this.emailUsuario);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

	public Usuario consultarUsuario(String pLogin) {
            this.login = pLogin;
            // declarando comando de execucao do banco de dados
            String  sql  = "select emailUsuario, login, senha, tipoAcesso";
                    sql += " from usuario";
                    sql += " where login = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Usuario usu = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.login);
               // System.out.println(stm);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   usu = new Usuario();
                   usu.setEmailUsuario(rs.getString("emailUsuario"));
                   usu.setLogin(rs.getString("login"));
                   usu.setSenha(rs.getString("senha"));
                   usu.setTipoAcesso(rs.getString("tipoAcesso"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return usu;
	}
    public List<Usuario> consultarGeral(){
        List<Usuario> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = "select * from usuario order by login";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Usuario  usu = new Usuario();
               usu.setEmailUsuario(rs.getString("emailUsuario"));
               usu.setLogin(rs.getString("login"));
               usu.setSenha(rs.getString("senha"));
               usu.setTipoAcesso(rs.getString("tipoAcesso"));
               lista.add(usu);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
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
    
    
    
    
   
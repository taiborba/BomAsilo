package modelos;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.Conexao;


public class Login {
    
    public String emailUsuario="";
    public String tipoAcesso="";
    public boolean result = false;
    public boolean verificarUsuario(String login, String senha)  {
        String sql = "";
        Connection con = Conexao.conectar();
        //INSTRUÇÃO SQL
        sql += "select emailUsuario, tipoAcesso from usuario ";
        sql += "where login = " + "'" + login + "'";
        sql += "and senha = " + "'" + senha + "'";
            try { Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if(rs.next()){
                result = true;
                emailUsuario = rs.getString("emailUsuario");
                tipoAcesso = rs.getString("tipoAcesso");
            }
            } catch (SQLException e) {
                System.err.println("Erro de conexão na base de dados" + e);
            }
          return result;
           }
}


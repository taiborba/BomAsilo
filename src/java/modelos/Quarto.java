
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;


public class Quarto {
    private String descrQuarto;
    private int idQuarto;

    @Override
    public String toString() {
        return "Quarto{" + "descrQuarto=" + descrQuarto + ", idQuarto=" + idQuarto + '}';
    }
    
 public boolean incluirQuarto() {
            // declarando comando de execucao do banco de dados
            String sql  = " INSERT INTO quarto ";
                   sql += " (descrQuarto) ";
                   sql += " VALUES(?) ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.descrQuarto);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    
	public boolean alterarQuarto() {
	// declarando comando de execucao do banco de dados
            String sql  = " UPDATE quarto ";
                   sql += " set   descrQuarto = ? ";
                   sql += " where idQuarto = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.descrQuarto);
                stm.setInt(2, this.idQuarto);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

	public boolean excluirQuarto() {
        // declarando comando de execucao do banco de dados
	String sql  = " DELETE FROM quarto ";
               sql += " WHERE idQuarto = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idQuarto);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

	public Quarto consultarQuarto(Integer idQuarto) {
            this.idQuarto = idQuarto;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idQuarto, descrQuarto";
                    sql += " from quarto ";
                    sql += " where idQuarto = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Quarto quar = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idQuarto);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   quar = new Quarto();
                   quar.setIdQuarto(rs.getInt("idQuarto"));
                   quar.setDescrQuarto(rs.getString("descrQuarto"));
                 
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return quar;
	}
             
    public List<Quarto> consultarGeral(){
        List<Quarto> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = "select * from quarto order by descrQuarto";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Quarto  quar = new Quarto();
               quar.setIdQuarto(rs.getInt("idQuarto"));
               quar.setDescrQuarto(rs.getString("descrQuarto"));
               lista.add(quar);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    public String getDescrQuarto() {
        return descrQuarto;
    }

    public void setDescrQuarto(String descrQuarto) {
        this.descrQuarto = descrQuarto;
    }

    public int getIdQuarto() {
        return idQuarto;
    }

    public void setIdQuarto(Integer idQuarto) {
        this.idQuarto = idQuarto;
    }

}

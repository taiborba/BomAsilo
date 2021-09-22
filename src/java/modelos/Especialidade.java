//pronto
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Especialidade {

    private int idEspecialidade; //serial
    private String descEspecialidade;

    @Override
    public String toString() {
        return "Especialidade{" + "idEspecialidade=" + idEspecialidade + ", descEspecialidade=" + descEspecialidade + '}';
    }

    public boolean IncluirEspecialidade() {
       // declarando comando de execucao do banco de dados
        String sql = " INSERT INTO especialidade ";
        sql += " (descEspecialidade)";
        sql += " VALUES(?)";
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descEspecialidade);
       
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    } 

    public boolean AlterarEspecialidade() {
        String sql = " UPDATE especialidade ";
        sql += " set descEspecialidade    = ? ";
        sql += " where idEspecialidade = ? ";
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descEspecialidade);
            stm.setInt(2, this.idEspecialidade);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
    

    public boolean ExcluirEspecialidade() {
        String sql = " DELETE FROM especialidade ";
        sql += " WHERE idEspecialidade = ? ";
             Connection con = Conexao.conectar();
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idEspecialidade);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
    

    public Especialidade consultarEspecialidade(int pEspecialidade) {
        this.idEspecialidade = pEspecialidade;
        String sql = " select idEspecialidade, descEspecialidade";
        sql += " from especialidade ";
        sql += " where idEspecialidade = ?";
        Connection con = Conexao.conectar();
        Especialidade e = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idEspecialidade);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                e = new Especialidade();
                e.setIdEspecialidade(rs.getInt("idEspecialidade"));
                e.setDescEspecialidade(rs.getString("descEspecialidade"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return e;
    }
    public List<Especialidade> consultarGeral(){
        List<Especialidade> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = " select * from especialidade order by descEspecialidade";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Especialidade  e = new Especialidade();
               e.setIdEspecialidade(rs.getInt("idEspecialidade"));
               e.setDescEspecialidade(rs.getString("descEspecialidade"));
               lista.add(e);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
        
    
//getters e setters
    public int getIdEspecialidade() {
        return idEspecialidade;
    }

    public void setIdEspecialidade(int idEspecialidade) {
        this.idEspecialidade = idEspecialidade;
    }

    public String getDescEspecialidade() {
        return descEspecialidade;
    }

    public void setDescEspecialidade(String descEspecialdiade) {
        this.descEspecialidade = descEspecialdiade;
    }

}

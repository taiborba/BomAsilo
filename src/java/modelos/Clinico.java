//pronto
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Clinico {

    private int idClinico; //serial
    private String nomeClinico;
    private String codRegistro;
    private int idEspecialidade;
    private Especialidade EspecialidadeClinico;
    

    @Override
    public String toString() {
        return "Clinico{" + "idClinico=" + idClinico + ", nomeClinico=" + nomeClinico + ", codRegistro=" + codRegistro + ", idEspecialidade=" + idEspecialidade + '}';
    }

    public Clinico() {
    EspecialidadeClinico = new Especialidade();
        }
     
    public boolean IncluirClinico() {
        String sql = " INSERT INTO clinico ";
        sql += " (nomeClinico, codRegistro, idEspecialidade)";
        sql += " VALUES(?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeClinico);
            stm.setString(2, this.codRegistro);
            stm.setInt(3, this.idEspecialidade);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
    

    public boolean AlterarClinico() {
        String sql = " UPDATE clinico ";
        sql += " set idEspecialidade = ?, ";
        sql += " nomeClinico    = ?, ";
        sql += " codRegistro    = ? ";
        sql += " where idClinico = ? ";
                Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idEspecialidade);
            stm.setString(2, this.nomeClinico);
            stm.setString(3, this.codRegistro);
            stm.setInt(4, this.idClinico);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean ExcluirClinico() {
        String sql = " DELETE FROM clinico ";
        sql += " WHERE idClinico = ? ";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idClinico);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
    

    public Clinico consultarClinico(Integer pIdClinico) {
        this.idClinico = pIdClinico;
        String sql = " select idClinico, nomeClinico, codRegistro, idEspecialidade";
        sql += " from clinico ";
        sql += " where idClinico = ?";
        Connection con = Conexao.conectar();
        Clinico c = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idClinico);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                c = new Clinico();
                c.setIdClinico(rs.getInt("idClinico"));
                c.setNomeClinico(rs.getString("nomeClinico"));
                c.setCodRegistro(rs.getString("codRegistro"));
                c.setIdEspecialidade(rs.getInt("idEspecialidade"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return c;
    
    }
    public List<Clinico> consultarGeral(){
        List<Clinico> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = " select * from clinico order by nomeClinico";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Clinico c = new Clinico();
               c.setIdClinico(rs.getInt("idClinico"));
               c.setNomeClinico(rs.getString("nomeClinico"));
               c.setCodRegistro(rs.getString("codRegistro"));
               c.setIdEspecialidade(rs.getInt("idEspecialidade"));
               lista.add(c);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
//getters e setters
    public int getIdClinico() {
        return idClinico;
    }

    public void setIdClinico(int idclinico) {
        this.idClinico = idclinico;
    }

    public String getNomeClinico() {
        return nomeClinico;
    }

    public void setNomeClinico(String nomeClinico) {
        this.nomeClinico = nomeClinico;
    }

    public String getCodRegistro() {
        return codRegistro;
    }

    public void setCodRegistro(String codregistro) {
        this.codRegistro = codregistro;
    }

    public Integer getIdEspecialidade() {
        return idEspecialidade;
    }

    public void setIdEspecialidade(Integer idEspecialidade) {
        this.idEspecialidade = idEspecialidade;
    }
    
     public Especialidade getEspecialidadeClinico() {
        return EspecialidadeClinico.consultarEspecialidade(this.idEspecialidade);
    }

    public void setEspecialidadeClinico(Especialidade idEspecialidade) {
        this.EspecialidadeClinico = EspecialidadeClinico;
    }

}

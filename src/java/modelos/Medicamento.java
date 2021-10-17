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
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Medicamento {

    // Variaveis 
    private int idMedicamento; //serial
    private String nomeMedicamento;
    private boolean indControlado;

    @Override
    public String toString() {
        return "Medicamentos{" + "idMedicamento=" + idMedicamento + ", nomeMedicamento=" + nomeMedicamento + ", indControlado=" + indControlado + '}';
    }

    public boolean incluirMedicamento() {
        // declarando comando de execucao do banco de dados
        String sql = " INSERT INTO medicamento ";
        sql += " (nomeMedicamento, indControlado)";
        sql += " VALUES(?,?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeMedicamento);
            stm.setBoolean(2, this.indControlado);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarMedicamento() {
        // declarando comando de execucao do banco de dados
        String sql = " UPDATE medicamento ";
        sql += " set nomeMedicamento  = ?, "; 
        sql += " indControlado    = ? ";
        sql += " where idMedicamento = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeMedicamento);
            stm.setBoolean(2, this.indControlado);
            stm.setInt(3, this.idMedicamento);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirMedicamento() {
        // declarando comando de execucao do banco de dados
        String sql = " DELETE FROM medicamento ";
        sql += " WHERE nomeMedicamento = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nomeMedicamento);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public Medicamento consultarMedicamentos(Integer pIdMedicamento) {
        this.idMedicamento = pIdMedicamento;
        // declarando comando de execucao do banco de dados
        String sql = " select idMedicamento, nomeMedicamento, indControlado";
        sql += " from medicamento ";
        sql += " where idMedicamento = ?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        //
        Medicamento m = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idMedicamento);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                m = new Medicamento();
                m.setIdMedicamento(rs.getInt("idMedicamento"));
                m.setNomeMedicamento(rs.getString("nomeMedicamento"));
                m.setIndControlado(rs.getBoolean("indControlado"));

            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return m;
    }
    public List<Medicamento> consultarGeral(){
        List<Medicamento> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql = " SELECT idMedicamento, nomeMedicamento, indcontrolado ";
                sql += "from medicamento m ";   
                sql += "order by nomemedicamento;";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Medicamento  m = new Medicamento();
               m.setIdMedicamento(rs.getInt("idMedicamento"));
               m.setNomeMedicamento(rs.getString("nomeMedicamento"));
               m.setIndControlado(rs.getBoolean("indControlado"));
               lista.add(m);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
//getters e setters
    public String getNomeMedicamento() {
        return nomeMedicamento;
    }

    public void setNomeMedicamento(String nomeMedicamento) {
        this.nomeMedicamento = nomeMedicamento;
    }

    public int getIdMedicamento() {
        return idMedicamento;
    }

    public void setIdMedicamento(Integer idMedicamento) {
        this.idMedicamento = idMedicamento;
    }

    public boolean getIndControlado() {
        return indControlado;
    }

    public void setIndControlado(boolean indControlado) {
        this.indControlado = indControlado;
    }
    
     public boolean isIndControlado() {
        return indControlado;
    }
}

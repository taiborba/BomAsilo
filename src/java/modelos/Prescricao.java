//pronto
package modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Prescricao {

    private int idPrescricao; //serial
    private Integer idClinico;
    private Date dataConsulta;
    private String horaConsulta;
    private String descOrientacao;
    private String descPosologia;
    private Integer idMedicamento;
    private String cpfPaciente;
    private Paciente pacientePrescricao;
    private Medicamento medicamentoPrescricao;
    private Clinico clinicoPrescricao;

    @Override
    public String toString() {
        return "Prescricao{" + "idPrescricao=" + idPrescricao + ", idClinico=" + idClinico + ", dataConsulta=" + dataConsulta + ", horaConsulta=" + horaConsulta +  ", descOrientacao=" + descOrientacao + ", descPosologia=" + descPosologia + ", idMedicamento=" + idMedicamento + ", cpfPaciente=" + cpfPaciente + '}';
    }
    
    public Prescricao(){
    pacientePrescricao = new Paciente();
    medicamentoPrescricao = new Medicamento();
    clinicoPrescricao = new Clinico();
    }
    
    public boolean IncluirPrescricao() {
        String sql = " INSERT INTO prescricao ";
        sql += " (idClinico, idMedicamento, dataConsulta, horaConsulta, descOrientacao, descPosologia, cpfPaciente)";
        sql += " VALUES(?,?,?,?,?,?,?)";
       
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idClinico);
            stm.setInt(2, this.idMedicamento);
            stm.setDate(3, this.dataConsulta);
            stm.setString(4, this.horaConsulta);
            stm.setString(5, this.descOrientacao);
            stm.setString(6, this.descPosologia);
            stm.setString(7, this.cpfPaciente);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarPrescricao() {
        
  String sql = " UPDATE prescricao ";
         sql+= " set   idClinico      = ?, ";
         sql+= "       idMedicamento  = ?, ";
         sql+= "       dataConsulta   = ?, ";
         sql+= "       horaConsulta   = ?, ";
         sql+= "       descOrientacao = ?, ";
         sql+= "       descPosologia  = ?, ";
         sql+= "       cpfPaciente    = ?  ";
         sql+= " where idPrescricao   = ?  ";
     
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idClinico);
            stm.setInt(2, this.idMedicamento);
            stm.setDate(3, this.dataConsulta);
            stm.setString(4, this.horaConsulta);
            stm.setString(5, this.descOrientacao);
            stm.setString(6, this.descPosologia);
            stm.setString(7, this.cpfPaciente);
            stm.setInt(8, this.idPrescricao);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirPrescricao() {
        String sql = " DELETE FROM prescricao ";
        sql += " WHERE idPrescricao = ? ";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPrescricao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

      public Prescricao consultarPrescricao(Integer idPrescricao) {
        this.idPrescricao = idPrescricao;
        String sql = " select idPrescricao, idClinico, idMedicamento, dataConsulta, horaConsulta, descOrientacao, descPosologia, cpfPaciente ";
        sql += " from prescricao ";
        sql += " where idPrescricao = ?";
        Connection con = Conexao.conectar();
        Prescricao p = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPrescricao);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                p = new Prescricao();
                p.setIdPrescricao(rs.getInt("idPrescricao"));
                p.setIdClinico(rs.getInt("idClinico"));
                p.setIdMedicamento(rs.getInt("idMedicamento"));
                p.setDataConsulta(rs.getDate("dataConsulta"));
                p.setHoraConsulta(rs.getString("horaConsulta"));
                p.setDescOrientacao(rs.getString("descOrientacao"));
                p.setDescPosologia(rs.getString("descPosologia"));
                p.setCpfPaciente(rs.getString("cpfPaciente"));
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return p;
    }
         public List<Prescricao> consultarGeral(){
        List<Prescricao> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = " select * from prescricao order by idPrescricao";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Prescricao p = new Prescricao();
               p.setIdPrescricao(rs.getInt("idPrescricao"));
               p.setIdClinico(rs.getInt("idClinico"));
               p.setIdMedicamento(rs.getInt("idMedicamento"));
               p.setDataConsulta(rs.getDate("dataConsulta"));
               p.setHoraConsulta(rs.getString("horaConsulta"));
               p.setDescOrientacao(rs.getString("descOrientacao"));
               p.setDescPosologia(rs.getString("descPosologia"));
               p.setCpfPaciente(rs.getString("cpfPaciente"));
               lista.add(p);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
//getters e setters
    public int getIdPrescricao() {
        return idPrescricao;
    }

    public void setIdPrescricao(Integer idPrescricao) {
        this.idPrescricao = idPrescricao;
    }

    public int getIdClinico() {
        return idClinico;
    }

    public void setIdClinico(Integer idClinico) {
        this.idClinico = idClinico;
    }

    public Date getDataConsulta() {
        return dataConsulta;
    }

    public void setDataConsulta(Date dataConsulta) {
        this.dataConsulta = dataConsulta;
    }

    public String getHoraConsulta() {
        return horaConsulta;
    }

    public void setHoraConsulta(String horaConsulta) {
        this.horaConsulta = horaConsulta;
    }

    public String getDescOrientacao() {
        return descOrientacao;
    }

    public void setDescOrientacao(String descOrientacao) {
        this.descOrientacao = descOrientacao;
    }

    public String getDescPosologia() {
        return descPosologia;
    }

    public void setDescPosologia(String descPosologia) {
        this.descPosologia = descPosologia;
    }

    public int getIdMedicamento() {
        return idMedicamento;
    }

    public void setIdMedicamento(Integer idMedicamento) {
        this.idMedicamento = idMedicamento;
    }
    public String getCpfPaciente() {
        return cpfPaciente;
    }

    public void setCpfPaciente(String cpfPaciente) {
        this.cpfPaciente = cpfPaciente;
    }
    public Paciente getPacientePrescricao() {
        return pacientePrescricao.consultarPaciente(this.cpfPaciente);
    }

    public void setPacientePrescricao(Paciente pacientePrescricao) {
        this.pacientePrescricao = pacientePrescricao;
    }
    public Medicamento getMedicamentoPrescricao() {
        return medicamentoPrescricao.consultarMedicamentos(this.idMedicamento);
    }

    public void setMedicamentoPrescricao(Medicamento medicamentoPrescricao) {
        this.medicamentoPrescricao = medicamentoPrescricao;
    }
    public Clinico getClinicoPrescricao() {
        return clinicoPrescricao.consultarClinico(this.idClinico);
    }

    public void setClinicoPrescricao(Clinico clinicoPrescricao) {
        this.clinicoPrescricao = clinicoPrescricao;
    }
}
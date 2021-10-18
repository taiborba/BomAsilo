/* 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
*/
package modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Rotina {
    private int idEvento; // serial
    private String cpfPaciente;
    private Date dataInicial;
    private Date dataFinal;
    private String horaInicio;
    private String horaFinal;
    private String descEvento;
    private String status;
    private int qtdIntervalo;
    private Integer idPrescricao;
    private Prescricao prescricaoRotina;
    private Paciente pacienteRotina;
    
    @Override
    public String toString() {
        return "Rotina{" + "idEvento=" + idEvento + ", cpfPaciente=" + cpfPaciente + ", dataInicial=" + dataInicial + ", dataFinal=" + dataFinal + ", horaInicio=" + horaInicio + ", horaFinal=" + horaFinal + ", descEvento=" + descEvento + ", status=" + status + ", qtdIntervalo=" + qtdIntervalo + ", idPrescricao=" + idPrescricao + '}';
    }

   public Rotina() {
     prescricaoRotina = new Prescricao();
     pacienteRotina = new Paciente();
         }
    
    public boolean incluirRotina() {
       // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO rotina ";
                   sql += " (cpfPaciente, dataInicial, dataFinal, horaInicio, horaFinal, descEvento, status, qtdIntervalo, idPrescricao) ";
                   sql += " VALUES(?,?,?,?,?,?,?,?,?) ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpfPaciente);
                stm.setDate(2, this.dataInicial);
                stm.setDate(3, this.dataFinal);
                stm.setString(4, this.horaInicio);
                stm.setString(5, this.horaFinal);
                stm.setString(6, this.descEvento);
                stm.setString(7, this.status);
                stm.setInt(8, this.qtdIntervalo);
                /*Validação caso não seja informada prescricao*/
                if (this.idPrescricao != null){
                    stm.setInt(9, this.idPrescricao);
                } else {
                    stm.setNull(9, 0);
                }
                stm.execute();   
                System.out.println(stm);
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    
    public boolean efetivar(int pIdEvento) {
        Connection con = Conexao.conectar();
        String  sql  = "update rotina ";
                sql += "set status = 'E' ";
                sql += "where idEvento = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,pIdEvento);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }


    public boolean editarRotina() {
        // declarando comando de execucao do banco de dados
            String sql  = "UPDATE rotina ";
                   sql += " set cpfPaciente      = ?, ";
                   sql += "    dataInicial     = ?, ";
                   sql += "    dataFinal     = ?, ";
                   sql += "    horaInicio     = ?, ";
                   sql += "    horaFinal      = ?, ";
                   sql += "    descEvento     = ?, ";
                   sql += "    status         = ?, ";
                   sql += "    qtdIntervalo   = ?, ";
                   sql += "    idPrescricao   = ?  ";
                   sql += " where  idEvento   = ?  ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpfPaciente);
                stm.setDate(2, this.dataInicial);
                stm.setDate(3, this.dataFinal);
                stm.setString(4, this.horaInicio);
                stm.setString(5, this.horaFinal);
                stm.setString(6, this.descEvento);
                stm.setString(7, this.status);
                stm.setInt(8, this.qtdIntervalo);
                stm.setInt(9, this.idPrescricao);
                stm.setInt(10, this.idEvento);
                stm.execute();   
                System.out.println(stm);
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}


    public boolean excluirRotina() {
         // declarando comando de execucao do banco de dados
	String sql  = " DELETE FROM rotina ";
               sql += " WHERE idEvento = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idEvento);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}


    public Rotina consultarRotina(int pIdEvento) {
      this.idEvento = pIdEvento;
            // declarando comando de execucao do banco de dados
            String  sql  = " select idEvento, cpfPaciente, dataInicial, dataFinal, horaInicio, horaFinal, descEvento, status, qtdIntervalo, idPrescricao ";
                    sql += " from rotina ";
                    sql += " where idEvento = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Rotina rot = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idEvento);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   rot = new Rotina();
                   rot.setIdEvento(rs.getInt("idEvento"));
                   rot.setCpfPaciente(rs.getString("cpfPaciente"));
                   rot.setDataInicial(rs.getDate("dataInicial"));
                   rot.setDataFinal(rs.getDate("dataFinal"));
                   rot.setHoraInicio(rs.getString("horaInicio"));
                   rot.setHoraFinal(rs.getString("horaFinal"));
                   rot.setDescEvento(rs.getString("descEvento"));
                   rot.setStatus(rs.getString("status"));
                   rot.setQtdIntervalo(rs.getInt("qtdIntervalo"));
                   rot.setIdPrescricao(rs.getInt("idPrescricao"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return rot;
	}
    
     public Rotina consultarRotina(Paciente paciente) {
      this.cpfPaciente = paciente.getCpfPaciente();
            // declarando comando de execucao do banco de dados
            String  sql  = " select idEvento, cpfPaciente, dataInicial, dataFinal, horaInicio, horaFinal, descEvento, status, qtdIntervalo, idPrescricao ";
                    sql += " from rotina ";
                    sql += " where cpfPaciente = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Rotina rot = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpfPaciente);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   rot = new Rotina();
                   rot.setIdEvento(rs.getInt("idEvento"));
                   rot.setCpfPaciente(rs.getString("cpfPaciente"));
                   rot.setDataInicial(rs.getDate("dataInicial"));
                   rot.setDataFinal(rs.getDate("dataFinal"));
                   rot.setHoraInicio(rs.getString("horaInicio"));
                   rot.setHoraFinal(rs.getString("horaFinal"));
                   rot.setDescEvento(rs.getString("descEvento"));
                   rot.setStatus(rs.getString("status"));
                   rot.setQtdIntervalo(rs.getInt("qtdIntervalo"));
                   rot.setIdPrescricao(rs.getInt("idPrescricao"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return rot;
	}
     public List<Rotina> consultarGeral(){
        List<Rotina> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from rotina order by idEvento";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Rotina  rotina = new Rotina();
               rotina.setIdEvento(rs.getInt("idEvento"));
               rotina.setCpfPaciente(rs.getString("cpfPaciente"));
               rotina.setDataInicial(rs.getDate("dataInicial"));
               rotina.setDataFinal(rs.getDate("dataFinal"));
               rotina.setHoraInicio(rs.getString("horaInicio"));
               rotina.setHoraFinal(rs.getString("horaFinal"));
               rotina.setDescEvento(rs.getString("descEvento"));
               rotina.setStatus(rs.getString("status"));
               rotina.setQtdIntervalo(rs.getInt("qtdIntervalo"));
               rotina.setIdPrescricao(rs.getInt("idPrescricao"));
               lista.add(rotina);
               System.out.println(stm);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
     
     public List<Rotina> consultarRotinaPaciente(Paciente paciente){
         this.cpfPaciente = paciente.getCpfPaciente();
        List<Rotina> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select idevento, cpfpaciente, horainicio, horafinal, descevento , status, qtdintervalo, idprescricao, idprescricao, datainicial, datafinal ";
                sql += " from rotina ";
                sql += " where cpfpaciente = ? ";
        try {
            PreparedStatement stm = con.prepareStatement(sql);  
             stm.setString(1, this.cpfPaciente);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Rotina  rotina = new Rotina();
               rotina.setIdEvento(rs.getInt("idEvento"));
               rotina.setCpfPaciente(rs.getString("cpfPaciente"));
               rotina.setDataInicial(rs.getDate("dataInicial"));
               rotina.setDataFinal(rs.getDate("dataFinal"));
               rotina.setHoraInicio(rs.getString("horaInicio"));
               rotina.setHoraFinal(rs.getString("horaFinal"));
               rotina.setDescEvento(rs.getString("descEvento"));
               rotina.setStatus(rs.getString("status"));
               rotina.setQtdIntervalo(rs.getInt("qtdIntervalo"));
               rotina.setIdPrescricao(rs.getInt("idPrescricao"));
               lista.add(rotina);
               System.out.println(stm);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    

    public int getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(int idEvento) {
        this.idEvento = idEvento;
    }

    public String getCpfPaciente() {
        return cpfPaciente;
    }

    public void setCpfPaciente(String cpfPaciente) {
        this.cpfPaciente = cpfPaciente;
    }

    public Date getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(Date dataInicial) {
        this.dataInicial = dataInicial;
    }
    
    public Date getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(Date dataFinal) {
        this.dataFinal = dataFinal;
    }

    public String getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(String horaInicio) {
        this.horaInicio = horaInicio;
    }

    public String getHoraFinal() {
        return horaFinal;
    }

    public void setHoraFinal(String horaFinal) {
        this.horaFinal = horaFinal;
    }

    public String getDescEvento() {
        return descEvento;
    }

    public void setDescEvento(String descEvento) {
        this.descEvento = descEvento;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getQtdIntervalo() {
        return qtdIntervalo;
    }

    public void setQtdIntervalo(int qtdIntervalo) {
        this.qtdIntervalo = qtdIntervalo;
    }

    public Integer getIdPrescricao() {
        return idPrescricao;
    }

    public void setIdPrescricao(Integer idPrescricao) {
        this.idPrescricao = idPrescricao;
    }
    
    public Prescricao getPrescricaoRotina() {
        return prescricaoRotina.consultarPrescricao(this.idPrescricao);
    }

    public void setPrescricaoRotina(Integer idPrescricao) {
        this.prescricaoRotina = prescricaoRotina;
    }
    
    public Paciente getPacienteRotina() {
        return pacienteRotina.consultarPaciente(this.cpfPaciente);
    }

    public void setPacienteRotina(String cpfPrescricao) {
        this.pacienteRotina = pacienteRotina;
    }
}
   
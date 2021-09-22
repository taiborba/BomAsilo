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
    private Date dataEvento;
    private String horaInicio;
    private String horaFinal;
    private String descEvento;
    private String status;
    private int qtdIntervalo;
    private int idPrescricao;
    private Prescricao prescricaoRotina;
    
    @Override
    public String toString() {
        return "Rotina{" + "idEvento=" + idEvento + ", cpfPaciente=" + cpfPaciente + ", dataEvento=" + dataEvento + ", horaInicio=" + horaInicio + ", horaFinal=" + horaFinal + ", descEvento=" + descEvento + ", status=" + status + ", qtdIntervalo=" + qtdIntervalo + ", idPrescricao=" + idPrescricao + '}';
    }

   public Rotina() {
     prescricaoRotina = new Prescricao();
         }
    
    public boolean IncluirRotina() {
       // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO rotina ";
                   sql += " (cpfPaciente, dataEvento, horaInicio, horaFinal, descEvento, status, qtdIntervalo, idPrescricao) ";
                   sql += " VALUES(?,?,?,?,?,?,?,?) ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpfPaciente);
                stm.setDate(2, this.dataEvento);
                stm.setString(3, this.horaInicio);
                stm.setString(4, this.horaFinal);
                stm.setString(5, this.descEvento);
                stm.setString(6, this.status);
                stm.setInt(7, this.qtdIntervalo);
                stm.setInt(8, this.idPrescricao);
                stm.execute();   
                System.out.println(stm);
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }


    public boolean EditarRotina() {
        // declarando comando de execucao do banco de dados
            String sql  = "UPDATE rotina ";
                   sql += " set cpfPaciente      = ?, ";
                   sql += "    dataEvento     = ?, ";
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
                stm.setDate(2, this.dataEvento);
                stm.setString(3, this.horaInicio);
                stm.setString(4, this.horaFinal);
                stm.setString(5, this.descEvento);
                stm.setString(6, this.status);
                stm.setInt(7, this.qtdIntervalo);
                stm.setInt(8, this.idPrescricao);
                stm.setInt(9, this.idEvento);
                stm.execute();   
                System.out.println(stm);
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}


    public boolean ExcluirRotina() {
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


    public Rotina ConsultarRotina(int pIdEvento) {
      this.idEvento = pIdEvento;
            // declarando comando de execucao do banco de dados
            String  sql  = " select idEvento, cpfPaciente, dataEvento, horaInicio, horaFinal, descEvento, status, qtdIntervalo, idPrescricao ";
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
                   rot.setDataEvento(rs.getDate("dataEvento"));
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
               rotina.setDataEvento(rs.getDate("dataEvento"));
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

    public Date getDataEvento() {
        return dataEvento;
    }

    public void setDataEvento(Date dataEvento) {
        this.dataEvento = dataEvento;
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

    public int getIdPrescricao() {
        return idPrescricao;
    }

    public void setIdPrescricao(int idPrescricao) {
        this.idPrescricao = idPrescricao;
    }
    
    public Prescricao getPrescricaoRotina() {
        return prescricaoRotina.consultarPrescricao(this.idPrescricao);
    }

    public void setPrescricaoRotina(Integer idPrescricao) {
        this.prescricaoRotina = prescricaoRotina;
    }
}
   
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

public class Prontuario {

    private int     idProntuario; // serial
    private String  tipoSangue;
    private boolean limitCognitiva;
    private boolean limitLocomocao;
    private boolean limitVisao;
    private boolean limitAudicao;
    private String  limitOutras;
    private String  descAlergia;
    private String  descOcupacao;
    private String  cpfPaciente;
    private float   peso;
    private float   altura;
    private float   imc;
     private Date dataConsulta;
    private Paciente pacienteProntuario;

    @Override
    public String toString() {
        return "Prontuario{" + "idProntuario=" + idProntuario + "tipoSangue=" + tipoSangue + ", peso=" + peso + ", altura=" + altura + ", imc=" + imc + ", limitCognitiva=" + limitCognitiva + ", limitLocomocao=" + limitLocomocao + ", limitVisao=" + limitVisao + ", limitAudicao=" + limitAudicao + ", limitOutras=" + limitOutras + ", descAlergia=" + descAlergia + ", descOcupacao=" + descOcupacao + ", cpfPaciente=" + cpfPaciente + ", dataConsulta=" + dataConsulta + '}';
    }
    
     public Prontuario(){
     pacienteProntuario = new Paciente();
         }

    public boolean incluirProntuario() {
            // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO prontuario ";
                   sql += " (tipoSangue, limitCognitiva, limitLocomocao, limitVisao, limitAudicao, limitOutras, descAlergia, descOcupacao, cpfPaciente, peso, altura, imc, dataConsulta)";
                   sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.tipoSangue);
                stm.setBoolean(2, this.limitCognitiva);
                stm.setBoolean(3, this.limitLocomocao);
                stm.setBoolean(4, this.limitVisao);
                stm.setBoolean(5, this.limitAudicao);
                stm.setString(6, this.limitOutras);
                stm.setString(7, this.descAlergia);
                stm.setString(8, this.descOcupacao);
                stm.setString(9, this.cpfPaciente);
                stm.setFloat(10, this.peso);
                stm.setFloat(11, this.altura);
                stm.setFloat(12, this.imc);
                stm.setDate(13, this.dataConsulta);
                System.out.println(stm);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    
	public boolean alterarProntuario() {
	// declarando comando de execucao do banco de dados
            String sql  = "UPDATE prontuario ";
                   sql += "set   tipoSangue     = ?, ";
                   sql += "      limitCognitiva = ?,  ";
                   sql += "      limitLocomocao = ?,  ";
                   sql += "      limitVisao     = ?,  ";
                   sql += "      limitAudicao   = ?,  ";
                   sql += "      limitOutras    = ?,  ";
                   sql += "      descAlergia    = ?,  ";
                   sql += "      descOcupacao   = ?,  ";
                   sql += "      cpfPaciente    = ?,  ";
                   sql += "      peso           = ?,  ";
                   sql += "      altura         = ?,  ";
                   sql += "      imc            = ?,  ";
                   sql += "      dataConsulta   = ?   ";
                   sql += "where idProntuario = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.tipoSangue);
                stm.setBoolean(2, this.limitCognitiva);
                stm.setBoolean(3, this.limitLocomocao);
                stm.setBoolean(4, this.limitVisao);
                stm.setBoolean(5, this.limitAudicao);
                stm.setString(6, this.limitOutras);
                stm.setString(7, this.descAlergia);
                stm.setString(8, this.descOcupacao);
                stm.setString(9, this.cpfPaciente);
                stm.setFloat(10, this.peso);
                stm.setFloat(11, this.altura);
                stm.setFloat(12, this.imc);
                stm.setDate(13, this.dataConsulta);
                stm.setInt(14, this.idProntuario);
                System.out.println(stm);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

	public boolean excluirProntuario() {
        // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM prontuario ";
               sql += " WHERE idProntuario = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idProntuario);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}
        
	public Prontuario consultarProntuario(Integer idPront) {
            this.idProntuario = idPront;
            // declarando comando de execucao do banco de dados
            String  sql  = " select idProntuario, tipoSangue, limitCognitiva, limitLocomocao, limitVisao, limitAudicao, limitOutras, descAlergia, descOcupacao, cpfPaciente, peso, altura, imc, dataConsulta ";
                    sql += " from prontuario ";
                    sql += " where idProntuario = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Prontuario pro = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idProntuario);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   pro = new Prontuario();
                   pro.setIdProntuario(rs.getInt("idProntuario"));
                   pro.setTipoSangue(rs.getString("tipoSangue"));
                   pro.setLimitCognitiva(rs.getBoolean("limitCognitiva"));
                   pro.setLimitVisao(rs.getBoolean("limitVisao"));
                   pro.setLimitAudicao(rs.getBoolean("limitAudicao"));
                   pro.setLimitLocomocao(rs.getBoolean("limitLocomocao"));
                   pro.setLimitOutras(rs.getString("limitOutras"));
                   pro.setDescAlergia(rs.getString("descAlergia"));
                   pro.setDescOcupacao(rs.getString("descOcupacao"));
                   pro.setCpfPaciente(rs.getString("cpfPaciente")); 
                   pro.setPeso(rs.getFloat("peso"));
                   pro.setAltura(rs.getFloat("altura"));
                   pro.setImc(rs.getFloat("imc"));
                   pro.setDataConsulta(rs.getDate("dataConsulta"));
                   System.out.println(stm);
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return pro;
	}
 
	public Prontuario consultarProntuario(String cpfPaciente) {
            this.cpfPaciente = cpfPaciente;
            // declarando comando de execucao do banco de dados
            String  sql  = " select idProntuario, tipoSangue, limitCognitiva, limitLocomocao, limitVisao, limitAudicao, limitOutras, descAlergia, descOcupacao, cpfPaciente, peso, altura, imc, dataConsulta ";
                    sql += " from prontuario ";
                    sql += " where cpfPaciente = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Prontuario pro = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpfPaciente);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   pro = new Prontuario();
                   pro.setIdProntuario(rs.getInt("idProntuario"));
                   pro.setTipoSangue(rs.getString("tipoSangue"));
                   pro.setLimitCognitiva(rs.getBoolean("limitCognitiva"));
                   pro.setLimitVisao(rs.getBoolean("limitVisao"));
                   pro.setLimitAudicao(rs.getBoolean("limitAudicao"));
                   pro.setLimitLocomocao(rs.getBoolean("limitLocomocao"));
                   pro.setLimitOutras(rs.getString("limitOutras"));
                   pro.setDescAlergia(rs.getString("descAlergia"));
                   pro.setDescOcupacao(rs.getString("descOcupacao"));
                   pro.setCpfPaciente(rs.getString("cpfPaciente")); 
                   pro.setPeso(rs.getFloat("peso"));
                   pro.setAltura(rs.getFloat("altura"));
                   pro.setImc(rs.getFloat("imc"));
                   pro.setDataConsulta(rs.getDate("dataConsulta"));
                   System.out.println(stm);
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return pro;
	}
        
    public List<Prontuario> consultarGeral(){
        List<Prontuario> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = " select * from prontuario order by idProntuario";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Prontuario pro = new Prontuario();
                   pro.setIdProntuario(rs.getInt("idProntuario"));
                   pro.setTipoSangue(rs.getString("tipoSangue"));
                   pro.setLimitCognitiva(rs.getBoolean("limitCognitiva"));
                   pro.setLimitVisao(rs.getBoolean("limitVisao"));
                   pro.setLimitAudicao(rs.getBoolean("limitAudicao"));
                   pro.setLimitLocomocao(rs.getBoolean("limitLocomocao"));
                   pro.setLimitOutras(rs.getString("limitOutras"));
                   pro.setDescAlergia(rs.getString("descAlergia"));
                   pro.setDescOcupacao(rs.getString("descOcupacao"));
                   pro.setCpfPaciente(rs.getString("cpfPaciente"));
                   pro.setPeso(rs.getFloat("peso"));
                   pro.setAltura(rs.getFloat("altura"));
                   pro.setImc(rs.getFloat("imc"));
                   pro.setDataConsulta(rs.getDate("dataConsulta"));
                   lista.add(pro);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
    
    public List<Prontuario> consultarProntuarioPaciente(Paciente paciente){
        this.cpfPaciente = paciente.getCpfPaciente();
        List<Prontuario> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String  sql  = " select idProntuario, tipoSangue, peso, altura, imc, limitCognitiva, limitLocomocao, limitVisao, limitAudicao, limitOutras, descAlergia, descOcupacao, cpfPaciente, dataConsulta " ;
                    sql += " from prontuario ";
                    sql += " where cpfPaciente = ? ";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpfPaciente);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Prontuario pro = new Prontuario();
                   pro.setIdProntuario(rs.getInt("idProntuario"));
                   pro.setTipoSangue(rs.getString("tipoSangue"));
                   pro.setLimitCognitiva(rs.getBoolean("limitCognitiva"));
                   pro.setLimitVisao(rs.getBoolean("limitVisao"));
                   pro.setLimitAudicao(rs.getBoolean("limitAudicao"));
                   pro.setLimitLocomocao(rs.getBoolean("limitLocomocao"));
                   pro.setLimitOutras(rs.getString("limitOutras"));
                   pro.setDescAlergia(rs.getString("descAlergia"));
                   pro.setDescOcupacao(rs.getString("descOcupacao"));
                   pro.setCpfPaciente(rs.getString("cpfPaciente"));
                   pro.setPeso(rs.getFloat("peso"));
                   pro.setAltura(rs.getFloat("altura"));
                   pro.setImc(rs.getFloat("imc"));
                   pro.setDataConsulta(rs.getDate("dataConsulta"));
                   lista.add(pro);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
    public int getIdProntuario() {
        return idProntuario;
    }

    public void setIdProntuario(int idProntuario) {
        this.idProntuario = idProntuario;
    }
    
    public String getTipoSangue() {
        return tipoSangue;
    }

    public void setTipoSangue(String tipoSangue) {
        this.tipoSangue = tipoSangue;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }

    public float getImc() {
        return imc;
    }

    public void setImc(float imc) {
        this.imc = imc;
    }

    public boolean isLimitCognitiva() {
        return limitCognitiva;
    }

    public void setLimitCognitiva(boolean limitCognitiva) {
        this.limitCognitiva = limitCognitiva;
    }

    public boolean isLimitLocomocao() {
        return limitLocomocao;
    }

    public void setLimitLocomocao(boolean limitLocomocao) {
        this.limitLocomocao = limitLocomocao;
    }

    public boolean isLimitVisao() {
        return limitVisao;
    }

    public void setLimitVisao(boolean limitVisao) {
        this.limitVisao = limitVisao;
    }

    public boolean isLimitAudicao() {
        return limitAudicao;
    }

    public void setLimitAudicao(boolean limitAudicao) {
        this.limitAudicao = limitAudicao;
    }

    public String getLimitOutras() {
        return limitOutras;
    }

    public void setLimitOutras(String limitOutras) {
        this.limitOutras = limitOutras;
    }

    public String getDescAlergia() {
        return descAlergia;
    }

    public void setDescAlergia(String descAlergia) {
        this.descAlergia = descAlergia;
    }

    public String getDescOcupacao() {
        return descOcupacao;
    }

    public void setDescOcupacao(String descOcupacao) {
        this.descOcupacao = descOcupacao;
    }
    
     public String getCpfPaciente() {
        return cpfPaciente;
    }

    public void setCpfPaciente(String cpfPaciente) {
        this.cpfPaciente = cpfPaciente;
    }
    
     public Paciente getPacienteProntuario() {
        return pacienteProntuario.consultarPaciente(this.cpfPaciente);
    }

    public void setPacienteProntuario(Paciente pacienteProntuario) {
        this.pacienteProntuario = pacienteProntuario;
    }
    
     public Date getDataConsulta() {
        return dataConsulta;
    }

    public void setDataConsulta(Date dataConsulta) {
        this.dataConsulta = dataConsulta;
    }
}

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

public class Paciente {

    private int idPaciente; // serial
    private String nome;
    private String cpfPaciente;
    private String rg;
    private Date dataNascimento;
    private Integer idQuarto;
    private Integer enderecoPaciente;
    private String nomeContato;
    private String foneContato;
    private Quarto quartoPaciente;
    private Endereco enderecoCompletoPaciente;

    @Override
    public String toString() {
        return "Paciente{" + "idPaciente=" + idPaciente + "nome=" + nome + ", cpfPaciente=" + cpfPaciente + ", rg=" + rg + ", dataNascimento=" + dataNascimento + ", idQuarto=" + idQuarto + ", enderecoPaciente=" + enderecoPaciente + "nomeContato=" + nomeContato + "foneContato=" + nomeContato + '}';
    }

     public Paciente() {
     quartoPaciente = new Quarto();
     enderecoCompletoPaciente = new Endereco();
        }
     
     public boolean incluirPaciente() {
            // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO paciente ";
                   sql += "(nome, cpfPaciente, rg, datanascimento, idQuarto, enderecoPaciente, nomeContato, foneContato)";
                   sql += "VALUES(?,?,?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.nome);
                stm.setString(2, this.cpfPaciente);
                stm.setString(3, this.rg);
                stm.setDate(4, this.dataNascimento);
                stm.setInt(5, this.idQuarto);
                stm.setInt(6, this.enderecoPaciente);
                stm.setString(7, this.nomeContato);
                stm.setString(8, this.foneContato);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    
	public boolean alterarPaciente() {
	// declarando comando de execucao do banco de dados
            String sql  = "UPDATE paciente ";
                   sql += "set   nome             = ?, ";
                   sql += "      rg               = ?, ";
                   sql += "      cpfPaciente      = ?, ";
                   sql += "      dataNascimento   = ?, ";
                   sql += "      idQuarto         = ?, ";
                   sql += "      enderecoPaciente = ?, ";
                   sql += "      nomeContato      = ?, ";
                   sql += "      foneContato      = ?  ";
                   sql += "where idPaciente       = ?  ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.nome);
                stm.setString(2, this.rg);
                stm.setString(3, this.cpfPaciente);
                stm.setDate  (4, this.dataNascimento);
                stm.setInt   (5, this.idQuarto);
                stm.setInt   (6, this.enderecoPaciente);
                stm.setString(7, this.nomeContato);
                stm.setString(8, this.foneContato);
                stm.setInt   (9, this.idPaciente);
                System.out.println(stm);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

	public boolean excluirPaciente() {
        // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM paciente ";
               sql += "WHERE idPaciente = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idPaciente);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

	public Paciente consultarPaciente(String pcpfPac) {
            this.cpfPaciente = pcpfPac;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idPaciente, nome, cpfPaciente, rg, dataNascimento, idQuarto, enderecoPaciente, nomeContato, foneContato ";
                    sql += "from paciente ";
                    sql += "where cpfPaciente = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Paciente pac = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cpfPaciente);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   pac = new Paciente();
                   pac.setIdPaciente(rs.getInt("idPaciente"));
                   pac.setNome(rs.getString("nome"));
                   pac.setCpfPaciente(rs.getString("cpfPaciente"));
                   pac.setRg(rs.getString("rg"));
                   pac.setDataNascimento(rs.getDate("datanascimento"));
                   pac.setIdQuarto(rs.getInt("idQuarto"));
                   pac.setEnderecoPaciente(rs.getInt("enderecoPaciente"));
                   pac.setNomeContato(rs.getString("nomeContato"));
                   pac.setFoneContato(rs.getString("foneContato"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return pac;
	}
        
        public Paciente consultarPacienteId( Integer pidPac) {
            this.idPaciente = pidPac;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idPaciente, nome, cpfPaciente, rg, dataNascimento, idQuarto, enderecoPaciente, nomeContato, foneContato ";
                    sql += "from paciente ";
                    sql += "where idPaciente = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Paciente pac = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idPaciente);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   pac = new Paciente();
                   pac.setIdPaciente(rs.getInt("idPaciente"));
                   pac.setNome(rs.getString("nome"));
                   pac.setCpfPaciente(rs.getString("cpfPaciente"));
                   pac.setRg(rs.getString("rg"));
                   pac.setDataNascimento(rs.getDate("datanascimento"));
                   pac.setIdQuarto(rs.getInt("idQuarto"));
                   pac.setEnderecoPaciente(rs.getInt("enderecoPaciente"));
                   pac.setNomeContato(rs.getString("nomeContato"));
                   pac.setFoneContato(rs.getString("foneContato"));
                    System.out.println(pac);
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return pac;
        }
        
    public List<Paciente> consultarGeral(){
        List<Paciente> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = "select * from paciente order by nome";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Paciente  pac = new Paciente();
               pac.setIdPaciente(rs.getInt("idPaciente"));
               pac.setNome(rs.getString("nome"));
               pac.setCpfPaciente(rs.getString("cpfPaciente"));
               pac.setRg(rs.getString("rg"));
               pac.setDataNascimento(rs.getDate("dataNascimento"));
               pac.setIdQuarto(rs.getInt("idQuarto"));
               pac.setEnderecoPaciente(rs.getInt("enderecoPaciente"));
               pac.setNomeContato(rs.getString("nomeContato"));
               pac.setFoneContato(rs.getString("foneContato"));
               lista.add(pac);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
     public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpfPaciente() {
        return cpfPaciente;
    }

    public void setCpfPaciente(String cpfPaciente) {
        this.cpfPaciente = cpfPaciente;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
    
   
    public Integer getIdQuarto() {
        return idQuarto;
    }

    public void setIdQuarto(Integer idQuarto) {
        this.idQuarto = idQuarto;
    }
    
    public Integer getEnderecoPaciente() {
        return enderecoPaciente;
    }

    public void setEnderecoPaciente(Integer enderecoPaciente) {
        this.enderecoPaciente = enderecoPaciente;
    }
    
     public String getNomeContato() {
        return nomeContato;
    }

    public void setNomeContato(String nomeContato) {
        this.nomeContato = nomeContato;
    }
    
     public String getFoneContato() {
        return foneContato;
    }

    public void setFoneContato(String foneContato) {
        this.foneContato = foneContato;
    }
    
     public Quarto getQuartoPaciente() {
        return quartoPaciente.consultarQuarto(this.idQuarto);
    }

    public void setQuartoPaciente(Integer idQuarto) {
        this.quartoPaciente = quartoPaciente;
    }
     public Endereco getEnderecoCompletoPaciente() {
        return enderecoCompletoPaciente.consultarEndereco(this.enderecoPaciente);
    }

    public void setEnderecoCompletoPaciente(Integer enderecoPaciente) {
        this.enderecoCompletoPaciente = enderecoCompletoPaciente;
    }
}

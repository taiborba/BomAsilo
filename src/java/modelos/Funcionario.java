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
import java.sql.Date;

public class Funcionario {
    private int idFuncionario;
    private String nome;
    private String cpfFuncionario;
    private String rg;
    private Integer idCargo;
    private Cargo cargoFun;
    private String regProfissional;
    private Date dataAdmissao;
    private Date dataDesliga;
    private String emailFuncionario;
    private String foneFuncionario;
    private String loginFuncionario;
    private Integer enderecoFuncionario;
    private Endereco enderecoCompletoFuncionario;

    @Override
    public String toString() {
        return "Funcionario{" + "idFuncionario=" + idFuncionario + ", nome=" + nome + ", cpfFuncionario=" + cpfFuncionario + ", rg=" + rg + ", idCargo=" + idCargo + ", regProfissional=" + regProfissional + ", dataAdmissao=" + dataAdmissao + ", dataDesliga=" + dataDesliga + ", emailFuncionario=" + emailFuncionario + ", foneFuncionario=" + foneFuncionario + ", loginFuncionario=" + loginFuncionario + ", enderecoFuncionario=" + enderecoFuncionario + '}';
    }

    /* Construtor do Funcionario  */
    public Funcionario() {
     enderecoCompletoFuncionario = new Endereco(); 
     cargoFun = new Cargo();
    }
    


    public boolean incluirFuncionario() {
         // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO funcionario ";
                   sql += "( nome, cpfFuncionario, rg, idCargo, regProfissional, ";
                   sql += " dataAdmissao, dataDesliga, emailFuncionario, foneFuncionario, ";
                   sql += " loginFuncionario, enderecoFuncionario)";
                   sql += " VALUES(?,?,?,?,?,?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.nome);
                stm.setString(2, this.cpfFuncionario);
                stm.setString(3, this.rg);
                stm.setInt(4, this.idCargo);
                stm.setString(5, this.regProfissional);
                stm.setDate(6, this.dataAdmissao);
                stm.setDate(7, this.dataDesliga);
                stm.setString(8, this.emailFuncionario);
                stm.setString(9, this.foneFuncionario);
                stm.setString(10, this.loginFuncionario);
                stm.setInt(11, this.enderecoFuncionario);
                System.out.println(stm);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    
    public  boolean alterarFuncionario() {
        // declarando comando de execucao do banco de dados
            String sql  = "UPDATE funcionario ";
                   sql += " set nome             = ?, ";
                   sql += "    rg               = ?, ";
                   sql += "    idCargo          = ?, ";
                   sql += "    regProfissional  = ?, ";
                   sql += "    dataAdmissao     = ?, ";
                   sql += "    dataDesliga      = ?, ";
                   sql += "    emailFuncionario = ?, ";
                   sql += "    foneFuncionario  = ?, ";
                   sql += "    cpfFuncionario  = ? ";                   
                   sql += " where idFuncionario = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.nome);
                stm.setString(2, this.rg);
                stm.setInt(3, this.idCargo);
                stm.setString(4, this.regProfissional);
                stm.setDate(5, this.dataAdmissao);
                stm.setDate(6, this.dataDesliga);
                stm.setString(7, this.emailFuncionario);
                stm.setString(8, this.foneFuncionario);
                stm.setString(9, this.cpfFuncionario);
                stm.setInt(10, this.idFuncionario);
                System.out.println(stm);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false
                        ; 
            }
            return true;	
	}

    public boolean excluirFuncionario() {
        // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM funcionario ";
               sql += " WHERE idFuncionario = ? ";
              
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idFuncionario);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;               
            }

    public Funcionario consultarFuncionario(Integer pIdFuncionario) {
            this.idFuncionario = pIdFuncionario;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idFuncionario, nome, cpfFuncionario, rg, idCargo, regProfissional, dataAdmissao, ";
                    sql += " dataDesliga, emailFuncionario, foneFuncionario, loginFuncionario, enderecoFuncionario";
                    sql += " from funcionario ";
                    sql += " where idFuncionario = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Funcionario fun = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idFuncionario);
                System.out.println(stm);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    fun = new Funcionario();
                    fun.setIdFuncionario(rs.getInt("idFuncionario"));
                    fun.setNome(rs.getString("nome"));
                    fun.setCpfFuncionario(rs.getString("cpfFuncionario"));
                    fun.setRg(rs.getString("rg"));
                    fun.setIdCargo(rs.getInt("idCargo"));
                    fun.setRegProfissional(rs.getString("regProfissional"));
                    fun.setDataAdmissao(rs.getDate("dataAdmissao"));
                    fun.setDataDesliga(rs.getDate("dataDesliga"));
                    fun.setEmailFuncionario(rs.getString("emailFuncionario"));
                    fun.setFoneFuncionario(rs.getString("foneFuncionario"));
                    fun.setLoginFuncionario(rs.getString("loginFuncionario"));
                    fun.setEnderecoFuncionario(rs.getInt("enderecoFuncionario"));
                    } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return fun;
	}
    public List<Funcionario> consultarGeral(){
        List<Funcionario> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = "select * from funcionario order by nome";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Funcionario  fun = new Funcionario();
                fun.setIdFuncionario(rs.getInt("idFuncionario"));
                fun.setNome(rs.getString("nome"));
                fun.setCpfFuncionario(rs.getString("cpfFuncionario"));
                fun.setRg(rs.getString("rg"));
                fun.setIdCargo(rs.getInt("idCargo"));
                fun.setRegProfissional(rs.getString("regProfissional"));
                fun.setDataAdmissao(rs.getDate("dataAdmissao"));
                fun.setDataDesliga(rs.getDate("dataDesliga"));
                fun.setEmailFuncionario(rs.getString("emailFuncionario"));
                fun.setFoneFuncionario(rs.getString("foneFuncionario"));
                fun.setLoginFuncionario(rs.getString("loginFuncionario"));
                fun.setEnderecoFuncionario(rs.getInt("enderecoFuncionario"));
                lista.add(fun);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
    
    //INICIO GETTERS AND SETTERS
   
    public int getIdFuncionario() {
        return idFuncionario;
    }

    public void setIdFuncionario(int idFuncionario) {
        this.idFuncionario = idFuncionario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpfFuncionario() {
        return cpfFuncionario;
    }

    public void setCpfFuncionario(String cpfFuncionario) {
        this.cpfFuncionario = cpfFuncionario;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Integer getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Integer idCargo) {
        this.idCargo = idCargo;
    }
    
    public Cargo getCargoFuncionario() {
        return cargoFun.consultarCargo(this.idCargo);
    }

    public void setCargoFuncionario(Cargo cargoFuncionario) {
        this.cargoFun = cargoFun;
    }

    public String getRegProfissional() {
        return regProfissional;
    }

    public void setRegProfissional(String regProfissional) {
        this.regProfissional = regProfissional;
    }

    public Date getDataAdmissao() {
        return dataAdmissao;
    }

    public void setDataAdmissao(Date dataAdmissao) {
        this.dataAdmissao = dataAdmissao;
    }

    public Date getDataDesliga() {
        return dataDesliga;
    }

    public void setDataDesliga(Date dataDesliga) {
        this.dataDesliga = dataDesliga;
    }

    public String getEmailFuncionario() {
        return emailFuncionario;
    }

    public void setEmailFuncionario(String emailFuncionario) {
        this.emailFuncionario = emailFuncionario;
    }

    public String getFoneFuncionario() {
        return foneFuncionario;
    }

    public void setFoneFuncionario(String foneFuncionario) {
        this.foneFuncionario = foneFuncionario;
    }
    public String getLoginFuncionario() {
        return loginFuncionario;
    }

    public void setLoginFuncionario(String loginFuncionario) {
        this.loginFuncionario = loginFuncionario;
    }

    public Integer getEnderecoFuncionario() {
        return enderecoFuncionario;
    }

    public void setEnderecoFuncionario(Integer enderecoFuncionario) {
        this.enderecoFuncionario = enderecoFuncionario;
    }
    
    public Endereco getEnderecoCompletoFuncionario() {
        return enderecoCompletoFuncionario.consultarEndereco(this.enderecoFuncionario);
    }

    public void setEnderecoCompletoFuncionario(Endereco enderecoFuncionario) {
        this.enderecoCompletoFuncionario = enderecoCompletoFuncionario;
    }

}

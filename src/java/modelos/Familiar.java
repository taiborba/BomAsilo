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
import java.util.Date;
import java.util.List;

import util.Conexao;

public class Familiar {

    private int idFamiliar;
    private String nome;
    private String cpfFamiliar;
    private String rg;
    private String foneFixo;
    private String foneCelular;
    private String cpfPaciente;
    private Paciente pacienteFamiliar;
    private String loginFamiliar;
    private Usuario usuarioFamiliar;
    private Integer enderecoFamiliar;
    private Endereco enderecoCompletoFamiliar;

    @Override
    public String toString() {
        return "Familiar{" + "nome=" + nome + ", cpfFamiliar=" + cpfFamiliar + ", rg=" + rg + ", foneFixo=" + foneFixo + ", foneCelular=" + foneCelular + ", cpfPaciente=" + cpfPaciente + ", loginFamiliar=" + loginFamiliar + ", enderecoFamiliar=" + enderecoFamiliar + '}';
    }

    /* Construtor do Familiar  */
    public Familiar() {
        enderecoCompletoFamiliar = new Endereco();
        pacienteFamiliar = new Paciente();
        usuarioFamiliar = new Usuario();
    }

    public boolean incluirFamiliar() {
        // declarando comando de execucao do banco de dados
        String sql = "INSERT INTO familiar ";
        sql += " (nome, cpfFamiliar, rg, foneFixo, foneCelular, cpfPaciente, loginFamiliar, enderecoFamiliar)";
        sql += " VALUES(?,?,?,?,?,?,?,?)";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpfFamiliar);
            stm.setString(3, this.rg);
            stm.setString(4, this.foneFixo);
            stm.setString(5, this.foneCelular);
            stm.setString(6, this.cpfPaciente);
            stm.setString(7, this.loginFamiliar);
            stm.setInt(8, this.enderecoFamiliar);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterarFamiliar() {
        // declarando comando de execucao do banco de dados
        String sql = "UPDATE familiar ";
        sql += "set nome          = ?, ";
        sql += "    rg            = ?, ";
        sql += "    foneFixo      = ?,  ";
        sql += "    foneCelular   = ?,  ";
        sql += "    cpfPaciente   = ?,  ";
        sql += "    loginFamiliar = ?,  ";
        sql += "    enderecoFamiliar = ?,  ";
        sql += "    cpfFamiliar = ?  ";
        sql += " where idFamiliar = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.rg);
            stm.setString(3, this.foneFixo);
            stm.setString(4, this.foneCelular);
            stm.setString(5, this.cpfPaciente);
            stm.setString(6, this.loginFamiliar);
            stm.setInt(7, this.enderecoFamiliar);
            stm.setString(8, this.cpfFamiliar);
            stm.setInt(9, this.idFamiliar);
            System.out.println(stm);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluirFamiliar() {
        // declarando comando de execucao do banco de dados
        String sql = "DELETE FROM familiar ";
        sql += " WHERE idFamiliar = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idFamiliar);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public Familiar consultarFamiliar(Integer IdFamiliar) {
        this.idFamiliar = IdFamiliar;
        // declarando comando de execucao do banco de dados
        String sql = "select idFamiliar, nome, cpfFamiliar, rg, foneFixo, foneCelular, cpfPaciente, loginFamiliar, enderecoFamiliar ";
        sql += " from familiar ";
        sql += " where idFamiliar = ?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        //
        Familiar fam = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idFamiliar);
            System.out.println(stm);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                fam = new Familiar();
                fam.setIdFamiliar(Integer.parseInt(rs.getString("idFamiliar")));
                fam.setNome(rs.getString("nome"));
                fam.setCpfFamiliar(rs.getString("cpfFamiliar"));
                fam.setRg(rs.getString("rg"));
                fam.setFoneFixo(rs.getString("foneFixo"));
                fam.setFoneCelular(rs.getString("foneCelular"));
                fam.setCpfPaciente(rs.getString("cpfPaciente"));
                fam.setLoginFamiliar(rs.getString("loginFamiliar"));
                fam.setEnderecoFamiliar(Integer.parseInt(rs.getString("enderecoFamiliar")));

            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return fam;
    }

    public Familiar consultarFamiliar(String usuarioFamiliar) {
        this.loginFamiliar = usuarioFamiliar;
        // declarando comando de execucao do banco de dados
        String sql = "select idFamiliar, nome, cpfFamiliar, rg, foneFixo, foneCelular, cpfPaciente, loginFamiliar, enderecoFamiliar ";
        sql += " from familiar ";
        sql += " where loginFamiliar = ?";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        //
        Familiar fam = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.loginFamiliar);
            System.out.println(stm);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                fam = new Familiar();
                fam.setIdFamiliar(Integer.parseInt(rs.getString("idFamiliar")));
                fam.setNome(rs.getString("nome"));
                fam.setCpfFamiliar(rs.getString("cpfFamiliar"));
                fam.setRg(rs.getString("rg"));
                fam.setFoneFixo(rs.getString("foneFixo"));
                fam.setFoneCelular(rs.getString("foneCelular"));
                fam.setCpfPaciente(rs.getString("cpfPaciente"));
                fam.setLoginFamiliar(rs.getString("loginFamiliar"));
                fam.setEnderecoFamiliar(Integer.parseInt(rs.getString("enderecoFamiliar")));
                System.out.println(fam);

            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return fam;
    }

    public List<Familiar> consultarGeral() {
        List<Familiar> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = "select * from familiar order by nome";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Familiar f = new Familiar();
                f.setIdFamiliar(Integer.parseInt(rs.getString("idFamiliar")));
                f.setNome(rs.getString("nome"));
                f.setCpfFamiliar(rs.getString("cpfFamiliar"));
                f.setRg(rs.getString("rg"));
                f.setFoneFixo(rs.getString("foneFixo"));
                f.setFoneCelular(rs.getString("foneCelular"));
                f.setCpfPaciente(rs.getString("cpfPaciente"));
                f.setLoginFamiliar(rs.getString("loginFamiliar"));
                f.setEnderecoFamiliar(Integer.parseInt(rs.getString("enderecoFamiliar")));
                lista.add(f);
            }
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    public Integer getIdFamiliar() {
        return idFamiliar;
    }

    public void setIdFamiliar(Integer idFamiliar) {
        this.idFamiliar = idFamiliar;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpfFamiliar() {
        return cpfFamiliar;
    }

    public void setCpfFamiliar(String cpfFamiliar) {
        this.cpfFamiliar = cpfFamiliar;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getFoneFixo() {
        return foneFixo;
    }

    public void setFoneFixo(String foneFixo) {
        this.foneFixo = foneFixo;
    }

    public String getFoneCelular() {
        return foneCelular;
    }

    public void setFoneCelular(String foneCelular) {
        this.foneCelular = foneCelular;
    }

    public String getCpfPaciente() {
        return cpfPaciente;
    }

    public void setCpfPaciente(String cpfPaciente) {
        this.cpfPaciente = cpfPaciente;
    }

    public String getLoginFamiliar() {
        return loginFamiliar;
    }

    public void setLoginFamiliar(String loginFamiliar) {
        this.loginFamiliar = loginFamiliar;
    }

    public Integer getEnderecoFamiliar() {
        return enderecoFamiliar;
    }

    public void setEnderecoFamiliar(Integer enderecoFamiliar) {
        this.enderecoFamiliar = enderecoFamiliar;
    }

    public Endereco getEnderecoCompletoFamiliar() {
        return enderecoCompletoFamiliar.consultarEndereco(this.enderecoFamiliar);
    }

    public void setEnderecoCompletoFamiliar(Endereco enderecoFamiliar) {
        this.enderecoCompletoFamiliar = enderecoCompletoFamiliar;
    }

    public Paciente getPacienteFamiliar() {
        return pacienteFamiliar.consultarPaciente(this.cpfPaciente);
    }

    public void setPacienteFamiliar(Paciente pacienteFamiliar) {
        this.pacienteFamiliar = pacienteFamiliar;
    }

    public Usuario getUsuarioFamiliar() {
        return usuarioFamiliar.consultarUsuario(this.loginFamiliar);
    }

    public void setUsuarioFamiliar(Usuario usuarioFamiliar) {
        this.usuarioFamiliar = usuarioFamiliar;
    }

}

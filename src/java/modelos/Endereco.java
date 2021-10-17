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

public class Endereco {
    private int idEndereco; // serial
    private String cep;
    private String rua;
    private int nr;
    private String complemento;
    private String bairro;
    private String cidade;
    private String uf;
    
    @Override
    public String toString() {
        return "Endereco{" + "idEndereco=" + idEndereco + ", cep=" + cep + ", rua=" + rua + ", nr=" + nr + ", complemento=" + complemento + ", bairro=" + bairro + ", cidade=" + cidade + ", uf=" + uf + '}';
    }

   
    
    public boolean incluirEndereco() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO endereco ";
                   sql += " (cep, rua, nr, complemento, bairro, cidade, uf)";
                   sql += "VALUES(?,?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.cep);
                stm.setString(2, this.rua);
                stm.setInt(3, this.nr);
                stm.setString(4, this.complemento);
                stm.setString(5, this.bairro);
                stm.setString(6, this.cidade);
                stm.setString(7, this.uf);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }

    public boolean alterarEndereco() {
       // declarando comando de execucao do banco de dados
            String sql  = "UPDATE endereco ";
                   sql += "set rua           = ?, ";
                   sql += "    nr            = ?, ";
                   sql += "    complemento   = ?, ";
                   sql += "    bairro        = ?, ";
                   sql += "    cidade        = ?, ";
                   sql += "    uf            = ?, ";
                    sql += "   cep           = ? ";
                   sql += "where idEndereco = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.rua);
                stm.setInt(2, this.nr);
                stm.setString(3, this.complemento);
                stm.setString(4, this.bairro);
                stm.setString(5, this.cidade);
                stm.setString(6, this.uf);
                stm.setString(7, this.cep);
                stm.setInt(8, this.idEndereco);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirEndereco() {
   // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM endereco ";
               sql += "WHERE idEndereco = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idEndereco);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Endereco consultarEndereco(Integer pIdEndereco) {
    this.idEndereco = pIdEndereco;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idendereco, cep, rua, nr, complemento, bairro, cidade, uf ";
                    sql += " from endereco ";
                    sql += " where idendereco = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Endereco end = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idEndereco);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   end = new Endereco();
                   end.setIdEndereco(rs.getInt("idendereco"));
                   end.setCep(rs.getString("cep"));
                   end.setRua(rs.getString("rua"));
                   end.setNr(rs.getInt("nr"));
                   end.setComplemento(rs.getString("complemento"));
                   end.setBairro(rs.getString("bairro"));
                   end.setCidade(rs.getString("cidade"));
                   end.setUf(rs.getString("uf"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return end;
	}
 public List<Endereco> consultarGeral(){
        List<Endereco> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from endereco order by cep";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Endereco  endereco = new Endereco();
               endereco.setIdEndereco(rs.getInt("idEndereco"));
               endereco.setCep(rs.getString("cep"));
               endereco.setRua(rs.getString("rua"));
               endereco.setNr(rs.getInt("nr"));
               endereco.setComplemento(rs.getString("complemento"));
               endereco.setBairro(rs.getString("bairro"));
               endereco.setCidade(rs.getString("cidade"));
               endereco.setUf(rs.getString("uf"));
               lista.add(endereco);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

   public int getIdEndereco() {
        return idEndereco;
    }

    public void setIdEndereco(int idendereco) {
        this.idEndereco = idendereco;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNr() {
        return nr;
    }

    public void setNr(int nr) {
        this.nr = nr;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

   

}
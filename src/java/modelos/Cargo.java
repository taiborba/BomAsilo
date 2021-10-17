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

public class Cargo {
    private int idCargo;
    private String descCargo;

   
    @Override
    public String toString() {
        return "Cargo{" + "idCargo=" + idCargo + ", descCargo=" + descCargo + '}';
    }

    public boolean incluirCargo() {
       
// declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO cargo ";
                   sql += " (descCargo)";
                   sql += " VALUES(?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.descCargo);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
    public boolean alterarCargo() {
        // declarando comando de execucao do banco de dados
            String sql  = "UPDATE cargo ";
                   sql += " set descCargo = ? ";
                   sql += " where idCargo = ? ";
                   
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, this.descCargo);
                stm.setInt(2, this.idCargo);
                System.out.println(stm);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}
    
    public boolean excluirCargo() {
        // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM cargo ";
               sql += " WHERE descCargo = ? ";
             
                              
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.descCargo);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
    }

    public Cargo consultarCargo(Integer pIdCargo) {
            this.idCargo = pIdCargo;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idCargo, descCargo";
                    sql += " from cargo ";
                    sql += " where idCargo = ?";
                   
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Cargo car = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idCargo);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   car = new Cargo();
                   car.setIdCargo(rs.getInt("idCargo"));
                   car.setDescCargo(rs.getString("descCargo"));
                } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return car;
	}
    public List<Cargo> consultarGeral(){
        List<Cargo> lista = new ArrayList<>();
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // declarando comando de execucao do banco de dados
        String sql = "select * from cargo order by descCargo";
        //
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Cargo  car = new Cargo();
               car.setIdCargo(rs.getInt("idCargo"));
               car.setDescCargo(rs.getString("descCargo"));
               lista.add(car);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }
    
//INICIO GETTERS AND SETTERS
 public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public String getDescCargo() {
        return descCargo;
    }

    public void setDescCargo(String descCargo) {
        this.descCargo = descCargo;
    }

}
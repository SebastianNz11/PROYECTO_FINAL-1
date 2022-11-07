package ModeloClientes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

public class Cliente extends Persona {

    Conexion cn;
    private Object ex;

    public Cliente() {
    }

    public Cliente(int id, String nombres, String apellidos, String nit, String genero, String telefono, String correo_electronico, String fecha_ingreso) {
        super(id, nombres, apellidos, nit, genero,telefono, correo_electronico, fecha_ingreso);
    }

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT id_cliente, nombres, apellidos, nit, genero, telefono, correo_electronico, fecha_ingreso FROM proyecto_final.clientes;"; 
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id", "nombres", "apellidos", "nit", "genero", "telefono", "correo_electronico","fecha_ingreso"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[8];
            while (consulta.next()) {
                datos[0] = consulta.getString("id_cliente");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("nit"); 
                datos[4] = consulta.getString("genero");
                datos[5] = consulta.getString("telefono");
                datos[6] = consulta.getString("correo_electronico");
                datos[7] = consulta.getString("fecha_ingreso");
                tabla.addRow(datos);
            }

            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return tabla;
    }

    public int agregar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "INSERT INTO proyecto_final.clientes(nombres, apellidos, nit, genero, telefono, correo_electronico, fecha_ingreso) values(?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNombres());
            parametro.setString(2, getApellidos());
            parametro.setString(3, getNit());        
            parametro.setString(4, getGenero());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreo_electronico());
            parametro.setString(7, getFecha_ingreso());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    public int modificar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "update clientes set nombres=?, apellidos=?, nit=?, genero=?, telefono=?, correo_electronico=?, fecha_ingreso=? where id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNombres());
            parametro.setString(2, getApellidos());
            parametro.setString(3, getNit());        
            parametro.setString(4, getGenero());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getCorreo_electronico());
            parametro.setString(7, getFecha_ingreso());
            parametro.setInt(8, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }
    
    @Override
    public int eliminar (){
        int retorno =0;
        try{
            PreparedStatement parametro;
            cn = new Conexion();
            String query = "delete from clientes where id_cliente = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    return retorno;
    }

    

}

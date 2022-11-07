package ModeloEmpleados;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import javax.swing.table.DefaultTableModel;

public class Empleado extends Persona {

    private String dpi;
    private int id_puesto;
    Conexion cn;
    private Object ex;

    public Empleado() {
    }

    public Empleado(int id_puesto, int id, String nombres, String apellidos, String direccion, String telefono, String dpi, String genero, String fecha_nacimiento, String fecha_labores, String fecha_ingreso) {
        super(id, nombres, apellidos, direccion, telefono, genero, fecha_nacimiento, fecha_labores, fecha_ingreso);
        this.dpi = dpi;
        this.id_puesto = id_puesto;
    }

    public String getDpi() {
        return dpi;
    }

    public void setDpi(String dpi) {
        this.dpi = dpi;
    }

    public int getId_puesto() {
        return id_puesto;
    }

    public void setId_puesto(int id_puesto) {
        this.id_puesto = id_puesto;
    }

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            cn = new Conexion();
            cn.abrir_conexion();
            String query = "SELECT e.id_empleado as id,e.nombres,e.apellidos,e.direccion,e.telefono,e.dpi,e.genero,e.fecha_nacimiento,e.fecha_inicio_labores,e.fecha_ingreso,p.puesto,p.id_puesto FROM empleados as e inner join puestos as p on e.id_puesto = p.id_puesto;";
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id", "nombres", "apellidos", "direccion", "telefono", "dpi", "genero", "fecha_nacimiento", "puesto", "id_puesto","fecha_ingreso","fecha_inicio_labores"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[12];
            while (consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("nombres");
                datos[2] = consulta.getString("apellidos");
                datos[3] = consulta.getString("direccion");
                datos[4] = consulta.getString("telefono");
                datos[5] = consulta.getString("dpi");
                datos[6] = consulta.getString("genero");
                datos[7] = consulta.getString("fecha_nacimiento");
               
                datos[8] = consulta.getString("fecha_inicio_labores");
                  datos[9] = consulta.getString("fecha_ingreso");
                
                 datos[10] = consulta.getString("puesto");
                
              
                datos[11] = consulta.getString("id_puesto");

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
            String query = "INSERT INTO empleados(nombres,apellidos,direccion,telefono,dpi,genero,fecha_nacimiento,id_puesto,fecha_inicio_labores,fecha_ingreso) values(?,?,?,?,?,?,?,?,?,?);";
            cn.abrir_conexion();
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNombres());
            parametro.setString(2, getApellidos());
            parametro.setString(3, getDireccion());
            parametro.setString(4, getTelefono());
            parametro.setString(5, getDpi());
            parametro.setString(6, getGenero());
            parametro.setString(7, getFecha_nacimiento());
            parametro.setInt(8, getId_puesto());
            parametro.setString(9, getFecha_labores());
            parametro.setString(10, getFecha_ingreso());
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
            String query = "update empleados set nombres=?,apellidos=?,direccion=?,telefono=?,dpi=?,genero=?,fecha_nacimiento=?,id_puesto=?,fecha_inicio_labores=?,fecha_ingreso=? where id_empleado = ?;";
            cn.abrir_conexion();
            parametro = (PreparedStatement)cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getNombres());
            parametro.setString(2, getApellidos());
            parametro.setString(3, getDireccion());
            parametro.setString(4, getTelefono());
            parametro.setString(5, getDpi());
            parametro.setString(6, getGenero());
            parametro.setString(7, getFecha_nacimiento());
            parametro.setInt(8, getId_puesto());
            parametro.setString(9, getFecha_labores());
            parametro.setString(10, getFecha_ingreso());
            parametro.setInt(11, getId());
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
            String query = "delete from empleados  where id_empleado = ?;";
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

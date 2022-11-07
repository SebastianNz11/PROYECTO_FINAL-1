
package modeloPue;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class Conexion {
    public Connection conexionBD;
    private final String puerto = "3306"; 
    private final String bd= "proyecto_final";
    private final String urlConexion = String.format("jdbc:mysql://localhost:3306/proyecto_final", bd);
    private final String usuario = "sebas11";
    private final String contra = "12345";
    private final String jdbc = "com.mysql.cj.jdbc.Driver";
    
    
    public void abrir_conexion(){
        try {
            Class.forName(jdbc);
            conexionBD = DriverManager.getConnection(urlConexion, usuario, contra);
            
   
        }catch (ClassNotFoundException | SQLException ex){
            System.out.println("Error" + ex.getMessage());
            
        }
    }
            public void cerrar_conexion(){
            
            try{
                conexionBD.close();
                
            }catch(SQLException ex){
                System.out.println("Error" + ex.getMessage());
            }
        }

}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;
import ConfiguracionLogo.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sebas
 */
public class UsuarioDAO {
    
     Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
      
   public Usuario Validar(int documento, String pass) {
        Usuario usuario = new Usuario();
        String consulta = "SELECT * FROM usuarios WHERE documento = ? AND password = ?;";
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, documento);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            rs.next();
            do {
                usuario.setId(rs.getInt("id"));
                usuario.setDocumento(rs.getInt("documento"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setPassword(rs.getString("password"));
                usuario.setCorreo(rs.getString("correo"));
                
                usuario.setEstado(rs.getString("estado"));
                usuario.setRol(rs.getString("Rol"));
                
            } while (rs.next());
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return usuario;

    }

}

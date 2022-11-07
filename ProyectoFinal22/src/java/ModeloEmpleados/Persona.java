
package ModeloEmpleados;


 abstract public class Persona {
    private int id;
    private String nombres, apellidos, direccion, telefono,genero,fecha_nacimiento,fecha_labores,fecha_ingreso;
    
    public Persona(){}

    public Persona(int id, String nombres, String apellidos, String direccion, String telefono, String genero, String fecha_nacimiento, String fecha_labores, String fecha_ingreso) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.telefono = telefono;
        this.genero = genero;
        this.fecha_nacimiento = fecha_nacimiento;
        this.fecha_labores = fecha_labores;
        this.fecha_ingreso = fecha_ingreso;
    }
   
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getFecha_labores() {
        return fecha_labores;
    }

    public void setFecha_labores(String fecha_labores) {
        this.fecha_labores = fecha_labores;
    }

    public String getFecha_ingreso() {
        return fecha_ingreso;
    }

    public void setFecha_ingreso(String fecha_ingreso) {
        this.fecha_ingreso = fecha_ingreso;
    }
    
    public int crear(){return 0;}
    public int modificar(){return 0;}
    public int eliminar(){return 0;}
}

<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modeloPro.Proveedor" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>
    <body>
        <!-- BARRA DE NAVEGACIÓN -->
        <nav class="navbar navbar-expand-sm bg-info navbar-dark justify-content-center">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="hola.jsp">INICIO</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="empleados.jsp">EMPLEADOS</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="clientes.jsp">CLIENTES</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="marcas.jsp">MARCAS</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="proveedores.jsp">PROVEEDORES</a>
                </li>
                 <li class="nav-item active">
                    <a class="nav-link" href="puestos.jsp">PUESTOS</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link text-danger" href="index.jsp">CERRAR SESION</a>
                </li>
            </ul>
        </nav>
        <!-- FIN BARRA DE NAVEGACIÓN -->
        <br>
        <br> 
        
        
        <div class="container mt-3">
        <h1>Proveedores</h1>

        <div class="modal fade" id="modal_proveedor">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Formulario Proveedor</h4>
       </div>    
        <div class="modal-body">
        <form action="sr_proveedor" method="post" class="form-group">
                <span class="input-group-text" id="addon-wrapping">Id Proveedor</span>
                <input type="text" name="txt_id_proveedor" id="txt_id_proveedor" value="0" class="form-control" readonly> 
            <br>
                <span class="input-group-text" id="addon-wrapping">Proveedor</span>
                <input type="text" name="txt_proveedor" id="txt_proveedor" class="form-control" placeholder="Felipe"  required>
            <br>
                <span class="input-group-text" id="addon-wrapping">Nit</span>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="1111111" required>
            <br>
                <span class="input-group-text" id="addon-wrapping">Direccion</span>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Guatemala" required>
            <br>
                <span class="input-group-text" id="addon-wrapping">Telefono</span>
                <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="5555" required>
            <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-success">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-info">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button> 
        </form>
        </div>
      </div>
    </div>
  </div>
  
            <table class="table table-bordered" >
                <thead class="table-success">
                <tr>
                    <th>Proveedor</th>
                    <th>Nit</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                </tr>
                </thead>
                <tbody id="tbl_proveedor">
                <% 
                    Proveedor proveedor = new Proveedor();
                    DefaultTableModel tabla = new DefaultTableModel();
                    tabla = proveedor.leer();
                    for (int t= 0; t<tabla.getRowCount(); t++) {
                            out.println("<tr data-id="+ tabla.getValueAt(t, 0)+">");
                            out.println("<td>"+ tabla.getValueAt (t,1) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,2) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,3) + "</td>");
                            out.println("<td>"+ tabla.getValueAt (t,4) + "</td>");
                            out.println("</tr>");
                        }
                  %>

                </tbody>
                
            </table>
                  
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_proveedor" onclick="limpiar()">Nuevo</button>
                  </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
        <script type="text/javascript">
            function limpiar(){
                $('#txt_id_proveedor').val(0);
                $('#txt_proveedor').val('');
                $('#txt_nit').val('');
                $('#txt_direccion').val('');
                $('#txt_telefono').val('');
    
            }
            
            $('#tbl_proveedor').on('click','tr td',function(evt){
                var target,id,proveedor,nit,direccion,telefono;
                target = $(event.target);
                id =            target.parent().data('id');
                proveedor =     target.parent("tr").find("td").eq(0).html();
                nit =           target.parent("tr").find("td").eq(1).html();
                direccion =     target.parent("tr").find("td").eq(2).html();
                telefono =      target.parent("tr").find("td").eq(3).html();
                
                
                $('#txt_id_proveedor').val(id);
                $('#txt_proveedor').val(proveedor);
                $('#txt_nit').val(nit);
                $('#txt_direccion').val(direccion);
                $('#txt_telefono').val(telefono);
                $("#modal_proveedor").modal('show');
            });
            
            
        </script> 
        
    </body>
</html>

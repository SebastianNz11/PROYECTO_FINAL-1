<%-- 
    Document   : index
    Created on : 20/10/2022, 17:05:23
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modeloPue.Puesto"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Puestos</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
        <div class="container">
            <h1>Formulario Puestos</h1>
        </div>
        <div class="container">
            <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_puesto" onclick ="limpiar()">
Nuevo
</button>

<!-- Modal -->
<div class="modal fade" id="modal_puesto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Puestos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="sr_puesto" method="post" class=form-group">           

                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value ="0" readonly>

                <label for="lbl_nombres"><b>Puesto:</b></label> 
                <input type="text" name="txt_puesto" id="txt_puesto" class="form-control" placeholder="Ejemplo: Programador" required>
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg">Agregar</button> 
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success btn-lg">Modificar</button> 
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>
            </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
                        
            <table class="table table-striped">
                <thead>
                    <tr>            
                        <th>Puestos</th>
                    </tr>
                </thead>
                <tbody id="tbl_puesto">
                    <%
                        Puesto puesto = new Puesto();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = puesto.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("</tr>"); 
                        }
                    %>      
                </tbody>
            </table>        
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
        <script type="text/javascript">
            function limpiar(){
                $("#txt_id").val(0);
                $("#txt_puesto").val('');
                
            }
            $('#tbl_puesto').on('click', 'tr td', function (evt) {
                var target, id, puesto;
                target = $(event.target);
                id = target.parent().data('id');
                puesto = target.parent("tr").find("td").eq(0).html();
                $("#txt_id").val(id);
                $("#txt_puesto").val(puesto);
                $("#modal_puesto").modal('show');
            });
        </script>
    </body>
</html>

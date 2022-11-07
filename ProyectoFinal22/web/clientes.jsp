<%-- 
    Document   : index
    Created on : 25/10/2022, 20:22:27
    Author     : nacho
--%>

<%@page import="ModeloClientes.Cliente" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
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

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#modal" onclick="limpiar()">Nuevo</button>

        <div class="container">
            <form action="cliente_sr" method="post" class="form-group was-validated">
             
    <div class="modal fade" id="modal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>
        <div class="modal-body">
          <fieldset class="container p-3 my-3 border">
                    <h2 class=" text-center">Formulario Clientes</h2>
                    <label for="lbl_id" class=" col-form-label-lg"><b>ID:</b></label>
                    <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly>
                    <label for="lbl_nombres" class=" col-form-label-lg"><b>Nombres:</b></label>
                    <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Nombre 1 y Nombre 2" required>
                    <label for="lbl_apellidos" class=" col-form-label-lg"><b>Apellidos:</b></label>
                    <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Apellido 1 y Apellido 2" required>
                    <label for="lbl_nit" class=" col-form-label-lg"><b>NIT:</b></label>
                    <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="0000000-0" required>
                   
                    <br>
                    <label for="lbl_genero" class=" col-form-label-lg"><b>Género:</b></label>
                    <select name="genero">
                        <option value="Hombre">Hombre</option>
                        <option value="Mujer">Mujer</option>
                    </select>
                    <br>
                    
                     <label for="lbl_telefono" class=" col-form-label-lg"><b>Telefono:</b></label>
                    <input type="text" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="0000-0000" required>
                                          
                    <label for="lbl_correo_electronico" class=" col-form-label-lg" ><b>Correo Electronico:</b></label>
                    <input type="text" name="txt_correo_electronico" id="txt_correo_electronico" class="form-control" required>
                    
                    <label for="lbl_ingre" class=" col-form-label-lg"><b>Fecha de Ingreso:</b></label>
                    <input type="date" name="txt_ingre" id="txt_ingre" class="form-control" required>
                </fieldset>

                <br>
                <fieldset  class="container p-5 my-5 border">
                    <div class="row justify-content-around ">
                        <div class="">
                            <button name="btn_agregar" id="btn_agregar"  class="btn btn-success btn-lg" value="agregar"><b>Agregar</b></button>
                        </div>
                        <div class="">
                            <button name="btn_modificar" id="btn_modificar"  class="btn btn-warning btn-lg" value="modificar"><b>Modificar</b></button>
                        </div>
                        <div class="">
                            <button name="btn_eliminar" id="btn_eliminar"  class="btn btn-danger btn-lg" value="eliminar" onclick="javascript:if (!confirm('¿Desea Eliminar?'))
                                        return false"><b>Eliminar</b></button>
                        </div>

                    </div>
                </fieldset>
        </div>
        <div class="modal-footer">
            <div class="">
                        <button type="button" class="btn btn-warning" data-dismiss="modal"><b>Cerrar</b></button>
        </div>    
        </div>
      </div>
      
    </div>
  </div>              
            </form>
            <br>
            <br>
            <br>
            <h2 class=" text-center">Tabla De Clientes </h2>
            <br>
            <table class="table table-striped table-bordered table-sm text-center">
                <thead class="table-primary">
                    <tr>

                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>NIT</th>
                        <th>Genero</th>
                        <th>Telefono</th>
                        <th>Correo Electronico</th>   
                        <th>Fecha Ingreso</th>
                    </tr>
                </thead>
                <tbody id="tbl_clientes" >
                    <%
                        Cliente cliente = new Cliente();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = cliente.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0)+ ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
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
                                 function limpiar() {
                                 $("#txt_id").val(0);
                                 $("#txt_nombres").val('');
                                 $("#txt_apellidos").val('');
                                 $("#txt_nit").val('');
                                 $("#genero").val('');
                                 $("#txt_telefono").val('');
                                 $("#txt_correo_electronico").val('');
                                 $("#txt_ingre").val('');                               
                                 }

                                $('#tbl_clientes').on('click', 'tr td', function (evt) {
                                    var target, id, nombres, apellidos, nit, genero, telefono, correo_electronico, ingreso;
                                    target = $(event.target);
                                    id = target.parent().data('id');
                                    nombres = target.parent("tr").find("td").eq(0).html();
                                    apellidos = target.parent("tr").find("td").eq(1).html();
                                    nit = target.parent("tr").find("td").eq(2).html();
                                    genero = target.parent("tr").find("td").eq(3).html();
                                    telefono = target.parent("tr").find("td").eq(4).html();
                                    correo_electronico = target.parent("tr").find("td").eq(5).html();
                                    ingreso = target.parent("tr").find("td").eq(6).html();

                                    $("#txt_id").val(id);
                                    $("#txt_nombres").val(nombres);
                                    $("#txt_apellidos").val(apellidos);
                                    $("#txt_nit").val(nit);                     
                                    $("#genero").val(genero);
                                    $("#txt_telefono").val(telefono);
                                    $("#txt_correo_electronico").val(correo_electronico);
                                    $("#txt_ingre").val(ingreso);
                                    $("#modal").modal('show');
                                });

        </script>
    </body>
</html>

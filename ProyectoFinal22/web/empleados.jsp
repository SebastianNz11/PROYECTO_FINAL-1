<%-- 
    Document   : index
    Created on : 5/10/2022, 06:22:27
    Author     : sebas
--%>

<%@page import="ModeloEmpleados.Puesto" %>
<%@page import="ModeloEmpleados.Empleado" %>
<%@page import="java.util.HashMap" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EMPLEADOS</title>
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
            <form action="empleado_sr" method="post" class="form-group was-validated">
                <fieldset class="container p-3 my-3 border">
                    <h2 class=" text-center">FORMULARIO</h2>
                    <label for="lbl_id" class=" col-form-label-lg"><b>ID:</b></label>
                    <input type="text" name="txt_id" id="txt_id" class="form-control"  value="0" readonly>
                    <label for="lbl_nombres" class=" col-form-label-lg"><b>Nombres:</b></label>
                    <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre 1 y Nombre 2" required>
                    <label for="lbl_apellidos" class=" col-form-label-lg"><b>Apellidos:</b></label>
                    <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido 1 y Apellido 2" required>
                    <label for="lbl_direccion" class=" col-form-label-lg"><b>Direccion:</b></label>
                    <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: No. Casa, Calle, Zona, Ciudad" required>
                    <label for="lbl_telefono" class=" col-form-label-lg"><b>Telefono:</b></label>
                    <input type="tel" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 0000-0000" required>
                    <label for="lbl_dpi" class=" col-form-label-lg"><b>DPI:</b></label>
                    <input type="text" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="123456789" required>
                    <br>
                    <label for="lbl_genero" class=" col-form-label-lg"><b>Género:    </b></label>
                    <select name="genero">
                        <option value="Hombre">Hombre</option>
                        <option value="Mujer">Mujer</option>

                    </select>
                    <br>
                    <label for="lbl_fn" class=" col-form-label-lg"><b>Fecha de Nacimiento:</b></label>
                    <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                    <label for="lbl_puesto" class=" col-form-label-lg"><b>Puesto:</b></label>
                    <select id="drop_puesto" class="form-control" name="drop_puesto">
                        <%
                            Puesto puesto = new Puesto();
                            HashMap<String, String> drop = puesto.drop_puesto();
                            for (String i : drop.keySet()) {
                                out.println("<option value=" + i + ">" + drop.get(i) + "</option>");
                            }
                        %>

                    </select>

                    <label for="lbl_fil" class=" col-form-label-lg" ><b>Fecha de Inicio de Labores:</b></label>
                    <input type="date" name="txt_fil" id="txt_fil" class="form-control" required>
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
            </form>
            <br>
            <br>
            <br>
            <h2 class=" text-center">TABLA   DE DATOS </h2>
            <br>
            <table class="table table-striped table-bordered table-sm text-center">
                <thead class="table-primary">
                    <tr>

                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>DPI</th>
                        <th>Genero</th>
                        <th>Fecha de Nacimiento</th> 
                        <th>Fecha Inicio de Labores</th>
                        <th>Fecha Ingreso</th>
                        <th>Puesto</th>

                    </tr>
                </thead>
                <tbody id="tbl_empleados" >
                    <%
                        Empleado empleado = new Empleado();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = empleado.leer();
                        for (int t = 0; t < tabla.getRowCount(); t++) {
                            out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-id_p=" + tabla.getValueAt(t, 11) + ">");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 7) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 8) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 9) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 10) + "</td>");

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
                                    $("#txt_codigo").val('');
                                    $("#txt_nombres").val('');
                                    $("#txt_apellidos").val('');
                                    $("#txt_direccion").val('');
                                    $("#txt_telefono").val('');
                                    $("#txt_dpi").val('');
                                    $("#txt_genero").val('');
                                    $("#txt_fn").val('');
                                    $("#drop_puesto").val(1);
                                    $("#txt_ingre").val('');
                                    $("#txt_fil").val('');

                                }

                                $('#tbl_empleados').on('click', 'tr td', function (evt) {
                                    var target, id, id_p, nombres, apellidos, direccion, telefono, dpi, genero, nacimiento, ingreso, inicio;
                                    target = $(event.target);
                                    id = target.parent().data('id');
                                    id_p = target.parent().data('id_p');
                                    nombres = target.parent("tr").find("td").eq(0).html();
                                    apellidos = target.parent("tr").find("td").eq(1).html();
                                    direccion = target.parent("tr").find("td").eq(2).html();
                                    telefono = target.parent("tr").find("td").eq(3).html();
                                    dpi = target.parent("tr").find("td").eq(4).html();
                                    genero = target.parent("tr").find("td").eq(5).html();
                                    nacimiento = target.parent("tr").find("td").eq(6).html();
                                    inicio = target.parent("tr").find("td").eq(7).html();
                                    ingreso = target.parent("tr").find("td").eq(8).html();



                                    $("#txt_id").val(id);
                                    $("#txt_nombres").val(nombres);
                                    $("#txt_apellidos").val(apellidos);
                                    $("#txt_direccion").val(direccion);
                                    $("#txt_telefono").val(telefono);
                                    $("#txt_dpi").val(dpi);
                                    $("#txt_genero").val(genero);
                                    $("#txt_fn").val(nacimiento);

                                    $("#txt_ingre").val(ingreso);
                                    $("#txt_fil").val(inicio);
                                    $("#drop_puesto").val(id_p);

                                });



        </script>

    </body>
</html>

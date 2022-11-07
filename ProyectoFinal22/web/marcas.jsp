<%-- 
    Document   : index
    Created on : 8 oct. 2022, 13:26:46
    Author     : IVAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Marca"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marcas</title>
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
        <div class="container">
            <h1>Formulario Marcas</h1>
        </div>
        <%--Boton nuevo de limpiar--%>
        <div class="container">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_marca" onclick="limpiar()">Nuevo</button>
        </div>
        
        <%--Modal--%>
        <div class="container">
            <div class="modal fade" id="modal_marca" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="sr_marca" method="post" action="/send.php" class=form-group">           

                                <label for="lbl_id"><b>ID:</b></label>
                                <input type="text" name="txt_id" id="txt_id" class="form-control" value ="0" readonly>

                                <label for="lbl_nombres"><b>Marca:</b></label> 
                                <input type="text" name="txt_marca" id="txt_marca" class="form-control" placeholder="Eejemplo: Samsung" required>
                                <br>

                                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button> 
                                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-success">Modificar</button> 
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if (!confirm('¿Desea Eliminar'))
                                            return false">Eliminar</button>
                                <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
                            </form> 
                        </div>
                    </div>      
                </div>
            </div>            
            <table class="table table-striped">
                <thead>
                    <tr>            
                        <th>Marcas</th>
                    </tr>
                </thead>
                <tbody id="tbl_marca">
                    <%
                        Marca marca = new Marca();
                        DefaultTableModel tabla = new DefaultTableModel();
                        tabla = marca.leer();
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
                                    function limpiar() {
                                        $("#txt_id").val(0);
                                        $("#txt_marca").val('');
                                    }

                                    $('#tbl_marca').on('click', 'tr td', function (evt) {
                                        var target, id, marca;
                                        target = $(event.target);
                                        id = target.parent().data('id');
                                        marca = target.parent("tr").find("td").eq(0).html();
                                        $("#txt_id").val(id);
                                        $("#txt_marca").val(marca);
                                        $("#modal_marca").modal('show');
                                    });
        </script>
    </body>
</html>

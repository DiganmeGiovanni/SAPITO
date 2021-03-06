<%-- 
    Document   : indexactivofijo
    Created on : Feb 7, 2015, 3:15:33 AM
    Author     : Usuario
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="resources/css/sapito.css">

        <!-- Bootstrap Core CSS -->
            <link href="resources/css/libs/bootstrap.min.css" rel="stylesheet" type="text/css">

        <!-- Morris css -->
            <link href="resources/css/libs/morris.css" rel="stylesheet" type="text/css">

        <!-- Custom CSS -->
            <link href="resources/css/libs/sb-admin.css" rel="stylesheet" type="text/css">

        <!-- Custom Fonts -->
            <link href="resources/css/libs/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- PARA FECHA -->
        <link href="resources/css/activofijo/jquery-ui.css" rel="stylesheet" />

        <title>SAPito</title>
    </head>
    <body>
        <div id="wrapper">
            <%@include file="Menu.jsp"%>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Asignar Activo Fijo
                            </h1>                        
                        </div>
                    </div>        
                    <center>
                        <div class="row">
                            <div class="col-lg-12 text-left">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <br/>                            
                                        <div class="panel panel-green">
                                            <div class="panel-heading">
                                                <h3 class="panel-title" >Datos</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-lg-12 text-left"> 
                                                        <form action="gdaActivoFijo" method="post">                                                                 
                                                            <div class="form-group ">
                                                                <label class="control-label" >Departamento</label>
                                                                <select id="combo-dpto" name="departamento" class="form-control" required="true">
                                                                    <option value="">Selecciona Departamento</option>
                                                                    <c:forEach var="depto" items="${depto}">
                                                                        <option value="${depto.id}">${depto.nombreDepartamento} ${depto.id}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <input type="hidden" name="idAF" class="form-control" value="${lastAF.id}" />
                                                            </div>
                                                            <div class="form-group ">
                                                                <label class="control-label" >Propietario</label>
                                                                <select id="combo-empleados" name="propietario" class="form-control"required="true">
                                                                    <option value="">Selecciona Propietario</option>
                                                                    
                                                                </select>
                                                            </div>   
                                                            <div class="form-group ">
                                                                <label class="control-label" >Depreciación</label>
                                                                <select name="depreciacion" class="form-control" required="true">
                                                                    <option value="">Selecciona tipo de depreciación</option>
                                                                    <option value="Linea recta">Línea recta</option>
                                                                    <option value="Suma de digitos anuales">Suma de dígitos anuales</option>
                                                                    <option value="Doble saldo decreciente">Doble saldo decreciente</option>
                                                                </select>
                                                            </div>   
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                 
                                        <div class="form-group text-right">
                                            <!-- Bootstrap Core JavaScript 	-->
                                            <a href="alta" onclick="return confirm('¿Est&aacute; seguro de cancelar la operaci&oacute;n?');"><input type="button" class="btn btn-success" value="Cancelar"></a>
                                            <input type="submit" class="btn btn-success" value="Continuar">
                                        </div>                                     
                                        </form>
                                        <!--                          Fin Codigo Para panel 5 o menos input -->
                                    </div>
                                    <!--                      Fin TODO aqui abajo-->               
                                </div>
                            </div>
                        </div>
                    </center>
                </div>
            </div>
        </div>
        <!-- jQuery -->
        <script src="resources/js/libs/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="resources/js/libs/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="resources/js/libs/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="resources/js/libs/sb-admin-2.js"></script>

        <!-- PARA FECHA -->
        <script type="text/javascript" src="resources/js/activofijo/jquery-ui.js"></script>        
        <script type="text/javascript">
            $(document).ready(function() {
                $("#fecha").datepicker({
                    dateFormat: "yy-mm-dd",
                    dayNames: ["Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"],
                    dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                    monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"]
                });
            });
        </script>
        <script type="text/javascript" src="resources/js/activofijo/aActivoFijo.js"></script>        
    </body>
</html>

<%-- 
    Document   : Menude compras
    Created on : 16/02/2015, 10:20:35 PM
    Author     : chef
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../../Default/Modal/proximamente.jsp"%>

<!DOCTYPE html>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="operaciones">SAPito</a>
    </div>
    <!-- /.navbar-header -->

   <ul class="nav navbar-top-links navbar-right">       
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="modal" data-target="#proximamente">
                <i class="fa fa-bell fa-fw"></i><i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-alerts">
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-comment fa-fw"></i> New Comment
                            <span class="pull-right text-muted small">4 minutes ago</span>
                        </div>
                    </a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="#">
                        <div>
                            <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                            <span class="pull-right text-muted small">12 minutes ago</span>
                        </div>
                    </a>
                </li>                                                                                                
            </ul>
            <!-- /.dropdown-alerts -->
        </li>
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> Compras <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                                
                <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Salir</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu"> 
                <li>
                    <a href="compras">Home</a>

                </li>
                <li>
                    <a href="#"><i class="fa fa-dashboard fa-fw"></i> Proveedor <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="altaproveedor">Alta  Proveedor</a>
                            <a href="consultaproveedor">Consultar Proveedores</a>

                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i>Producto<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>

                            <a href="AltaProducto">Alta Producto</a>
                            <a href="ConsultaProducto">Consultar Productos</a>

                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-table fa-fw"></i>Order de Compra<span class="fa arrow"></span></a>

                    <ul class="nav nav-second-level">
                        <li>

                            <a href="ordenCompra">Generar Orden</a>
                            <a href="ConsultarOrdenes">Consulta de Ordenes</a>

                        </li>
                    </ul>
                </li>

            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>

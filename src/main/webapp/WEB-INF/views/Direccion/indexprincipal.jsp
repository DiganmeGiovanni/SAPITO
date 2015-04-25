<%-- 
    Document   : template1
    Created on : 7/02/2015, 02:34:44 AM
    Author     : omar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SAPito</title>

        <!--         Bootstrap Core CSS 
                <link href="../resources/css/libs/bootstrap.min.css" rel="stylesheet">
        
                 MetisMenu CSS 
                <link href="../resources/css/libs/metisMenu.min.css" rel="stylesheet">
        
                 Custom CSS 
                <link href="../resources/css/libs/sb-admin-2.css" rel="stylesheet">
        
                 Custom Fonts 
                <link href="../resources/css/libs/font-awesome.min.css" rel="stylesheet" type="text/css">-->
        <%@include file="direccionHead.jsp" %>


    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <%@include file="dirNavs.jsp" %>

            <!-- Page Content -->
            <div id="page-wrapper" >
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">
                                Módulo Dirección
                            </h1>                        
                        </div>
                    </div>   


                </div><!-- Fin del tag del contenedor-->
                <center><img  src ="../resources/img/img11.jpg" ></center> 
                <center>
                    <a class="btn btn-primary" type="button" href="Reportes">Ver reportes</a>  
                    <a class="btn btn-primary" type="button" href="Graficas">Visualizar Gráficas</a>
                </center>

            </div>
            <!-- /#page-wrapper -->
        </div>
        <!-- /#wrapper -->




        <!-- jQuery -->
        <script src="../resources/js/libs/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../resources/js/libs/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../resources/js/libs/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../resources/js/libs/sb-admin-2.js"></script>

    </body>

</html>



<%-- 
    Document   : nvaOrdenVenta
    Created on : Feb 23, 2015, 9:45:30 PM
    Author     : giovanni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <%@include file="ventasHead.jsp" %>
    <title>SAPito - Ventas - Nueva orden</title>
  </head>
  <body>
    <div id="wrapper">

      <!-- Navigation bar -->
      <%@include file="ventasNavs.jsp" %>

      <!-- Page content -->
      <div id="page-wrapper">
        <div class="container-fluid">

          <!-- Page title -->
          <div class="row">
            <div class="col-lg-12">
              <h1 class="page-header">
                Orden de venta
              </h1>
            </div>
          </div>

          <div class="col-md-6">
            <h2>Detalles de la orden</h2>
            <br/><h3>Descuentos</h3>
            <table id="tdescuentos" class="table table-bordered table-hover table-responsive">
              <thead>
                <tr>
                  <th>Concepto</th>
                  <th>Cantidad</th>
                  <th>Editar</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Oferta paquete xxx1</td>
                  <td>$50.94</td>
                  <td><button class="btn btn-success btn-xs">Editar</button></td>
                <tr>
                  <td>Retraso en producción</td>
                  <td>$700.50</td>
                  <td><button class="btn btn-success btn-xs">Editar</button></td>
                </tr>
              </tbody>
            </table>
            <div class="col-sm-4 text-left">
              <button class="btn btn-primary btn-sm">Agregar descuento</button>
            </div>
            <div class="col-sm-8 text-right bg-danger">
              <h4>Descuento total: $751.44 &nbsp;&nbsp;</h4>
            </div>

            <br/><br/><br/><h3>Cargos extra</h3>
            <table id="tcargos" class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th>Concepto</th>
                  <th>Cantidad</th>
                  <th>Editar</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Pedido de entrega urgente</td>
                  <td>$5000.00</td>
                  <td><button class="btn btn-success btn-xs">Editar</button></td>
                <tr>
                  <td>Algun otro cargo</td>
                  <td>$700.50</td>
                  <td><button class="btn btn-success btn-xs">Editar</button></td>
                </tr>
              </tbody>
            </table>
            <div class="col-sm-4 text-left">
              <button class="btn btn-primary btn-sm">Agregar cargo</button>
            </div>
            <div class="col-sm-8 text-right bg-warning">
              <h4>Cargo total: $5700.50 &nbsp;&nbsp;</h4>
            </div>

            <br/><br/><br/><h3>Facturación</h3>
            <div class="btn-group">
              <h5 class=""><input type="radio" name="genfactura" id="inputWalls" value="genfactura" checked>
                Autogenerar factura 
              </h5>

              <h5 class=""><input type="radio" name="genfactura" id="inptWalls" value="nogenfactura">
                Dejar pendiente la generacióñ de factura 
              </h5>
            </div>

          </div>

          <div class="col-md-6">
            <h2>Productos en la orden</h2><br/>
            <table id="tproductos" class="table table-bordered table-hover table-striped table-responsive">
              <thead>
                <tr>
                  <th>Producto</th>
                  <th>Cantidad</th>
                  <th>Precio c/u</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Gansito de prueba</td>
                  <td>50</td>
                  <td>$7.20</td>
                </tr>
                <tr>
                  <td>Motores diesel</td>
                  <td>10</td>
                  <td>$7000.50</td>
                </tr>
                <tr>
                  <td>Parabrisas xtreme</td>
                  <td>80</td>
                  <td>$850.00</td>
                </tr>
                <tr>
                  <td>Tires</td>
                  <td>40</td>
                  <td>$585.00</td>
                </tr>
              </tbody>
            </table>
            <div class="col-sm-4 text-left">
              <button class="btn btn-primary btn-sm">Agregar producto</button>
            </div>
            <div class="col-sm-8 text-right bg-info">
              <h4>Total de orden: $7751.44 &nbsp;&nbsp;</h4>
            </div>
            
            <br/><br/><h3>Entrega a cliente</h3>
            <div class="btn-group">
              <h5 class=""><input type="radio" name="entrega" id="inputWalls" value="inmediata" checked>
                Entrega inmediata 
              </h5>

              <h5 class=""><input type="radio" name="entrega" id="inptWalls" value="noinmediata">
                Solicitar fabricación a producción
              </h5>
            </div>

            <br/><br/><br/>
            <div class="col-sm-9 col-sm-offset-3 bg-info text-right">
              <h4>Total de la orden: $7550.00</h4>
            </div>
            <div class="col-sm-10 col-sm-offset-2 bg-warning text-right">
              <h4>Total con cargos extra: $10550.00</h4>
            </div>
            <div class="col-sm-11 col-sm-offset-1 bg-danger text-right">
              <h4>Total con descuentos: $7550.00</h4>
            </div>
            <div class="col-sm-12 col-sm-offset-0 bg-success text-right">
              <h2>Total final: $7550.00</h2>
            </div>

            <div class="col-sm-12 text-right">
              <br/><br/>
              <button type="button" class="btn btn-danger btn-lg">Cancelar orden</button>
              &nbsp;&nbsp;
              <button type="button" class="btn btn-success btn-lg">Guardar orden</button>
            </div>
          </div>

        </div>
      </div>
    </div>

    <!-- Footer and scripts -->
    <%@include file="ventasFooter.jsp" %>
    <script >
        $(document).ready(function () {
            activatenb('nb-nvaorden');
        });
    </script>
  </body>
</html>

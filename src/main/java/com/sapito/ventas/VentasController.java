/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sapito.ventas;

import com.sapito.config.SecurityUtils;
import com.sapito.db.dao.GenericDao;
import com.sapito.db.entities.Cliente;
import com.sapito.db.entities.Credencial;
import com.sapito.db.entities.Factura;
import com.sapito.db.entities.Inventario;
import com.sapito.db.entities.OrdenVenta;
import com.sapito.db.entities.ProductoVendido;
import com.sapito.db.entities.SancionCliente;
import com.sapito.pdf.PDFView.PDFGeneratorVentas;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * We need repair the master branch
 *
 * @author giovanni
 */
@Controller
public class VentasController
{

    private final SecurityUtils secUtils = new SecurityUtils();

    private GenericDao<Cliente> daoCliente;
    private GenericDao<Inventario> daoInventario;
    private GenericDao<OrdenVenta> daoOrdenVenta;
    private GenericDao<Factura> daoFactura;
    private GenericDao<Credencial> daoCredencial;

    @Autowired
    public void setDaoCliente(GenericDao<Cliente> daoCliente)
    {
        this.daoCliente = daoCliente;
        daoCliente.setClass(Cliente.class);
    }

    @Autowired
    public void setDaoInventario(GenericDao<Inventario> daoInventario)
    {
        this.daoInventario = daoInventario;
        daoInventario.setClass(Inventario.class);
    }

    @Autowired
    public void setDaoOrdenVenta(GenericDao<OrdenVenta> daoOrdenVenta)
    {
        this.daoOrdenVenta = daoOrdenVenta;
        daoOrdenVenta.setClass(OrdenVenta.class);
    }

    @Autowired
    public void setDaoFactura(GenericDao<Factura> daoFactura)
    {
        this.daoFactura = daoFactura;
        daoFactura.setClass(Factura.class);
    }

    @Autowired
    public void setDaoCredencial(GenericDao<Credencial> daoCredencial)
    {
        this.daoCredencial = daoCredencial;
        daoCredencial.setClass(Credencial.class);
    }

    @RequestMapping(value = "ventas", method = RequestMethod.GET)
    public String index(Model model, Principal principal)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/indexVentas";
    }

    @RequestMapping(value = "ventas/nvocliente", method = RequestMethod.GET)
    public String nvoCliente(Model model)
    {
        Cliente cliente = new Cliente();
        cliente.setStatus(true);

        model.addAttribute("cliente", cliente);

        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/nvoCliente";
    }

    @RequestMapping(value = "ventas/nvocliente", method = RequestMethod.POST)
    public String regNvoCliente(Model model, @Valid Cliente cliente, BindingResult bindingResult)
    {
        if(bindingResult.hasErrors())
        {
//            System.out.println("Invalid with: " + bindingResult.getErrorCount() + " errors");
//            System.out.println("Error: " + bindingResult.getFieldError().getField());
            model.addAttribute("authority", secUtils.getAuthority());
            model.addAttribute("username", secUtils.getUsername());
            model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
            return "Ventas/nvoCliente";
        } 
        else
        {
            System.out.println("Se recibe: " + cliente.getNombreContacto());
            daoCliente.create(cliente);

            List<Cliente> clientes = daoCliente.findAll();
            model.addAttribute("clientes", clientes);

            model.addAttribute("authority", secUtils.getAuthority());
            model.addAttribute("username", secUtils.getUsername());
            model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
            return "Ventas/clientes";
        }
    }

    @RequestMapping(value = "ventas/clientes", method = RequestMethod.GET)
    public String clientes(Model model)
    {
        List<Cliente> clientes = daoCliente.findAll();
        model.addAttribute("clientes", clientes);

        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/clientes";
    }

    @RequestMapping(value = "ventas/buscarcliente", method = RequestMethod.GET)
    @ResponseBody
    public Cliente buscarCliente(Model model, String rfc)
    {
        List<Cliente> clientes = daoCliente
                .findBySpecificField("rfc", rfc.trim(), "equal", null, null);

        if(clientes.size() > 0)
        {
            return clientes.get(0);
        } 
        else
        {
            return null;
        }
    }

    @RequestMapping(value = "ventas/buscarproducto", method = RequestMethod.GET)
    @ResponseBody
    public Inventario buscarProductoInventario(Model model, String cinventario)
    {
        List<Inventario> productos = daoInventario
                .findBySpecificField("codigoInventario", cinventario.trim(), "equal", null, null);

        if(productos.size() > 0)
        {
            return productos.get(0);
        } 
        else
        {
            return null;
        }
    }

    @RequestMapping(value = "ventas/vendedores", method = RequestMethod.GET)
    public String vendedores(Model model)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/vendedores";
    }

    @RequestMapping(value = "ventas/nvaorden")
    public String nvaOrdenVentas(Model model)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/nvaOrdenVenta";
    }

    @RequestMapping(value = "ventas/nvaorden", method = RequestMethod.POST)
    @ResponseBody
    public OrdenVenta nvaOrdenVenta(
            Model model, @RequestBody OrdenVentaTransport ordenVentaTransport)
    {
        Cliente cliente = (Cliente) daoCliente.find(ordenVentaTransport.getClientId());

        OrdenVenta orden = new OrdenVenta();
        orden.setCliente(cliente);
        orden.setFechaEntrega(new Date());
        orden.setFechaPedido(new Date());
        orden.setMonto(ordenVentaTransport.getMonto());
        orden.setMontoConCargos(ordenVentaTransport.getMontoConCargos());
        orden.setStatus(ordenVentaTransport.getStatus());

        // Productos en la orden
        List<ProductoVendido> lpv = new ArrayList<>();
        orden.setProductosVendidos(lpv);
        for(ProductoEnOrden peo : ordenVentaTransport.getProductosEnOrden())
        {
            Inventario producto = (Inventario) daoInventario.find(peo.getIdInventario());
            ProductoVendido pv = new ProductoVendido();
            pv.setCantidad(peo.getCantidad());
            pv.setProductoInventario(producto);
            pv.setOrdenVenta(orden);

            // TODO: Decrement available quantity on Inventario
            orden.getProductosVendidos().add(pv);
        }

        // Cargos extra
        List<SancionCliente> cargosExtra = new ArrayList<>();
        orden.setSancionesCliente(cargosExtra);
        for(CargoExtra ce : ordenVentaTransport.getCargosExtra())
        {
            SancionCliente sc = new SancionCliente();
            sc.setDescripcion(ce.getConcepto());
            sc.setMonto(ce.getCantidad());
            sc.setOrdenVenta(orden);

            orden.getSancionesCliente().add(sc);
        }

        // Empleado vendedor
        List<Credencial> credenciales = daoCredencial
                .findBySpecificField("usuario", secUtils.getUsername(), "equal", null, null);
        Credencial credencial = credenciales.get(0);
        orden.setVendedor(credencial.getEmpleado());
        
        daoOrdenVenta.create(orden);
        return orden;
    }

    @RequestMapping(value = "ventas/buscarorden", method = RequestMethod.GET)
    public @ResponseBody
    Cliente buscarOrdenVenta(Model model, String idOrden)
    {
        try { Long.valueOf(idOrden); } catch(NumberFormatException ex) { return null; }

        OrdenVenta orden = (OrdenVenta) daoOrdenVenta.find(Long.valueOf(idOrden));
        return (orden != null && orden.getStatus().compareTo("VENTA") == 0)
                ? orden.getCliente() : null;
    }

    @RequestMapping(value = "ventas/devolverorden", method = RequestMethod.GET)
    @ResponseBody
    public OrdenVenta devolverOrdenVenta(Model model, String idOrden)
    {
        try
        {
            Long.valueOf(idOrden);
        } catch(NumberFormatException ex)
        {
            return null;
        }

        OrdenVenta orden = (OrdenVenta) daoOrdenVenta.find(Long.valueOf(idOrden));
        orden.setStatus("DEVOLUCION");
        orden = (OrdenVenta) daoOrdenVenta.edit(orden);
        return (orden != null) ? orden : null;
    }

    @RequestMapping(value = "ventas/ordenes", method = RequestMethod.GET)
    public String ordenes(Model model)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/ordenes";
    }

    @RequestMapping(value = "ventas/historial", method = RequestMethod.GET)
    public String historial(Model model)
    {
        List<OrdenVenta> ordenes = daoOrdenVenta.findAll();
        model.addAttribute("ordenes", ordenes);
        
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/historialVentas";
    }

    @RequestMapping(value = "ventas/facturas", method = RequestMethod.GET)
    public String facturas(Model model)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/facturas";
    }

    @RequestMapping(value = "ventas/registrarfactura", method = RequestMethod.GET)
    @ResponseBody
    public Factura registrarFactura(Model model, String idOrden)
    {
        try
        {
            Long.valueOf(idOrden);
        } catch(NumberFormatException ex)
        {
            return null;
        }

        OrdenVenta orden = (OrdenVenta) daoOrdenVenta.find(Long.valueOf(idOrden));
        if(orden != null)
        {
            double iva = orden.getMontoConCargos() * 0.16;

            Factura factura = new Factura();
            factura.setIVA(iva);
            factura.setSubTotal(orden.getMontoConCargos());
            factura.setTotal(orden.getMontoConCargos() + iva);
            factura.setOrdenVenta(orden);

            daoFactura.create(factura);

            orden.setFactura(factura);
            daoOrdenVenta.edit(orden);

            return factura;
        } else
        {
            return null;
        }
    }

    @RequestMapping(value = "ventas/testpdf.pdf", method = RequestMethod.GET)
    @ResponseBody
    public String descargarFactura(Model model, HttpServletRequest request, HttpServletResponse response)
    {
        PDFGeneratorVentas pdfView = new PDFGeneratorVentas();
        try
        {
            pdfView.crearPDFFactura(response);
        } catch(Exception ex)
        {
            Logger.getLogger(VentasController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "OK";
    }

    @RequestMapping(value = "ventas/devoluciones", method = RequestMethod.GET)
    public String devolucion(Model model)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/nvaDevolucion";
    }

    @RequestMapping(value = "ventas/cambios", method = RequestMethod.GET)
    public String cambio(Model model)
    {
        model.addAttribute("authority", secUtils.getAuthority());
        model.addAttribute("username", secUtils.getUsername());
        model.addAttribute("nombre", secUtils.getNombre(secUtils.getUsername(), daoCredencial));
        return "Ventas/cambio";
    }

    @RequestMapping(value = "ventas/demoin", method = RequestMethod.GET)
    public @ResponseBody
    List<Inventario> demoInserts(Model model)
    {
        System.out.println("asas");
        for(Iterator it = daoInventario.findAll().iterator(); it.hasNext();)
        {
            Inventario in = (Inventario) it.next();
            daoInventario.remove(in);
        }
        for(Object c1 : daoCliente.findAll())
        {
            Cliente c = (Cliente) c1;
            daoInventario.remove(c);
        }

        // Insert productos
        for(int i = 0; i < 5; i++)
        {
            Inventario inv = new Inventario();
            inv.setCantidad(i + 10);
            inv.setCategoria("Electronicos");
            inv.setCodigoInventario("ABC123" + i);
            inv.setFechaEntrada(new Date(2015, 02, 25));
            inv.setFechaProduccion(new Date(2014, 01, 05));
            inv.setPrecioUnitario(81.5);
            inv.setMaximo(50);
            inv.setMinimo(i);
            inv.setNombre("Producto" + i);
            inv.setUbicacion("Almacen" + i);
            inv.setTipoProducto("MATERIAPRIMA");

            daoInventario.create(inv);
        }

        // Insert clientes
        for(int i = 0; i < 3; i++)
        {
            Cliente cl = new Cliente();
            cl.setApellidoMaternoContacto("Node");
            cl.setApellidoPaternoContacto("Bash");
            cl.setCalle("Nothing");
            cl.setColonia("Some");
            cl.setCp(80800);
            cl.setEmail("cl.test@example.com");
            cl.setEmpresa("Else" + i);
            cl.setPais("Mexico");
            cl.setEstado("Mexico");
            cl.setMunicipio("Metepec");
            cl.setNombreContacto("HeIs");
            cl.setRfc("ABCDEFGHIJKL" + i);
            cl.setStatus(true);

            daoCliente.create(cl);
        }

        // Insert Ordenes venta
        for(int i = 0; i < 3; i++)
        {
            OrdenVenta ov = new OrdenVenta();
            ov.setCliente((Cliente) daoCliente.findAll().get(i));
            ov.setDeposito(true);
            ov.setFechaEntrega(new Date());
            ov.setFechaPedido(new Date());
            ov.setMonto(2000090);
            ov.setMontoConCargos(350000);
            ov.setStatus("VENTA");
            ov.setProductosVendidos(new ArrayList<ProductoVendido>());
            for(int j = 0; j < 5; j++)
            {
                Inventario inv = (Inventario) daoInventario.findAll().get(i);
                ProductoVendido pv = new ProductoVendido();
                pv.setCantidad(i + 1);
                pv.setProductoInventario(inv);
                pv.setOrdenVenta(ov);

                ov.getProductosVendidos().add(pv);
            }

            ov.setSancionesCliente(new ArrayList<SancionCliente>());
            SancionCliente sc = new SancionCliente();
            sc.setDescripcion("Algun cargo extra X");
            sc.setMonto(1000);
            sc.setOrdenVenta(ov);
            ov.getSancionesCliente().add(sc);

            daoOrdenVenta.create(ov);

        }

        return daoInventario.findAll();
    }

}

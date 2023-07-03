const express = require("express");
const auth = require("../middleware/auth");
const {  contable } = require("../middleware/roles");
const { getFacturas,
        getFacturasPorTitular,
        getFacturasPorEmpresa,
        getNumeracionFacturas,
        createFactura,
        getFacturasImpresion,
        anulaFacturas,
        deleteFacturas,
        getFacturasAfip,
        createRegTablaAuxCAE,
        getRegistrosCaeGenerarTXT,
        setFacturaCAE
      } = require('../controllers/contable.controller');  

const router = express.Router();
const {pool}= require('../db/config');


router.get("/facturas", [auth], getFacturas);
router.get("/facturasPorAfiliado", [auth], getFacturasPorTitular);
router.get("/facturasPorEmpresa", [auth], getFacturasPorEmpresa);
router.get("/numeracionPorTipoFactura", [auth], getNumeracionFacturas);
router.post("/createFactura", [auth], createFactura);
router.get("/facturasImpresion", [auth], getFacturasImpresion);
router.put("/anulaFacturas", [auth], anulaFacturas);
router.delete("/deleteFacturas", [auth], deleteFacturas);
router.get("/facturasAfip", [auth], getFacturasAfip);
router.post("/createRegTablaAuxCAE", [auth], createRegTablaAuxCAE);
router.get("/registrosCaeGenerarTXT", [auth], getRegistrosCaeGenerarTXT);
router.put("/setFacturaCAE", [auth], setFacturaCAE);
  
// Todo - implement put
  
// export router
module.exports = router;
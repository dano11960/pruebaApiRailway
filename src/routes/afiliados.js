const express = require("express");
const auth = require("../middleware/auth");
const {  afiliados } = require("../middleware/roles");
const { getAfiliados, 
        getLocalidades, 
        getProvincias,
        getPromotores,
        getAgentesCobro,
        getPlanes,
        getDerivaciones,
        getEmpresas,
        getTipoIva,
        getDerivaFacturacion,
        getMotivosBajas,
        getTipoPatologias,
        getValorCuotaxPlanEmpresa,
        getDeudaAgrupadoAfiliado,
        getAfiliadosPorApenom,
        getTitular,
        getGrupoFamiliar,
        createTitular,
        setTitular,
        deleteFamiliar,
        setFamiliar,
        deleteHistorico_os,
        createHistorico_os,
        deleteAporteAfil,
        createAporteAfil,
        createPatologia,
        deletePatologia,
        createAtencionCliente,
        deleteAtencionCliente,
        getCtaCteDeudores,
        getDatosParaFacturaParcial,
        getDatosAportesParcial,
        getValorPlanPorGrupFam


        
        } = require('../controllers/afiliados.controller');  

const router = express.Router();
const {pool}= require('../db/config');




router.get("/", [auth], getAfiliados);
router.get("/planes", [auth], getPlanes);
router.get("/localidades", [auth], getLocalidades);
router.get("/provincias", [auth], getProvincias);
router.get("/promotores", [auth], getPromotores);
router.get("/cobradores", [auth], getAgentesCobro);
router.get("/empresas", [auth], getEmpresas);
router.get("/derivaciones", [auth], getDerivaciones);
router.get("/tipoIva", [auth], getTipoIva);
router.get("/motivosBajas", [auth], getMotivosBajas);
router.get("/facturacionDerivada", [auth], getDerivaFacturacion);
router.get("/tipoPatologias", [auth], getTipoPatologias);
router.get("/valorCuotaxPlanEmpresa", [auth], getValorCuotaxPlanEmpresa);
router.get("/deudaAfil", [auth], getDeudaAgrupadoAfiliado);
router.get("/alfabeticaAfil", [auth], getAfiliadosPorApenom);
router.get("/titularFull", [auth], getTitular);
router.post("/createTitular", [auth], createTitular);
router.put("/setTitular", [auth], setTitular);
router.delete("/deleteFamiliar", [auth], deleteFamiliar);
router.put("/setFamiliar", [auth], setFamiliar);
router.delete ("/deleteHistorico_os", [auth], deleteHistorico_os);
router.post ("/createHistorico_os", [auth], createHistorico_os);
router.post ("/createPatologia", [auth], createPatologia);
router.delete ("/deletePatologia", [auth], deletePatologia);
router.post ("/createAtencionCliente", [auth], createAtencionCliente);
router.delete ("/deleteAtencionCliente", [auth], deleteAtencionCliente);
router.get("/getCtaCteDeudores", [auth], getCtaCteDeudores);
router.delete ("/deleteAporteAfil", [auth], deleteAporteAfil);
router.post ("/createAporteAfil", [auth], createAporteAfil);
router.get("/dataContratoFacturaParcial", [auth],getDatosParaFacturaParcial);
router.get("/dataAportesFacturaParcial", [auth],getDatosAportesParcial);
router.get("/valorPlanPorGrupFam", [auth],getValorPlanPorGrupFam);

// export router
module.exports = router;
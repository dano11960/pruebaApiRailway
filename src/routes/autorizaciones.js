const express = require("express");
const auth = require("../middleware/auth");
const {  autorizaciones } = require("../middleware/roles");
const { getPrestadores,
        getTotalesHistoricoPracticas,
        createAutorizacion,
        getAutorizaciones} = require('../controllers/autorizaciones.controller');  

const router = express.Router();
const {pool}= require('../db/config');


router.get("/prestadores", [auth], getPrestadores);
router.get("/totalesHistoPracticas", [auth], getTotalesHistoricoPracticas);
router.post("/createAutorizacion", [auth], createAutorizacion);
router.get("/autorizaciones", [auth], getAutorizaciones);
  
// Todo - implement put
  
// export router
module.exports = router;
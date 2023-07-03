const express = require("express");
const auth = require("../middleware/auth");
const {  auditoria } = require("../middleware/roles");
const { getNomenclador} = require('../controllers/auditoria.controller');  

const router = express.Router();
const {pool}= require('../db/config');


router.get("/nomenclador", [auth], getNomenclador);


  
// Todo - implement put
  
// export router
module.exports = router;
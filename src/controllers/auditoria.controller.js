const {pool}= require('../db/config');
const jwt = require("jsonwebtoken");

var instID = (pool['options']['institucionid']);
const JsonKey  = (pool['options']['JsonKey']);


var instID = (pool['options']['institucionid']);

 

const getNomenclador = async (req, res) => {


  query = "select *  from auditoria.v_NomenclaNacional  \n";
  query +=  " where institucionid="  +  instID +  "\n";
  query += " order by codigonn \n";


 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });
 res.status(200).send({ status: "ok", code: 200,  expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                         result:JSON.stringify((await response).rows),     
                         token: tkn });
   
};

module.exports = {
                getNomenclador
                } 
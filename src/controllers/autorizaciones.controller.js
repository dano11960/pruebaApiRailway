const {pool}= require('../db/config');
const jwt = require("jsonwebtoken");

var instID = (pool['options']['institucionid']);
const JsonKey  = (pool['options']['JsonKey']);


var instID = (pool['options']['institucionid']);

const getPrestadores = async (req, res) => {


     query = "select nombre || ' - ' || prestadorid as nomPresta, *  from autorizaciones.prestadores  \n";
     query +=  " where institucionid="  +  instID +  "\n";
     query += " and length(nombre) >=1 \n";
     query += " and estado=0 and fecha_baja is null \n";
     query += " order by nombre \n";


    const response = await pool.query(query);
    const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });
    res.status(200).send({ status: "ok", code: 200,  expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                            result:JSON.stringify((await response).rows),     
                            token: tkn });
      
};

const getTotalesHistoricoPracticas = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  titularid = params['titularid'];
  codfamid = params['codfamid'];


  query = "select EXTRACT('Year' FROM d.fecha_generacion)  as Periodo,  \n";
  query += " n.descripcion, \n";
  query += " d.codigo_practica as CodigoNN, \n";
  query += " SUM(d.cantidad) as Total  \n";
  query += " from autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n \n";
  query += " where d.institucionID=" + instID +  "\n";
  query += "   and d.institucionID = n.institucionID  \n";
  query += "   and d.codigo_practica = n.codigoNN  \n";
  query += "   and d.titularID = " + titularid +  "\n";
  query += "   and d.codfamID = " + codfamid +  "\n";
  query += " group by Periodo,d.codigo_practica, n.descripcion \n";
  query += " order by Periodo desc,d.codigo_practica, n.descripcion \n";

console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });
 res.status(200).send({ status: "ok", code: 200,  expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                         result:JSON.stringify((await response).rows),     
                         token: tkn });
   
};
const createAutorizacion = async (req, res) => {

                                      
      

  var pos = req.user.email.indexOf("@");
  user = req.user.email.substring(0,pos);

  var js = JSON.stringify(req.body);


  var query ="call autorizaciones.sp_createautorizaciones(  \n" ;
  query +=    req.body.titularid + ",\n"; 
  query +=    req.body.codfamid + ",\n"; 
  query +=   instID + ",\n"; //  institucionid
  query +=   "'" + req.body.tipoPrest + "',\n"; 
  query +=   "'" + user + "',\n"; // cusuario 
  query +=   "'" + js + "',\n"; // json con data del front end
  query +=    req.body.autorizacionid + ",\n"; 
  query +=    req.body.internacionid + ",\n"; 
  query +=    req.body.prorrogaid + ")\n"; 

console.log(query);

  const response = await pool.query(query); 
  const tkn = jwt.sign(
    {email: req.user.email},
    JsonKey,
    { expiresIn: "1h" }
);

res.status(200).send({
  status: "ok",
  code: 200,
  expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
  autorizacion:JSON.stringify((await response).rows),

  token: tkn
  });


}; 


const getAutorizaciones = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  titularid = params['titularid'];
  codfamid =  params['codfamid'];
  ambu_interna = params['ambu_interna'];
  parametro = params['param'];


  query = "select * from autorizaciones.autorizaciones d  \n";
  query += " where d.institucionID=" + instID +  "\n";
  if (titularid > 0) {
    query += "   and d.titularID = " + titularid +  "\n";
    query += "   and d.codfamID = " + codfamid +  "\n";
  }else if (ambu_interna == "INTERNACION") {
    query += "   and d.numero_internacion = " + parametro +  "\n";
  } else {
    query += "   and d.autorizacionID = " + parametro +  "\n";
  }
  query += " order by d.autorizacionID desc, d.numero_internacion desc, d.numero_prorroga desc \n";

  const responseAuto = await pool.query(query);

  query = "select d.*, n.descripcion   \n";
  query += " from autorizaciones.detalle_de_autorizaciones d,  \n";
  query += " auditoria.nomenclador_nacional n, \n";
  query += " autorizaciones.autorizaciones a \n";
  query += " where d.institucionID=" + instID +  "\n";
  query += "   and d.institucionID = n.institucionID  \n";
  query += "   and d.institucionID = a.institucionID  \n";
  query += "   and d.autorizacionID = a.autorizacionID  \n";
  query += "   and d.codigo_practica = n.codigoNN  \n";
  if (titularid > 0) {
    query += "   and a.titularID = " + titularid +  "\n";
    query += "   and a.codfamID = " + codfamid +  "\n";
  }else if (ambu_interna =="INTERNACION") {
    query += "   and a.numero_internacion = " + parametro +  "\n";
  } else {
    query += "   and a.autorizacionID = " + parametro +  "\n";
  }

  console.log(query);

 const responsePracticas = await pool.query(query);

 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });
 res.status(200).send({ status: "ok", code: 200,  expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                         autorizacion:JSON.stringify((await responseAuto).rows),    
                         practicas:JSON.stringify((await responsePracticas).rows),                     
                         token: tkn });
   
};
module.exports = {
                  getPrestadores,
                  getTotalesHistoricoPracticas,
                  createAutorizacion,
                  getAutorizaciones
                } 
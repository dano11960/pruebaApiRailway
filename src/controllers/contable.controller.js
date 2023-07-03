const {pool}= require('../db/config');
const jwt = require("jsonwebtoken");

var instID = (pool['options']['institucionid']);
const JsonKey  = (pool['options']['JsonKey']);


var instID = (pool['options']['institucionid']);


const getFacturas = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  centro_emisor = params['centro_emisor'];
  tipo_docu = params['tipo_docu'];
  desde_numero = params['desde_numero'];
  hasta_numero = params['hasta_numero'];

  query = "select * from contable.facturas f, afiliados.titulares t \n";
  query += " where f.institucionID=" + instID +  "\n";
  query += "   and f.institucionID = t.institucionID  \n";
  query += "   and f.titularID = t.titularID \n";
  query += "   and f.numero between " + desde_numero + " and " + hasta_numero +  "\n";
  query += "   and f.tipo_documento = '" + tipo_docu +  "'\n";
  query += "   and f.centro_emisor = " + centro_emisor +  "\n";
  query += " order by  f.tipo_documento, f.centro_emisor, f.numero \n";

console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });
 res.status(200).send({ status: "ok", 
                        code: 200,  
                        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                        result:JSON.stringify((await response).rows),     
                        token: tkn });
   
};

const getFacturasPorTitular = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  titularid = params['titularid'];
  desde_numero = params['desde_numero'];
  hasta_numero = params['hasta_numero'];

  query = "select * from contable.facturas f \n";
  query += " where f.institucionID=" + instID +  "\n";
  query += "   and f.titularID =" + titularid + "\n";
  query += "   and f.numero between " + desde_numero + " and " + hasta_numero +  "\n";
  query += " order by  f.tipo_documento, f.centro_emisor, f.numero \n";

console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });

 if (response.rows[0]== undefined || response.rowCount==0){

  res.status(404).send({
              status: "ok",
              code: 404 ,
              expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
              token: tkn
              });
   return;           
};  
 res.status(200).send({ status: "ok", 
                        code: 200,  
                        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                        result:JSON.stringify((await response).rows),     
                        token: tkn });
   
};

const getFacturasImpresion = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  tipo_mov = params['tipo_mov'];
  letra = params['letra'];
  centro_emisor = params['centro_emisor'];
  desde_numero = params['desde_numero'];
  hasta_numero = params['hasta_numero'];
  fecha_venc = params['fecha_venc'];

  query = "select * from  contable.v_facturas_impresion f \n";
  query += " where f.institucionID=" + instID +  "\n";
  query += "   and f.tipo_documento = '" + tipo_mov + "'\n";
  query += "   and f.letra = '" + letra + "'\n";
  query += "   and f.centro_emisor = " + centro_emisor + "\n";
  query += "   and f.numero between " + desde_numero + " and " + hasta_numero +  "\n";
  query += " order by  f.tipo_documento, f.centro_emisor, f.numero \n";

console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });

 if (response.rows[0]== undefined || response.rowCount==0){

  res.status(404).send({
              status: "ok",
              code: 404 ,
              expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
              token: tkn
              });
   return;           
};  
 res.status(200).send({ status: "ok", 
                        code: 200,  
                        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                        result:JSON.stringify((await response).rows),     
                        token: tkn });
   
};

const getFacturasPorEmpresa = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  empresaid = params['empresaid'];

  
  desde_numero = params['desde_numero'];
  hasta_numero = params['hasta_numero'];

  query = "select * from contable.facturas f \n";
  query += " where f.institucionID=" + instID +  "\n";
  query += "   and f.empresaID =" + empresaid + "\n";
  query += "   and f.numero between " + desde_numero + " and " + hasta_numero +  "\n";
  query += " order by  f.tipo_documento, f.centro_emisor, f.numero \n";

console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });

 if (response.rows[0]== undefined || response.rowCount==0){

  res.status(404).send({
              status: "ok",
              code: 404 ,
              expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
              token: tkn
              });
   return;           
};  
 res.status(200).send({ status: "ok", 
                        code: 200,  
                        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                        result:JSON.stringify((await response).rows),     
                        token: tkn });
   
};

const getNumeracionFacturas = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
      
  tipodoc   = params['tipodoc'];
  letra = params['letra'];
  centro_emisor = params['centro_emisor'];


  query = "select max(numero)+1 as NumFact from contable.facturas\n";
  query += "  where letra= '" + letra  + "'\n";
  query += "  and centro_emisor= " + centro_emisor +  "\n";
  query += "  and institucionID=" + instID +  "\n";
  query += "  and tipo_documento= '" + tipodoc  + "'\n";
 


console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });

   
 res.status(200).send({ status: "ok", 
                        code: 200,  
                        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                        result:JSON.stringify((await response).rows),     
                        token: tkn });
   
};

const createFactura = async (req, res) => {

              

  var pos = req.user.email.indexOf("@");
  user = req.user.email.substring(0,pos);
  


  var query ="call contable.sp_createfactura(  \n" ;
  query +=   instID + ",\n"; //  institucionid
  query +=   "'" + req.body.origen + "',\n";
	query +=   "'" + req.body.tipmov + "',\n";
	query +=   "'" + req.body.tipfac + "',\n";
	query +=   "'" + req.body.letra + "',\n";
	query +=   "'" + req.body.cemisor  + "',\n";
	query +=   req.body.desde_titular  + ",\n";
	query +=   req.body.hasta_titular  + ",\n";
	query +=   req.body.empresaid  + ",\n";
	query +=   "'" + req.body.descripcion + "',\n";
	query +=   req.body.impo  + ",\n";
	query +=   "'" + req.body.zona_cob + "',\n";
	query +=   "'" + req.body.desregulados  + "',\n";
	query +=   "'" + req.body.con_aportes  + "',\n";
	query +=   "'" + req.body.act_aportes  + "',\n";
	query +=   "'" + req.body.fgeneracion  + "',\n";
	query +=   "'" + req.body.fimpresion  + "',\n";
	query +=    req.body.fvencimiento + ",\n";
	query +=   "'" + req.body.periodo_anio  + "',\n";
	query +=   "'" + req.body.periodo_mes  + "',\n";
	query +=   "'" + req.body.aplica_factura  + "',\n";
	query +=   "'" + req.body.sin_iva  + "',\n";
	query +=   "0,\n"; //  _desde_facta
	query +=   "0,\n"; //  _desde_factb  
	query +=   "0,\n"; //  _hasta_facta
	query +=   "0,\n"; //  _hasta_factb<
	query +=   "'" + user    + "')";

console.log(query);
const tkn = jwt.sign(
  {email: req.user.email},
  JsonKey,
  { expiresIn: "300000m" });

try{
  const response = await pool.query(query); 
  
  res.status(200).send({
    status: "ok",
    code: 200,
    expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
    factura:JSON.stringify((await response).rows),
    token: tkn
    })

  }catch{
   
    res.status(500).send({
        status: "error",
        code: 500,
        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
        factura:{"error":"Error de base de datos"},
        token: tkn
        })

  }
};

const anulaFacturas = async (req, res) => {

    var query ="update contable.facturas set estado='A'  \n" ;
    query +=   "where institucionID= " +  instID + "\n"; 
    query +=   "and tipo_documento ='" + req.body.tipmov + "'\n";
    query +=   "and letra ='" + req.body.letra + "'\n";
    query +=   "and centro_emisor ='" + req.body.cemisor + "'\n";
    query +=   "and numero between " + req.body.desde_numero + " and " + req.body.hasta_numero +  "\n";
    
  
  console.log(query);
  const tkn = jwt.sign(
    {email: req.user.email},
    JsonKey,
    { expiresIn: "300000m" });
  
  try{
    const response = await pool.query(query); 
    
    res.status(200).send({
      status: "ok",
      code: 200,
      expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
      factura:JSON.stringify((await response).rows),
      token: tkn
      })
  
    }catch{
     
      res.status(500).send({
          status: "error",
          code: 500,
          expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
          factura:{"error":"Error de base de datos"},
          token: tkn
          })
  
    }
 
  
  

}; 

const deleteFacturas = async (req, res) => {


  var params = require('url').parse(req.url,true).query;
  console.log(params);
  tipmov   = params['tipmov'];
  letra = params['letra'];
  cemisor = params['cemisor'];
  desde_numero = params['desde_numero'];
  hasta_numero = params['hasta_numero'];
  


  var query ="delete from contable.facturas  \n" ;
  query +=   "where institucionID= " +  instID + "\n"; 
  query +=   "and tipo_documento ='" + tipmov + "'\n";
  query +=   "and letra ='" + letra + "'\n";
  query +=   "and centro_emisor ='" + cemisor + "'\n";
  query +=   "and numero between " + desde_numero + " and " + hasta_numero +  "\n";
  

console.log(query);
const tkn = jwt.sign(
  {email: req.user.email},
  JsonKey,
  { expiresIn: "300000m" });

try{
  const response = await pool.query(query); 
  
  res.status(200).send({
    status: "ok",
    code: 200,
    expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
    factura:JSON.stringify((await response).rows),
    token: tkn
    })

  }catch{
   
    res.status(500).send({
        status: "error",
        code: 500,
        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
        factura:{"error":"Error de base de datos"},
        token: tkn
        })

  }


}; 


const getFacturasAfip = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
              
  diasAntiguedad = params['antiguedadEnDias'];
  filtro = params['filtro'];

  query = "select * ,case \n" ;
  query += "  when t.tipo_documento='F'  and t.letra='A'  then '01' \n" ;
  query += "  when t.tipo_documento='D'  and t.letra='A'  then '02' \n" ;
  query += "  when t.tipo_documento='C'  and t.letra='A'  then '03' \n" ;
  query += "  when t.tipo_documento='F'  and t.letra='B'  then '06' \n" ;
  query += "  when t.tipo_documento='D'  and t.letra='B'  then '07' \n" ;
  query += "  when t.tipo_documento='C'  and t.letra='B'  then '08'  \n" ;
  query += " end as TipoAFIP \n" ;
  query += "  from contable.facturas t"
  query += "  where t.institucionID= " +  instID + "\n";

  if (diasAntiguedad > 0) {
     query += "  and current_date::date - fecha_listado::date <=" + diasAntiguedad + " \n" ;
  }

  if (filtro == 'solo_cae') {
    query += "  and cae is not null \n" ;
 }
 query += "  order by TipoAFIP, t.numero"

console.log(query);
 const response = await pool.query(query);
 const tkn = jwt.sign({email: req.user.email}, JsonKey, { expiresIn: "1h" });

 if (response.rows[0]== undefined || response.rowCount==0){

  res.status(404).send({
              status: "ok",
              code: 404 ,
              expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
              token: tkn
              });
   return;           
};  
 res.status(200).send({ status: "ok", 
                        code: 200,  
                        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                        result:JSON.stringify((await response).rows),     
                        token: tkn });
   
};
const createRegTablaAuxCAE = async (req, res) => {
                        

 
        var js = JSON.stringify(req.body);

        var query ="call contable.sp_createPedidoCae(\n" ;
        query +=   instID + ",\n"; //  institucionid
        query +=   "'" + js + "'\n)"; // json con data del front end

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
        titular:JSON.stringify((await response).rows),

        token: tkn
        });

};


const getRegistrosCaeGenerarTXT = async (req, res) => {
                        

 
  var js = JSON.stringify(req.body);

  var query ="select * from contable.registrosfacturaspedidocae(\n" ;
  query +=   instID + "\n)"; //  institucionid
  

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
  registrosCAE:JSON.stringify((await response).rows),

  token: tkn
  });

};


const setFacturaCAE = async (req, res) => {


  var query ="update contable.facturas \n"; 
  query +=   " set cae='" + req.body.cae + "',\n" ;
  query +=   " FvencCAE='" + req.body.FvencCAE + "'\n" ;
 /* if (req.body.fanulacion !=''){
      query +=   " ,Fanulacion='" + req.body.fanulacion + "'\n" ;
  }*/
  query +=   " where institucionID= " +  instID + "\n"; 
  query +=   " and tipo_documento ='" + req.body.tipmov + "'\n";
  query +=   " and letra ='" + req.body.letra + "'\n";
  query +=   " and centro_emisor =" + req.body.cemisor + "\n";
  query +=   " and numero = " + req.body.numero +  "\n";
  

console.log(query);
const tkn = jwt.sign(
  {email: req.user.email},
  JsonKey,
  { expiresIn: "300000m" });

try{
  const response = await pool.query(query); 
  
  res.status(200).send({
    status: "ok",
    code: 200,
    expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
    factura:JSON.stringify((await response).rows),
    token: tkn
    })

  }catch{
   
    res.status(500).send({
        status: "error",
        code: 500,
        expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
        factura:{"error":"Error de base de datos"},
        token: tkn
        })

  }
};


module.exports = {
                  getFacturas,
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
                } 
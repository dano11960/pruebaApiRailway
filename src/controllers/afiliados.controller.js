const express = require("express");
const {pool}= require('../db/config');
const jwt = require("jsonwebtoken");
const { afiliados } = require("../middleware/roles");
const { exit } = require("process");



var instID = (pool['options']['institucionid']);
const JsonKey  = (pool['options']['JsonKey']);


var instID = (pool['options']['institucionid']);

const getAfiliados = async (req, res) => {

        var query ="select  *   from afiliados.afiliados where  institucionid=" + instID +  " limit 100;"
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
                    result:JSON.stringify((await response).rows),
                      token: tkn
                    });
            
 };

 
 const getPlanes = async (req, res) => {

  var query ="select  descripcion,planID   from afiliados.planes \n";
     query += " where institucionID = " + instID + "\n";
     query += " order by descripcion  \n";


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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};

 const getLocalidades = async (req, res) => {

    
    let query ="select localidadID from afiliados.localidades \n";
        query += " where institucionID = " + instID + "\n";
        query += "and zona in \n";
        query += "('GRAN BS.AS.NORTE', \n";
        query += "'GRAN BS.AS.OESTE', \n";
        query += "'GRAN BS.AS.SUR', \n";
        query += "'CAPITAL FEDERAL', \n";
        query += "'BS.AS.LA PLATA', \n";
        query += "'BS.AS.INTERIOR') \n";
        query += " order by localidadID  \n";

    
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
                result:JSON.stringify((await response).rows),
                token: tkn
                });
        
};

const getProvincias = async (req, res) => {

    
  let query ="select provinciaID from afiliados.provincias \n";
      query += " where institucionID = " + instID + "\n";
      query += " order by provinciaID  \n";

  
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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};


const getPromotores = async (req, res) => {

  var query ="select  promotorID from afiliados.promotores \n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  promotorID \n";


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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};



const getAgentesCobro = async (req, res) => {

  var query ="select  cobradorID from afiliados.agentes_de_cobro \n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  cobradorID \n";


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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};


const getDerivaciones = async (req, res) => {

  var query ="select  derivacionID, razon_social  from afiliados.derivacion \n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  derivacionID \n";

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};


const getEmpresas = async (req, res) => {

  var query ="select  empresaid, razon_social  from afiliados.empresas \n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  razon_social \n";

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};


const getDerivaFacturacion = async (req, res) => {

  var query ="select   codigoid, empresa  from afiliados.facturacion_derivada \n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  empresa \n";

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};



const getTipoIva = async (req, res) => {

  var query ="select  tipoivaID  from institucion.tipoIva \n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  tipoIvaID \n";

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};


const getMotivosBajas = async (req, res) => {

  var query ="select  *   from afiliados.motivos_de_baja\n" ;
    query +=  " order by  motivoID \n";

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
      
};


const getTipoPatologias = async (req, res) => {

  var query ="select  *   from auditoria.tipoPatologia\n" ;
  query +=  " where institucionID = " + instID + "\n";
  query +=  " order by  patologia \n";

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
            };

const getValorCuotaxPlanEmpresa = async (req, res) => {

              var params = require('url').parse(req.url,true).query;
              
              empresaid = params['empresaid'];
              planid = params['planid'];

              var query ="select c.claseID,c.descripcion,c.cvigente,p.precio::decimal(10,2) as precio \n" ;
              query +=  " from  afiliados.clases c, afiliados.precio_de_planes_para_empresas p \n";
              query +=  " where c.claseID= p.claseID \n";
              query +=  " and p.empresaid=" +  empresaid + "\n";
              query +=  " and p.planID='" +  planid + "'\n";
              query +=  " and  p.institucionID =  " + instID + "\n";
              query +=  " and  p.institucionID = c.institucionID \n";
              query +=  " and  c.cvigente='S' \n";
              query +=  " order by c.claseID desc \n";
            
              
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
                          result:JSON.stringify((await response).rows),
                          token: tkn
                          });
                        };


 const getAfiliadosPorApenom = async (req, res) => {

                                      var params = require('url').parse(req.url,true).query;
                                      
                                      nombre = params['nombre'];
                                      
                                      var query ="select g.apellido, g.nombre,e.razon_social, t.planID,\n" ; 
                                      query +=  " to_char(g.fecha_baja,'yyyy-mm-dd') fecha_baja, g.titularid, g.codfamid \n" ;
                                      query +=  " from afiliados.titulares t, afiliados.afiliados g, afiliados.empresas e  \n" ;
                                      query +=  " where g.TitularID = t.TitularID \n" ;
                                      query +=  " and t.empresaID = e.empresaID \n" ;
                                      query +=  " and g.institucionid = t.institucionid \n" ;
                                      query +=  " and g.institucionid = e.institucionid  \n" ;
                                      query +=  " and t.institucionid  =  " + instID + "\n";
                                      query +=  " and trim(g.apellido) || ' ' || trim(g.nombre) ilike '" + nombre + "%' \n" ;
                                      query +=  " order by  g.apellido, g.nombre, g.codfamid \n" ;
 
                                  
            
                                      
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
                                                  result:JSON.stringify((await response).rows),
                                                  token: tkn
                                                  });
  };
                                                
  
 const getGrupoFamiliar = async (req, res) => {

                                var params = require('url').parse(req.url,true).query;
                                
                                titularid = params['numero'];
                      
                                
                                var query ="select * from afiliados.afiliados  \n" ;
                                query +=  " where  institucionid  =  " + instID + "\n";
                                query +=  " and  titularid  =  " + titularid + "\n";
                                query +=  " order by codfamid \n";
                              

                                
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
                                              result:JSON.stringify((await response).rows),
                                              token: tkn
                                              });
                                            }; 
   
    const getDeudaAgrupadoAfiliado = async (req, res) => {

                          var params = require('url').parse(req.url,true).query;
                          
                          titularid = params['titularid'];
                          
            
     
                        
                          var query ="select to_char(f.fecha_listado,'yyyy-mm-dd') as fecha, f.anio_periodo as ano, f.mes_periodo as mes, importe as Impo,  \n" ;
                          query +=  " f.letra,f.centro_emisor,f.numero, 'F' as tipoDoc, f.titularid, f.institucionid \n" ;
                          query +=  " from contable.facturas f \n" ;
                          query +=  "  Where f.titularid  = " + titularid + "\n";
                          query +=  " and f.institucionid = " + instID + "\n";
                          query +=  "  and f.estado='P' \n" ;
                          query +=  " and f.tipo_documento ='F' \n" ;
                          query +=  " and numero not in ( \n" ;
                          query +=  "   select aplica_factura from contable.facturas \n" ;
                          query +=  "             WHERE  institucionid=f.institucionid \n" ;
                          query +=  "               and titularid=f.titularid \n" ;
                          query +=  "              and tipo_documento='C'  \n" ;
                          query +=  "              and letra = f.letra \n" ;
                          query +=  "             and Aplica_Factura is not null) \n" ;
                   /*       query +=  " Union All \n" ;
                          query +=  " select to_char(fecha_listado,'yyyy-mm-dd') as fecha, anio_periodo as ano, mes_periodo as mes,importe*-1 as Impo,  \n" ;
                          query +=  " letra,centro_emisor,numero, 'C' as tipoDoc, titularid, institucionid \n" ;
                          query +=  " from  contable.facturas \n" ;
                          query +=  " Where titularid  = " + titularid + "\n";
                          query +=  " and institucionid =  " + instID + "\n";
                          query +=  " and estado='P' \n" ;
                          query +=  " and tipo_documento='C' \n" ;
                          query +=  " Union All \n" ;
                          query +=  " select to_char(fechaImpresion,'yyyy-mm-dd')   as fecha,anio, mes,valor as Impo,  \n" ;
                          query +=  " 'R' as letra,0 as centro_emisor,numero,  'R' as tipoDoc, titularid, institucionid \n" ;
                          query +=  " from  contable.impresion_de_recibos \n" ;
                          query +=  " Where titularid = " + titularid + "\n";
                          query +=  " and institucionid = " + instID + "\n";
                          query +=  " and estado='P' \n" ;*/
                          query +=  " order by  fecha, ano,mes \n" ;


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
                                      result:JSON.stringify((await response).rows),
                                      token: tkn
                                      });
                                    };
									
 const getTitular = async (req, res) => {

                              var params = require('url').parse(req.url,true).query;

                          
                              numero = params['numero'];
                              tipo = params['tipo'];
                              
                              var query ="select   \n" ;
                              query +=  " titularID,  \n" ;
                              query +=  " institucionID,  \n" ;
                              query +=  " empresaID,  \n" ;
                              query +=  " apellido,  \n" ;
                              query +=  " nombre,  \n" ;
                              query +=  " planID,  \n" ;
                              query +=  " domicilio_fact,  \n" ;
                              query +=  " cod_postal_fact,  \n" ;
                              query +=  " localidad_fact,  \n" ;
                              query +=  " provincia,  \n" ;
                              query +=  " telefono_fact,  \n" ;
                              query +=  " domicilio_adic,  \n" ;
                              query +=  " cod_postal_adic,  \n" ;
                              query +=  " localidad_adic,  \n" ;
                              query +=  " telefono_adic,  \n" ;
                              query +=  " correo_electronico ,  \n" ;
                              query +=  " cobradorID,  \n" ;
                              query +=  " promotorID,  \n" ;
                              query +=  " referencia_cobranza ,  \n" ;
                              query +=  " estado,  \n" ;
                              query +=  " tipo_iva,  \n" ;
                              query +=  " cuit ,  \n" ;
                              query +=  " derivacionID ,  \n" ;
                              query +=  " deriva_facturacion ,  \n" ;
                              query +=  " cuil ,  \n" ;
                              query +=  " tipo_descuento,  \n" ;
                              query +=  " descuento,  \n" ;
                              query +=  " fin_descuento ,  \n" ;
                              query +=  " valor_cuota ,  \n" ;
                              query +=  " factura_desde ,  \n" ;
                              query +=  " miscelanea ,  \n" ;
                              query +=  " cusuario ,  \n" ;
                              query +=  " fultman ,  \n" ;
                              query +=  " cuit_empleador ,  \n" ;
                              query +=  " razon_social_empleador,  \n" ;
                              query +=  " fax ,  \n" ;
                              query +=  " interseccion_domi ,  \n" ;
                              query +=  " interseccion_fact,  \n" ;
                              query +=  " mail_facturacion,  \n" ;
                              query +=  " whatsup ,  \n" ;
                              query +=  " ccodigoIngresoWeb ,  \n" ;
                              query +=  " to_char(fecha_alta, 'yyyy-mm-dd') fecha_alta,  \n" ;
                              query +=  " to_char(fecha_baja, 'yyyy-mm-dd') fecha_baja,  \n" ;
                              query +=  " to_char(fecha_carga, 'yyyy-mm-dd') fecha_carga,  \n" ;
                              query +=  " to_char(fecha_cambio_plan, 'yyyy-mm-dd') fecha_cambio_plan,  \n" ;
                              query +=  " to_char(factura_desde, 'yyyy-mm-dd') factura_desde  \n" ;
                              query +=  "  from afiliados.titulares  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              
                              if (tipo == "TITULARID"){
                                query +=  " and  titularid  =  " + numero + "\n";
                              
                              }else{
                                query +=  " and  titularid  in ( \n";
                                query +=  " select titularid FROM afiliados. afiliados  \n";
                                query +=  " where  institucionid  =  " + instID + "\n";
                                query +=  " and nume_docu = " + numero + ") \n";
                              }

                              query +=  " order by titularid desc limit 1 \n";

                              const response = await pool.query(query);
                          
                              if (response.rows[0]== undefined || response.rowCount==0){
                               
                                const tkn = jwt.sign(
                                  {email: req.user.email},
                                  JsonKey,
                                  { expiresIn: "1h" }
                                );

                                res.status(404).send({
                                            status: "ok",
                                            code: 404 ,
                                            expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
                                            token: tkn
                                            });
                                 return;           
                              };  
                              
                              
                              const titu = response.rows[0].titularid;
                              /* grupo familiar */

                              var query ="select titularID, codfamID , institucionID, \n" ;
                              query +=  "  empresaID ,  apellido,nombre, sexo, \n" ;
                              query +=  " to_char(fecha_naci, 'yyyy-mm-dd') fecha_naci,  \n" ;
                              query +=  " to_char(fecha_alta, 'yyyy-mm-dd') fecha_alta,  \n" ;
                              query +=  " to_char(fecha_baja, 'yyyy-mm-dd') fecha_baja,  \n" ;
                              query +=  " DATE_PART('year', AGE(now(), fecha_naci)) as edad,  \n" ;
                              query +=  " tipo_docu,  nume_docu, cuil \n" ;
                              query +=  " from afiliados.afiliados  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              query +=  " and  titularid  =  " + titu + "\n";
                              query +=  " order by codfamid \n";


                              const responseGfam = await pool.query(query);

                               /* alertas */

                               var query ="select * from afiliados.Alertasafiliados  \n" ;
                               query +=  " where  institucionid  =  " + instID + "\n";
                               query +=  " and  titularid  =  " + titu + "\n";
                               query +=  " order by fecha_carga desc  \n";
 
 
                               const responseAlertas = await pool.query(query);

                              /* atencion cliente */

                              var query ="select * from afiliados.AtencionAlCliente  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              query +=  " and  titularid  =  " + titu + "\n";
                              query +=  " order by fecha_carga  desc \n";


                              const responseAtencion = await pool.query(query);

                              /* recupero SUR */

                              var query ="select * from auditoria.afi_con_recupero_sur  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              query +=  " and  titularid  =  " + titu + "\n";
                              query +=  " order by fecha_carga desc  \n";


                              const responseRecuperoSur = await pool.query(query);

                              /* patologias afil */

                              var query ="select * from afiliados.patologiasafiliados  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              query +=  " and  titularid  =  " + titu + "\n";
                              query +=  " order by fecha_carga desc  \n";


                              const responsePatologias = await pool.query(query);

                              

                              /* aportes Afil */

                              var query ="select * from afiliados.aportes_de_afiliados  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              query +=  " and  titularid  =  " + titu + "\n";
                              


                              const responseAportesAfil = await pool.query(query);                              

                                          
                                                        

                                 /* contrato plan/clase Afil */

                              var query ="select f.*, c.descripcion, DATE_PART('year', AGE(now(), a.fecha_naci)) as edad  \n";
                              query +=  " from afiliados.contrato_para_facturar_afiliados f, afiliados.clases c, \n" ; 
                              query +=  " afiliados.afiliados a  \n" ;
                              query +=  " where  f.institucionid  =  " + instID + "\n";
                              query +=  "   and  f.institucionid  =  c.institucionid \n";
                              query +=  "   and  f.institucionid  =  a.institucionid \n";
                              query +=  "   and  a.titularid  =  " + titu + "\n";
                              query +=  "   and  f.titularid  =  a.titularid \n";
                              query +=  "   and  f.claseid  =  c.claseid \n";
                              query +=  "   and  f.codfamid  =  a.codfamid \n";
                              query +=  "   and  a.fecha_baja is null \n";
                              query +=  " order by f.codfamid  \n";


                              const responseContratoPlanAfil = await pool.query(query); 
                              
                              /* historico de planes */

                              var query ="select * from afiliados.historico_de_planes  \n" ;
                              query +=  " where  institucionid  =  " + instID + "\n";
                              query +=  " and  titularid  =  " + titu + "\n";
                         


                              const responseHistoPlanAfil = await pool.query(query);  

                                /* historico de obras sociales afil */

                                var query ="select  \n" ;
                                query +=  " h.titularid,  \n" ;
                                query +=  " h.codfamid,  \n" ;
                                query +=  " h.derivacionID,  \n" ;
                                query +=  " d.razon_social,  \n" ;
                                query +=  " to_char(h.fdesde, 'yyyy-mm-dd') fdesde,  \n" ;
                                query +=  " to_char(h.fhasta , 'yyyy-mm-dd') fhasta  \n" ;
                                query +=  " from afiliados.historico_os h, afiliados.derivacion d \n" ;
                                query +=  " where  h.institucionid  =  " + instID + "\n";
                                query +=  " and    h.institucionid  = d.institucionid \n";
                                query +=  " and    h.derivacionid  = d.derivacionid \n";
                                query +=  " and    h.titularid  =  " + titu + "\n";
                                query +=  " order by h.fdesde desc \n";
                                

  
                                const responseHistoOS = await pool.query(query); 


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
                                          grupo_fam:JSON.stringify((await responseGfam).rows),
                                          alertas:JSON.stringify((await responseAlertas).rows),
                                          atencion:JSON.stringify((await responseAtencion).rows),
                                          recupero:JSON.stringify((await responseRecuperoSur).rows),
                                          aportes:JSON.stringify((await responseAportesAfil).rows),
                                          contrato:JSON.stringify((await responseContratoPlanAfil).rows),
                                          histo_plan:JSON.stringify((await responseHistoPlanAfil).rows),
                                          histo_os:JSON.stringify((await responseHistoOS).rows),
                                          patologiasAfi:JSON.stringify((await responsePatologias).rows),

                                          token: tkn
                                          });
                                        };   



  const createTitular = async (req, res) => {

                                      
                   

                            var pos = req.user.email.indexOf("@");
                            user = req.user.email.substring(0,pos);

                            var js = JSON.stringify(req.body);

                            var query ="call afiliados.sp_createTitular(  \n" ;
                            query +=  "0, \n"; // numero titularid en cero / despues se crea
                            query +=   instID + ",\n"; //  institucionid
                            query +=   "'" + user + "',\n"; // cusuario 
                            query +=   "'" + js + "')\n"; // json con data del front end


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


 const setTitular = async (req, res) => {
                        
  console.log(req);
        var pos = req.user.email.indexOf("@");
        user = req.user.email.substring(0,pos);
   
        var js = JSON.stringify(req.body);

        var query ="call afiliados.sp_updateTitular(\n" ;
        query +=    req.body.titular[0].titularid + ",\n"; 
        query +=   instID + ",\n"; //  institucionid
        query +=   "'" + user + "',\n"; // cusuario 
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

   }

   const setFamiliar = async (req, res) => {
                        

    var pos = req.user.email.indexOf("@");
    user = req.user.email.substring(0,pos);

    var js = JSON.stringify(req.body);

    var query ="call afiliados.sp_updatefamiliar(\n" ;
    query +=    req.body.titularid + ",\n"; 
    query +=    req.body.familiar[0].codfamid + ",\n"; 
    query +=   instID + ",\n"; //  institucionid
    query +=   "'" + user + "',\n"; // cusuario 
    query +=   "'" + js + "'\n)"; // json con data del front end

     //   console.log(query);
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

}

  const deleteFamiliar = async (req, res) => {

    var params = require('url').parse(req.url,true).query;
    
    titularid = params['titularid'];
    codfamid = params['codfamid'];

    var query ="delete from afiliados.afiliados \n";
    query +=  " where titularid=" +  titularid + "\n";
    query +=  " and   codfamid=" +  codfamid + "\n";
    query +=  " and   institucionID =  " + instID + "\n";
      
    //console.log(query);
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
                result:JSON.stringify((await response).rows),
                token: tkn
                });
              


}; 

const deleteHistorico_os = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
  
  titularid = params['titularid'];
  fdesde = params['fdesde'];
  derivacionid = params['derivacionid'];

  var query ="delete from afiliados.historico_os \n";
  query +=  " where titularid=" +  titularid + "\n";
  query +=  " and   institucionID =  " + instID + "\n";
  query +=  " and   derivacionid='" +  derivacionid + "'\n";
  query +=  " and   fdesde='" +  fdesde + "'\n";
    
  //console.log(query);
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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
            


}; 


const deleteAporteAfil = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
  
  titularid = params['titularid'];
  codfamid = params['codfamid'];
  anio_fact = params['anio_fact'];
  mes_fact = params['mes_fact'];
  anio_apor = params['anio_apor'];
  mes_apor = params['mes_apor'];
  aporte = params['aporte'];

  

  var query ="delete from afiliados.aportes_de_afiliados \n";
  query +=  " where titularid=" +  titularid + "\n";
  query +=  " and   institucionID=" + instID + "\n";
  query +=  " and   factura_anio=" +  anio_fact + "\n";
  query +=  " and   factura_mes=" +  mes_fact + "\n";
  query +=  " and   periodo_anio=" +  anio_apor + "\n";
  query +=  " and   periodo_mes=" +  mes_apor + "\n";
  query +=  " and   aporte=" +  aporte + "\n";

  
    
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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
            


}; 

const deletePatologia = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
  
  registroid = params['registroid'];
  tipo = params['tipo'];

  var tabla;

  if (tipo == 'patologiasAfi')
    tabla="afiliados.patologiasafiliados";
  else
    tabla="auditoria.afi_con_recupero_sur";
  

  var query ="delete from " + tabla + "\n";
  query +=  " where registroid=" +  registroid + "\n";
  query +=  " and   institucionID =  " + instID + "\n";
    
 // console.log(query);
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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
            


}; 


const deleteAtencionCliente = async (req, res) => {

  var params = require('url').parse(req.url,true).query;
  
  registroid = params['registroid'];
  tipo = params['tipo'];

  var tabla;

  if (tipo == 'atencionAlCliente')
    tabla="afiliados.AtencionAlCliente";
  else
    tabla="afiliados.Alertasafiliados";
  

  var query ="delete from " + tabla + "\n";
  query +=  " where registroid=" +  registroid + "\n";
  query +=  " and   institucionID =  " + instID + "\n";
    
  //console.log(query);
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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
            


}; 


const createHistorico_os = async (req, res) => {
                                    
                   

  var pos = req.user.email.indexOf("@");
  user = req.user.email.substring(0,pos);

  var js = JSON.stringify(req.body);

  var query ="call afiliados.createHistorico_os(  \n" ;
  query +=    req.body.titularid + ",\n"; 
  query +=    req.body.codfamid + ",\n"; 
  query +=   instID + ",\n"; //  institucionid
  query +=   "'" + user + "',\n"; // cusuario 
  query +=   "'" + js + "')\n"; // json con data del front end

//console.log(query);
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



const createPatologia = async (req, res) => {
                                    
                   

  var pos = req.user.email.indexOf("@");
  user = req.user.email.substring(0,pos);

  var js = JSON.stringify(req.body);

  
  var query ="call afiliados.createAlerta (  \n" ;
  query +=    req.body.titularid + ",\n"; 
  query +=    req.body.codfamid + ",\n"; 
  query +=   instID + ",\n"; //  institucionid
  query +=   "'" +req.body.tipo + "',\n";  // patologia p recuperosur
  query +=   "'" + user + "',\n"; // cusuario 
  query +=   "'" + js + "')\n"; // json con data del front end

//console.log(query);
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

const createAtencionCliente = async (req, res) => {
                                    
                   

  var pos = req.user.email.indexOf("@");
  user = req.user.email.substring(0,pos);

  var js = JSON.stringify(req.body);

  
  var query ="call afiliados.createAtencion (  \n" ;
  query +=    req.body.titularid + ",\n"; 
  query +=   instID + ",\n"; //  institucionid
  query +=   "'" +req.body.tipo + "',\n";  // patologia p recuperosur
  query +=   "'" + user + "',\n"; // cusuario 
  query +=   "'" + js + "')\n"; // json con data del front end

//console.log(query);
  const response = await pool.query(query); 
  res.status(200).send({
    status: "ok",
    code: 200,
    expires:Date.now() + 360000, // hora actual mas 1 hora (600 seg)
    titular:JSON.stringify((await response).rows),
  
    token: tkn
    });
  
  
  }; 


const createAporteAfil = async (req, res) => {
 
  var pos = req.user.email.indexOf("@");
  user = req.user.email.substring(0,pos);

  var js = JSON.stringify(req.body);

  
  var query ="call afiliados.sp_createAporteAfil (  \n" ;
  query +=   req.body.titularid + ",\n"; 
  query +=   instID + ",\n"; //  institucionid
  query +=   "'" + user + "',\n"; // cusuario 
  query +=   "'" + js + "')\n"; // json con data del front end

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



const getCtaCteDeudores = async (req, res) => {
 
  var params = require('url').parse(req.url,true).query;
  
  console.log(params);
  titularid = params['titularid'];
  
  var query ="SELECT  num_docu,  descripcion,  cobrador,  periodo,   \n" ;
  query +=  " fdocumento, estado,   \n" ;
  query +=  " debe,  haber,  saldo \n" ;
  query +=  " FROM afiliados.v_ctacte_deudores_padre  \n" ;
  query +=  " WHERE  institucionID=   " + instID + "\n";
  query +=  "   AND  titularid =  " + titularid + "\n";
  query +=  " ORDER BY col0, orden; \n" ;


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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
};

const getDatosParaFacturaParcial = async (req, res) => {
 
  var params = require('url').parse(req.url,true).query;

  titularid = params['titularid'];
  empresaid = params['empresaid'];
  anio = params['anio'];
  mes = params['mes'];
  
  
  
  var query ="call contable.sp_getleyendacontratofactura (  \n" ;
  query +=   instID + ",\n"; //  institucionid
  query +=   titularid + ",\n";  //titularid
  query +=   empresaid + ",\n"; //  empresaid
  query +=   anio + ",\n"; //  anio-factura
  query +=   mes + ",\n"; //  mes-factura
  query +=   "'')\n"; // retorno leyenda
  

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
};


const getDatosAportesParcial = async (req, res) => {
 
  var params = require('url').parse(req.url,true).query;

  titularid = params['titularid'];
  cuota = params['cuota'];
  anio = params['anio'];
  mes = params['mes'];
  factAportes = params['factAportes'];
  actAportes = params['actAportes'];

  var query ="call contable.sp_getaportesparafacturar (  \n" ;
  query +=   instID + ",\n"; //  institucionid
  query +=   titularid + ",\n";  //titularid
  query +=   cuota + ",\n"; //  empresaid
  query +=   anio + ",\n"; //  anio-factura
  query +=   mes + ",\n"; //  mes-factura
  query +=   factAportes + ",\n"; // factAportes
  query +=   actAportes + ",\n"; // actAportes
  query +=   "'',\n"; // retorno aporte_es_estimado
  query +=   "null,\n"; // retorno aporte_tiene_aportes
  query +=   "null,\n"; // retorno aporte_detalle
  query +=   "0,\n"; // retorno aporte_total_aportes
  query +=   "0,\n"; // retorno aporte_importe_neto
  query +=   "0)\n"; // retorno aporte_saldo_anterior

  

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
};


 
const getValorPlanPorGrupFam = async (req, res) => {
 
  var params = require('url').parse(req.url,true).query;

  titularid = params['titularid'];
    
  var query = "SELECT sum(s.precio::numeric) as valor_plan  \n" ;
  query +=  " FROM  afiliados.contrato_para_facturar_afiliados f, \n" ;
  query +=  " afiliados.precio_de_planes_para_empresas s,  \n" ;
  query +=  " afiliados.afiliados a, \n" ;
  query +=  " afiliados.titulares t \n" ;
  query +=  " where f.institucionID = s.institucionID \n" ;
  query +=  " and f.institucionID=a.institucionID \n" ;
  query +=  " and f.institucionID=t.institucionID \n" ;
  query +=  " and f.claseID = s.claseID \n" ;
  query +=  " and f.titularID = t.titularID \n" ;
  query +=  " and f.titularID = a.titularID \n" ;
  query +=  " and f.codfamID = a.codfamID \n" ;
  query +=  " and f.institucionID = " + instID + "\n";
  query +=  " and f.titularID =  " + titularid + "\n";
  query +=  " and a.fecha_baja is null \n" ;
  query +=  " and s.empresaid = t.empresaid \n" ;
  query +=  " and s.planid = t.planid \n" ;

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
              result:JSON.stringify((await response).rows),
              token: tkn
              });
};
module.exports = {
                  getAfiliados, 
                  getPlanes,
                  getLocalidades, 
                  getProvincias,
                  getPromotores,
                  getAgentesCobro,
                  getDerivaciones,
                  getEmpresas,
                  getTipoIva,
                  getDerivaFacturacion,
                  getMotivosBajas,
                  getTipoPatologias,
                  getValorCuotaxPlanEmpresa,
                  getAfiliadosPorApenom,
                  getTitular,
                  getDeudaAgrupadoAfiliado,
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
                } 

              
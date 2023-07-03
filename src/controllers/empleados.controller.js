const express = require("express");
const {pool}= require('../db/config');
const jwt = require("jsonwebtoken");



var instID = (pool['options']['institucionid']);
const JsonKey  = (pool['options']['JsonKey']);


var instID = (pool['options']['institucionid']);

const getEmpleados = async (req, res) => {

  var query ="select  nuserid, email  from institucion.usuariosempleados where  institucionid=" + instID;
  const response = await pool.query(query);
  res.status(200).json({'status':'true','result':response.rows});
};






const loginEmpleado = async (req, res) => {

  
  var password = req.body.password;


  if (password){


      var usuario = req.body.email;
      
      var instID = (pool['options']['institucionid']);
      const secret = (pool['options']['secret']);
  
      var query ="select nuserid from institucion.usuariosempleados where status and institucionid=" + instID;
      query += " and email ='" + usuario + "'" ;
      query += " and pgp_sym_decrypt(ccontrasenia,'" + secret + "') = '" + Buffer.from(password,'base64') + "'"  ;


        const response = await pool.query(query) ;

 

      if (response.rowCount == 0) {
          res.status(403).send({"code":403,"mensaje":"Credenciales erroneas"});
      }else{

              var nuserid =  response.rows[0]['nuserid'];
              query ="select  rolname,item_menu  from institucion.usuariosempleadosroles where   institucionid=" + instID;
              query += " and nuserid =" + nuserid ;
              query += " order by rolname; "  ;
            
              const response2 = await pool.query(query);


              // build menu options wih profiles of user
              let mnu = [] ;
              let mnu_afi ;
              let mnu_mis ;

              for(let i = 0; i < response2.rowCount; i +=1){
                
                let obj = response2.rows[i];
                
                for(let key in obj){
         
                 
                  if  ( obj[key] == "ROL_AFILIADOS"){

                    mnu_afi = {
                            
                            "description": "Asociados",
                            "type" : "menu",
                            "color" : "fa-stack fa-lg pull-left",
                            "icon" : "fa fa-plus-square-o fa-stack-1x",
                            "id" : "nav_afi",
                            "acls" : ["Asociados"],
                            "items" :[{
                                        "description" : "Asociados",
                                        "url" : "/afiliados",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_afiliados",
                                        "acls" : ["afiliados"]
                                       },
                                       {
                                        "description" : "Empresas",
                                        "url" : "/empresas",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_empresas",
                                        "acls" : ["empresas"]
                                       },
                                       {
                                        "description" : "Empleadores",
                                        "url" : "/empleadores",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_empleadores",
                                        "acls" : ["Empleadores"]
                                        },
                                        {
                                        "description" : "Planes",
                                        "url" : "/planes",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_planes",
                                        "acls" : ["planes"]
                                        },
                                        {
                                        "description" : "Obra sociales",
                                        "url" : "/obra_sociales",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_obra_sociales",
                                        "acls" : ["obra_sociales"]
                                        },
                                        {
                                        "description" : "Promotores",
                                        "url" : "/promotores",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_promotores",
                                        "acls" : ["promotores"]
                                        },
                                        {
                                        "description" : "Cobradores",
                                        "url" : "/cobradores",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_cobradores",
                                        "acls" : ["cobradores"]
                                        },
                                        {
                                        "description" : "Localidades",
                                        "url" : "/localidades",
                                        "type" : "item",
                                        "icon" : "fa fa-caret-right fa-stack-1x",
                                        "color" : "fa-stack fa-lg pull-left",
                                        "id" : "nav_afi_localidades",
                                        "acls" : ["localidades"]
                                        },
                                        {
                                        "description" : "Tarj.déb/aut",
                                            "url" : "/tarjeta_credito",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_tarjeta_credito",
                                            "acls" : ["tarjeta_credito"]
                                        }]

                                        
                                    }
                                  
                        ;
                      
                      }  ;

                      if( obj[key] == "ROL_MISCELANEAS") {

                            mnu_mis =  {
                            
                                "description": "Miscleaneas",
                                "type" : "menu",
                                "color" : "fa-stack fa-lg pull-left",
                                "icon" : "fa fa-plus-square-o fa-stack-1x",
                                "id" : "nav_afi",
                                "acls" : ["Asociados"],
                                "items" :[{
                                            "description" : "Permisos a la app",
                                            "url" : "/permisos",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_permisos",
                                            "acls" : ["permisos"]
                                           },
                                           {
                                            "description" : "etc",
                                            "url" : "/etc",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_etc",
                                            "acls" : ["etc"]
                                          }]

                                        
                                        }
                                      
                            ;
                          
                          }  ;
                         
                          if( obj[key] == "ROL_AUTORIZACIONES") {

                            mnu_aut =  {
                            
                                "description": "Autorizaciones",
                                "type" : "menu",
                                "color" : "fa-stack fa-lg pull-left",
                                "icon" : "fa fa-plus-square-o fa-stack-1x",
                                "id" : "nav_afi",
                                "acls" : ["Autorizaciones"],
                                "items" :[{
                                            "description" : "Generar",
                                            "url" : "/autorizaciones",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_autorizaciones",
                                            "acls" : ["autorizaciones"]
                                           },
                                           {
                                            "description" : "Prestadores",
                                            "url" : "/prestadores",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_prestadores",
                                            "acls" : ["prestadores"]
                                          },
                                          {
                                            "description" : "Estadisticas",
                                            "url" : "/estadisticas",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_estadisticas",
                                            "acls" : ["estadisticas"]
                                          }]

                                        
                                        }
                                      
                            ;
                          
                          }  ;

                          if( obj[key] == "ROL_FACTURACION") {

                            mnu_fac =  {
                            
                                "description": "Facturas",
                                "type" : "menu",
                                "color" : "fa-stack fa-lg pull-left",
                                "icon" : "fa fa-plus-square-o fa-stack-1x",
                                "id" : "nav_afi",
                                "acls" : ["Facturas"],
                                "items" :[{
                                            "description" : "Generar",
                                            "url" : "/facturas",
                                            "type" : "item",
                                            "icon" : "fa fa-caret-right fa-stack-1x",
                                            "color" : "fa-stack fa-lg pull-left",
                                            "id" : "nav_afi_facturas",
                                            "acls" : ["facturas"]
                                           }]

                                        
                                        }
                                      
                            ;
                          
                          };

                };                
              };       
              mnu.push(mnu_afi);     // afiliados
              mnu.push(mnu_mis);     // miscelaneas
              mnu.push(mnu_fac);     // facturacion
              mnu.push(mnu_aut);     // autorizaciones
   
              const tkn = jwt.sign(
                {email: req.body.email},
                JsonKey,
                { expiresIn: "1h" }
             );
            
             res.status(200).send({
              status: "ok",
              code: 200,
              cusuario:req.body.email,
              expires:Date.now() + 3600000, // hora actual mas 1 hora (600 seg)
              roles:JSON.stringify((await response2).rows),
              menu:JSON.stringify(mnu),
              token: tkn
             });
      }
  
  }  else{
      res.status(403).send("Faltan credenciales");
  }

};
module.exports = { getEmpleados, loginEmpleado } 
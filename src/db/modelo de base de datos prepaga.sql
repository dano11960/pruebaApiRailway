
begin ;

CREATE EXTENSION IF NOT EXISTS pgcrypto;

create schema afiliados;
create schema auditoria;
create schema autorizaciones;
create schema contable;
create schema estadisticas;
create schema institucion;



CREATE TABLE auditoria.afiliados_Deb_A_Terceros (
	titularID numeric(18, 0) NULL ,
	institucionID integer NULL ,
	debitar_OS varchar(30)  NULL ,
	fecha_hasta timestamp NULL 
) ;

CREATE SEQUENCE afiliados.Alertasafiliados_id_seq;


CREATE TABLE afiliados.Alertasafiliados(
	registroID int  NOT NULL DEFAULT nextval('afiliados.Alertasafiliados_id_seq'),
	institucionID int NOT NULL ,
	titularID int NOT NULL ,
	fecha_carga timestamp NOT NULL ,
	observaciones varchar(500)  NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;

CREATE SEQUENCE afiliados.AtencionAlCliente_id_seq;

CREATE TABLE afiliados.AtencionAlCliente(
	registroID int  NOT NULL DEFAULT nextval('afiliados.AtencionAlCliente_id_seq'),
	institucionID integer NOT NULL ,
	titularID int NOT NULL ,
	fecha_carga timestamp NOT NULL ,
	observaciones varchar(500)  NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE contable.ImporteLetras(
	numero int NULL ,
	ImpEnLetras varchar(100)  NULL ,
	institucionID integer NULL ,
	tipo_documento varchar(1)  NULL ,
	letra varchar(1)  NULL 
) ;


CREATE TABLE contable.ImprentaFactNumeracion(
	institucionid integer NOT NULL ,
	cTMovi varchar(1)  NOT NULL ,
	cletra varchar(1)  NOT NULL ,
	nCentroEmisor varchar(4)  NOT NULL ,
	nDesdeN varchar(8)  NOT NULL ,
	nHastaN varchar(8)  NOT NULL ,
	fImpr varchar(7)  NOT NULL 
) ;


CREATE TABLE contable.impresion_de_recibos(
	numero int NULL ,
	institucionID integer NULL ,
	fechaImpresion timestamp NULL ,
	titularid int NULL ,
	anio integer NULL ,
	mes integer NULL ,
	valor numeric(7, 2) NULL ,
	estado varchar(1)  NULL ,
	descripcion varchar(80)  NULL ,
	CUSUARIO varchar(8)  NULL ,
	FULTMAN timestamp NULL 
) ;


CREATE TABLE afiliados.ImpresionComisiones(
	PromotorID varchar(30)  NULL ,
	TitularID int NULL ,
	PlanID varchar(5)  NULL ,
	Nombre varchar(60)  NULL ,
	anio int NULL ,
	mes int NULL ,
	importe numeric(7, 2) NULL ,
	Estado varchar(20)  NULL ,
	tipo varchar(10)  NULL ,
	Titulo varchar(20)  NULL ,
	Descripcion varchar(30)  NULL 
) ;


CREATE TABLE estadisticas.InfoIISSCABECERA(
	codigo integer NOT NULL ,
	subcodigo integer NOT NULL ,
	Descripcion varchar(200)  NULL ,
	prestacion varchar(11)  NULL 
) ;

CREATE SEQUENCE estadisticas.InfoIISSDETALLE_id_seq;


CREATE TABLE estadisticas.InfoIISSDETALLE(
	nsecuencia  int  NOT NULL DEFAULT nextval('estadisticas.InfoIISSDETALLE_id_seq'),
	institucionID integer NOT NULL ,
	codigo integer NOT NULL ,
	subcodigo integer NOT NULL ,
	periodo int NOT NULL ,
	titularID numeric(11, 0) NOT NULL ,
	codFamID integer NULL ,
	edad integer NULL ,
	PrestacionID varchar(10)  NULL ,
	zonaPrestador varchar(40)  NULL 
) ;


CREATE TABLE Resultados(
	LOCDEN varchar(15)  NULL ,
	Expr1001 int NULL ,
	ZONDEN varchar(20)  NULL 
) ;


CREATE TABLE contable.Retiro_Efectivo(
	institucionID integer NULL ,
	nro_orden_pago int NULL ,
	fecha timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE acceso_a_empresas(
	usuario varchar(30)  NOT NULL ,
	institucionid integer NOT NULL 
) ;


CREATE TABLE afiliados.adiciona_por_edad(
	institucionid integer NULL ,
	empresaID int NULL ,
	planID varchar(10)  NULL ,
	desde_edad integer NULL ,
	hasta_edad integer NULL ,
	valor numeric(6, 2) NULL 
) ;

CREATE SEQUENCE auditoria.afi_con_recupero_sur_id_seq;

CREATE TABLE auditoria.afi_con_recupero_sur(
	registroID int NOT NULL default nextval('auditoria.afi_con_recupero_sur_id_seq') ,
	institucionID integer NOT NULL ,
	titularID int NOT NULL ,
	codfamID integer NOT NULL ,
	fecha_carga timestamp NOT NULL ,
	tipopatologia varchar(40)  NOT NULL ,
	observaciones text  NULL ,
	valor numeric(9, 2) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	fdesde timestamp NULL ,
	fhasta timestamp NULL 
) ;


CREATE TABLE afiliados.afiliados(
	titularID int NOT NULL ,
	codfamID integer NOT NULL ,
	institucionID integer NOT NULL ,
	empresaID int NULL ,
	apellido varchar(30)  NULL ,
	nombre varchar(20)  NULL ,
	sexo varchar(1)  NULL ,
	fecha_naci timestamp NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	tipo_docu varchar(3)  NULL ,
	nume_docu numeric(18, 0) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	cuil varchar(15)  NULL ,
	capeinforma integer NULL ,
	cddjj integer NULL 
) ;


CREATE TABLE afiliados.afiliados_con_CBU(
	institucionID integer NULL ,
	titularID numeric(18, 0) NULL ,
	codCBU varchar(22)  NULL 
) ;


CREATE TABLE afiliados.agentes_de_cobro(
	cobradorID varchar(20)  NOT NULL ,
	institucionID integer NOT NULL ,
	domicilio varchar(40)  NULL ,
	telefonos varchar(20)  NULL ,
	otros_telefonos varchar(20)  NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	zona_cobro varchar(15)  NULL ,
	primer_porc_comision numeric(5, 2) NULL ,
	segundo_porc_comision numeric(5, 2) NULL ,
	tercer_porc_comision numeric(5, 2) NULL ,
	codigoid int NULL 
) ;


CREATE TABLE contable.alicuota_iva(
	valor numeric(6, 2) NULL ,
	institucionID integer NULL 
) ;


CREATE TABLE afiliados.aportes_de_afiliados(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	periodo_anio integer NULL ,
	periodo_mes integer NULL ,
	factura_anio integer NOT NULL ,
	factura_mes integer NOT NULL ,
	aporte numeric(7, 2) NULL ,
	observacion varchar(50)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	facturado varchar(1)  NULL ,
	cuit varchar(15)  NULL ,
	razon_social varchar(25)  NULL ,
	sueldo numeric(8, 2) NULL ,
	derivacionID varchar(15)  NULL 
) ;



CREATE TABLE auditoria.arancelPractica(
	institucionid integer NOT NULL ,
	nDesdeNN int NOT NULL ,
	nHastaNN int NOT NULL ,
	dDescripcion varchar(40)  NULL ,
	dDescrGasto varchar(40)  NULL ,
	nGaleno numeric(10, 4) NULL ,
	nGasto numeric(10, 4) NULL 
) ;


CREATE TABLE archivo_impresion(
	institucionid integer NULL ,
	empresaid integer NULL ,
	cobrador_desde varchar(20)  NULL ,
	cobrador_hasta varchar(20)  NULL ,
	mes_desde int NULL ,
	anio_desde int NULL ,
	mes_hasta int NULL ,
	anio_hasta int NULL ,
	estado varchar(10)  NULL ,
	fecha_desde timestamp NULL ,
	fecha_hasta timestamp NULL ,
	titular_desde int NULL ,
	titular_hasta int NULL ,
	ordenid int NULL ,
	proveedorid varchar(15)  NULL ,
	saldo numeric(7, 2) NULL ,
	descripcion varchar(2500)  NULL 
) ;


CREATE TABLE auditFecha(
	fecha timestamp NULL ,
	ccodigo_encrypt varchar(20)  NULL 
) ;


CREATE TABLE audit_registros_borrados(
	institucionID integer NULL ,
	tabla varchar(40)  NOT NULL ,
	refe_clave varchar(60)  NOT NULL ,
	observa varchar(100)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE autorizaciones.auditoriaAutorizacionWeb(
	institucionID integer NOT NULL ,
	autorizacionID int NOT NULL ,
	nuserID int NOT NULL ,
	feliminacion timestamp NULL 
) ;

CREATE SEQUENCE autorizaciones.autorizaciones_id_seq;

CREATE TABLE autorizaciones.autorizaciones(
	autorizacionID int  NOT NULL default nextval('autorizaciones.autorizaciones_id_seq'),
	institucionid integer NOT NULL ,
	titularid int NULL ,
	codfamid integer NULL ,
	numero_internacion int NULL ,
	numero_prorroga int NULL ,
	fecha_practica timestamp NULL ,
	fecha_generacion timestamp NULL ,
	derivado_por varchar(60)  NULL ,
	codigoPreDeriva int NULL ,
	medico_practicante varchar(30)  NULL ,
	codigoPreCirujano int NULL ,
	lugar_de_intervencion varchar(30)  NULL ,
	codigoPreInstituto int NULL ,
	diagnostico varchar(1500)  NULL ,
	ingreso_por varchar(15)  NULL ,
	piso varchar(6)  NULL ,
	cantidad integer NULL ,
	facturar_afiliado integer NULL ,
	factura int NULL ,
	monto_factura numeric(7, 2) NULL ,
	costoTotalPractica numeric(7, 2) NULL ,
	observaciones varchar(1500)  NULL ,
	fecha_alta_internacion timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE autorizaciones.autorizaciones_de_internaciones(
	institucionid integer NULL ,
	titularid int NULL ,
	codfamid integer NULL ,
	numero_internacion int NULL ,
	numero_prorroga int NULL ,
	fecha_internacion timestamp NULL ,
	fecha_generacion timestamp NULL ,
	codigo_estudio numeric(9, 0) NOT NULL ,
	derivado_por varchar(30)  NOT NULL ,
	medico_practicante varchar(30)  NULL ,
	lugar_de_intervencion varchar(30)  NULL ,
	diagnostico varchar(80)  NULL ,
	ingreso_por varchar(15)  NULL ,
	piso varchar(6)  NULL ,
	cantidad integer NULL ,
	facturar_afiliado integer NULL ,
	factura int NULL ,
	monto_factura numeric(7, 2) NULL ,
	codigoNN numeric(9, 0) NULL 
) ;


CREATE TABLE autorizaciones.autorizaciones_de_practicas(
	institucionid integer NULL ,
	titularid int NULL ,
	codfamid integer NULL ,
	fecha_pedido timestamp NULL ,
	codigoestudio numeric(9, 0) NOT NULL ,
	autorizado_por varchar(30)  NOT NULL ,
	diagnostico varchar(30)  NULL ,
	cantidad integer NULL ,
	facturar_afiliado integer NULL ,
	factura int NULL ,
	monto_factura numeric(7, 2) NULL ,
	observaciones varchar(30)  NULL ,
	codigoNN numeric(9, 0) NULL 
) ;


CREATE TABLE afiliados.bajasafiliados(
	institucionid integer NULL ,
	titularid int NOT NULL ,
	codfamID integer NOT NULL ,
	PlanID varchar(10)  NULL ,
	Apellido varchar(30)  NULL ,
	Nombre varchar(20)  NULL ,
	promotorid varchar(30)  NULL ,
	Falta timestamp NULL ,
	Fbaja timestamp NULL ,
	ValorCuota numeric(7, 2) NULL ,
	motivoid varchar(30)  NULL ,
	Empr int NULL ,
	domicilio varchar(86)  NULL ,
	telefono varchar(40)  NULL ,
	filtro varchar(60)  NULL 
) ;


CREATE TABLE contable.bancos(
	institucionid integer NULL ,
	nombre varchar(20)  NULL ,
	numero_cta int NULL ,
	numero_sucursal int NULL ,
	miscelaneas varchar(50)  NULL 
) ;


CREATE TABLE estadisticas.cabeceraAdemp(
	ncodigo integer NOT NULL ,
	cdescripcion varchar(120)  NULL 
) ;


CREATE TABLE afiliados.caren_tipo(
	carenciaID integer NOT NULL ,
	institucionID integer NOT NULL ,
	descripcion varchar(20)  NULL ,
	dias integer NULL 
) ;


CREATE TABLE afiliados.carencias(
	titularID int NOT NULL ,
	codfamID integer NOT NULL ,
	carenciaID integer NOT NULL ,
	institucionID integer NOT NULL ,
	fecha_inicio timestamp NULL 
) ;


CREATE TABLE contable.cheques(
	institucionID integer NULL ,
	numero int NULL ,
	nro_orden_pago int NULL ,
	fecha_cheque timestamp NULL ,
	banco varchar(50)  NULL ,
	estado varchar(1)  NULL ,
	importe numeric(18, 2) NULL ,
	fecha_gene timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;

create sequence afiliados.clases_id_seq;
CREATE TABLE afiliados.clases(
	claseID integer NOT NULL default nextval('afiliados.clases_id_seq') ,
	institucionID integer NULL ,
	descripcion varchar(50)  NULL ,
	precio numeric(7, 2) NULL ,
	cvigente varchar(1)  NULL 
) ;


CREATE TABLE afiliados.clasi_Bajas(
	desde int NULL ,
	hasta int NULL 
) ;


CREATE TABLE afiliados.clasi_Etarea(
	desde integer NULL ,
	hasta integer NULL 
) ;


CREATE TABLE afiliados.coberturas(
	planid varchar(8)  NULL ,
	institucionid integer NULL ,
	codigo_estudio int NULL ,
	practica varchar(30)  NULL ,
	descripcion varchar(20)  NULL ,
	precio numeric(7, 2) NULL ,
	limite integer NULL ,
	lleva_autorizacion varchar(1)   
) ;

create sequence afiliados.coberturas_de_planes_id_seq;

CREATE TABLE afiliados.coberturas_de_planes(
	n_registro integer NOT NULL default nextval('afiliados.coberturas_de_planes_id_seq') ,
	institucionid integer NULL ,
	modulo varchar(20)  NULL ,
	desde_practica varchar(10)  NULL ,
	hasta_practica varchar(10)  NULL ,
	tope integer NULL ,
	planID varchar(10)  NOT NULL ,
	empresaID varchar(8)  NULL ,
	topeMensual integer NULL ,
	coseguro integer NULL ,
	topeTrimestral integer NULL 
) ;


CREATE TABLE afiliados.comisiones(
	institucionID integer NOT NULL ,
	tipo varchar(1)  NOT NULL ,
	titularID int NULL ,
	fecha_registro timestamp NULL ,
	anio int NULL ,
	mes integer NULL ,
	importe numeric(7, 2) NULL ,
	estado varchar(10)  NULL ,
	PromotorID varchar(30)  NULL ,
	Descripcion varchar(30)  NULL ,
	porcentaje numeric(7, 2) NULL ,
	item varchar(20)  NULL 
) ;


CREATE TABLE afiliados.consumo_afiliados(
	institucionID integer NULL ,
	tipo varchar(1)  NULL ,
	titularID numeric(18, 0) NULL ,
	planID varchar(10)  NULL ,
	empresaID integer NULL ,
	derivacionID varchar(15)  NULL ,
	tot_Facturado numeric(18, 2) NULL ,
	tot_Capitas integer NULL ,
	tot_Consumo_Pagado numeric(18, 0) NULL ,
	tot_Cobranza numeric(18, 2) NULL ,
	anio_Periodo integer NULL ,
	mes_periodo integer NULL 
) ;


CREATE TABLE afiliados.consumo_afiliados_total(
	institucionID integer NULL ,
	tipo varchar(1)  NULL ,
	titularID numeric(18, 0) NULL ,
	planID varchar(10)  NULL ,
	empresaID integer NULL ,
	derivacionID varchar(15)  NULL ,
	tot_Facturado numeric(18, 2) NULL ,
	tot_Capitas integer NULL ,
	tot_Consumo_Pagado numeric(18, 0) NULL ,
	tot_Cobranza numeric(18, 2) NULL ,
	anio_Periodo integer NULL ,
	mes_periodo integer NULL 
) ;


CREATE TABLE afiliados.contrato_para_facturar_afiliados(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	claseID integer NOT NULL ,
	codfamid integer NULL 
) ;




CREATE TABLE contable.controlCobranzasFactImpagas(
	institucionID integer NOT NULL ,
	titularID int NOT NULL ,
	cobradorID varchar(20)  NOT NULL ,
	facturasPendientes varchar(100)  NULL ,
	facturasPagas varchar(100)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE autorizaciones.convenios(
	prestadorid int NOT NULL ,
	institucionid integer NOT NULL ,
	desde_practica varchar(10)  NOT NULL ,
	hasta_practica varchar(10)  NOT NULL ,
	fecha timestamp NOT NULL ,
	planes varchar(350)  NOT NULL ,
	tipo varchar(1)  NOT NULL ,
	tipo_valor varchar(2)  NOT NULL ,
	valor numeric(9, 2) NOT NULL ,
	cusuario varchar(15)  NOT NULL ,
	fultman timestamp NOT NULL ,
	observaciones varchar(250)  NULL ,
	cIVR integer NULL ,
	gastos numeric(7, 2) NOT NULL 
) ;


CREATE TABLE autorizaciones.convenios_BORRAR(
	prestadorid int NOT NULL ,
	institucionid integer NOT NULL ,
	desde_practica varchar(10)  NOT NULL ,
	hasta_practica varchar(10)  NOT NULL ,
	fecha timestamp NOT NULL ,
	planes varchar(350)  NOT NULL ,
	tipo varchar(500)  NOT NULL ,
	tipo_valor varchar(2)  NOT NULL ,
	valor numeric(9, 2) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	observaciones varchar(250)  NULL ,
	cIVR integer NULL ,
	gastos numeric(7, 2) NULL ,
	atiende_solo_planes_altos integer NULL 
) ;


CREATE TABLE afiliados.ctacte_apo(
	institucionID integer NOT NULL ,
	titularid int NOT NULL ,
	factura_anio integer NOT NULL ,
	factura_mes integer NOT NULL ,
	valor_cuota numeric(9, 2) NOT NULL ,
	aporte numeric(9, 2) NOT NULL ,
	saldo numeric(9, 2) NOT NULL ,
	facturado_por numeric(9, 2) NOT NULL ,
	fultman timestamp NOT NULL ,
	cusuario varchar(15)  NOT NULL 
) ;


CREATE TABLE afiliados.cuota_inscriptos(
	titularid float NULL ,
	nombre varchar(255)  NULL ,
	cuota numeric(18, 2)  
) ;


CREATE TABLE contable.datos_de_facturacion_mensual(
	institucionID integer NOT NULL ,
	anio_periodo integer NOT NULL ,
	mes_periodo integer NOT NULL ,
	fecha_generacion timestamp NOT NULL ,
	numero_factura_A numeric(18, 0) NOT NULL ,
	numero_factura_B numeric(18, 0) NOT NULL ,
	fecha_impresion timestamp NOT NULL ,
	procesa_bajas integer NULL ,
	recategoriza integer NULL ,
	genera_cuotas integer NULL ,
	finalizo_factura_A numeric(18, 0) NULL ,
	finalizo_factura_B numeric(18, 0) NULL 
) ;


CREATE TABLE autorizaciones.datos_de_prestadores(
	prestadorid int NOT NULL ,
	institucionid integer NOT NULL ,
	domicilio varchar(60)  NOT NULL ,
	telefono varchar(50)  NOT NULL ,
	area varchar(30)  NOT NULL ,
	especialidad varchar(50)  NOT NULL ,
	otros_datos varchar(50)  NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	email_1 varchar(256)  NULL ,
	email_2 varchar(256)  NULL ,
	miscelaneas text  NULL 
) ;
CREATE SEQUENCE contable.debitoscreditos_id_seq;

CREATE TABLE contable.debitoscreditos(
	codigo_interno integer NOT NULL default nextval('contable.debitoscreditos_id_seq') ,
	nro_liquidacion int NOT NULL ,
	institucionid integer NOT NULL ,
	proveedorID int NOT NULL ,
	codigo_empresa int NOT NULL ,
	letra_factura varchar(1)  NULL ,
	centro_emisor int NULL ,
	nro_factura int NULL ,
	tipo_documento varchar(10)  NULL ,
	letra_documento varchar(1)  NULL ,
	centro_emisor_documento int NULL ,
	nro_documento int NULL ,
	detalle varchar(90)  NULL ,
	fecha_emision timestamp NULL ,
	importe_columna numeric(9, 2) NULL ,
	importe_subtotal1 numeric(9, 2) NULL ,
	importe_impuesto numeric(9, 2) NULL ,
	importe_subtotal2 numeric(9, 2) NULL ,
	importe_gravado numeric(9, 2) NULL ,
	importe_exento numeric(9, 2) NULL ,
	iva numeric(7, 2) NULL ,
	iva_no_inscripto numeric(9, 2) NULL ,
	importe_final numeric(9, 2) NULL ,
	Estado varchar(1)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	cae varchar(14)  NULL ,
	FVencCAE timestamp NULL ,
	FAnulacion timestamp NULL ,
	cOrigenDocu integer NOT NULL 
) ;


CREATE TABLE afiliados.derivacion(
	derivacionID varchar(15)  NOT NULL ,
	institucionID integer NOT NULL ,
	razon_social varchar(40)  NULL ,
	tipo varchar(15)  NULL ,
	domicilio varchar(40)  NULL ,
	codigopostal int NULL ,
	localidadID varchar(20)  NULL ,
	telefono1 varchar(20)  NULL ,
	telefono2 varchar(20)  NULL ,
	fax varchar(20)  NULL ,
	correo_electronico varchar(50)  NULL ,
	contacto varchar(50)  NULL ,
	cobradorID varchar(20)  NULL ,
	promotorID varchar(20)  NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	estado integer NULL ,
	porc_aporte numeric(5, 2) NULL ,
	cuit varchar(15)  NULL ,
	tipo_iva varchar(50)  NULL ,
	miscelanea text  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE autorizaciones.detalle_de_autorizaciones(
	autorizacionID int NULL ,
	institucionID integer NULL ,
	titularID int NULL ,
	codFamID int NULL ,
	fecha_generacion timestamp NULL ,
	codigo_practica varchar(10)  NULL ,
	valor_practica numeric(10, 2) NULL ,
	cantidad integer NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	nro_liquidacion numeric(18, 0) NULL ,
	subcodigo integer NULL ,
	coseguro numeric(5, 2) NULL 
) ;

CREATE SEQUENCE contable.detalle_de_facturas_de_prestadores_id_seq;

	  alter table autorizaciones.detalle_de_autorizaciones 
  add CONSTRAINT detalle_de_autorizaciones_afil_fkey foreign KEY
  (institucionid,  titularid ,    codfamid ) references afiliados.afiliados (institucionid,  titularid ,    codfamid)
	


CREATE TABLE auditoria.detalle_de_facturas_de_prestadores(
	codigo  integer NOT NULL default nextval('auditoria.detalle_de_facturas_de_prestadores_id_seq') ,

	nro_liquidacion int NOT NULL ,
	institucionid integer NOT NULL ,
	tipo_prestacion varchar(1)  NOT NULL ,
	codigonomenclador varchar(10)  NOT NULL ,
	titularid int NOT NULL ,
	codfamid integer NOT NULL ,
	importe_facturado numeric(9, 2) NOT NULL ,
	coseguro numeric(9, 2) NULL ,
	cantidad int NULL ,
	importe_pagado numeric(9, 2) NOT NULL ,
	codigodebito integer NULL ,
	fecha_prestacion timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	pedidoPorPrest int NULL ,
	subcodigo integer NULL 
) ;

CREATE INDEX IF NOT EXISTS idx_det_detalle_de_facturas_liqui
    ON auditoria.detalle_de_facturas_de_prestadores USING btree
    (institucionid ASC NULLS LAST, nro_liquidacion ASC NULLS LAST)
    TABLESPACE pg_default;
	
	
	 
CREATE INDEX IF NOT EXISTS idx_det_detalle_de_facturas_titularid
    ON auditoria.detalle_de_facturas_de_prestadores USING btree
    (institucionid ASC NULLS LAST, titularid,codfamid ASC NULLS LAST)
    TABLESPACE pg_default;
	

CREATE TABLE auditoria.detalle_de_memo_debitos(
	institucionID integer NULL ,
	nro_liquidacion int NULL ,
	descripcion text  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;

CREATE SEQUENCE contable.detalle_de_facturas_id_seq;

	
CREATE TABLE contable.detalle_de_facturas(
	codigo  integer NOT NULL default nextval('contable.detalle_de_facturas_id_seq') ,
	nro_liquidacion int NOT NULL ,
	institucionid integer NOT NULL ,
	tipo_prestacion varchar(1)  NOT NULL ,
	codigonomenclador varchar(10)  NOT NULL ,
	titularid int NOT NULL ,
	codfamid integer NOT NULL ,
	importe_facturado numeric(9, 2) NOT NULL ,
	coseguro numeric(9, 2) NULL ,
	cantidad int NULL ,
	importe_pagado numeric(9, 2) NOT NULL ,
	codigodebito integer NULL ,
	fecha_prestacion timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	pedidoPorPrest int NULL ,
	subcodigo integer NULL 
) ;


CREATE TABLE dsk_ospoce(
	Socio varchar(15)  NULL ,
	Cuil numeric(18, 0) NULL ,
	Nombre varchar(30)  NULL ,
	Plan varchar(10)  NULL ,
	Capmen65 numeric(3, 0) NULL ,
	Capmay65 numeric(3, 0) NULL ,
	Cuotagrp numeric(12, 2) NULL 
) ;


CREATE TABLE afiliados.empr_deb_aut(
	emprdebID varchar(15)  NOT NULL ,
	institucionID integer NOT NULL ,
	nombre_banco varchar(30)  NULL ,
	codigo_banco integer NULL ,
	sucursal integer NULL ,
	establecimiento varchar(20)  NULL ,
	observa text  NULL 
) ;


CREATE TABLE afiliados.empresas(
	empresaID int NOT NULL ,
	institucionID integer NOT NULL ,
	razon_social varchar(40)  NOT NULL ,
	derivacionID varchar(15)  NOT NULL ,
	domicilio varchar(40)  NULL ,
	codigopostal int NULL ,
	localidadID varchar(20)  NULL ,
	telefono1 varchar(20)  NULL ,
	telefono2 varchar(20)  NULL ,
	fax varchar(20)  NULL ,
	correo_electronico varchar(50)  NULL ,
	contacto varchar(50)  NULL ,
	cobradorID varchar(20)  NULL ,
	promotorID varchar(20)  NULL ,
	fecha_alta timestamp NOT NULL ,
	fecha_baja timestamp NULL ,
	estado integer NULL ,
	porc_aporte numeric(5, 2) NULL ,
	ultimo_aporte numeric(7, 2) NULL ,
	ultimo_afiliado int NULL ,
	cuit varchar(15)  NULL ,
	tipo_iva varchar(50)  NOT NULL ,
	miscelanea text  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE auditoria.encabezados_de_practicas(
	codigo int NULL ,
	descripcion varchar(40)  NULL 
) ;


CREATE TABLE estadisticas.especial_sssalud(
	id int NOT NULL ,
	descripcion varchar(70)  NULL 
) ;


CREATE TABLE autorizaciones.especialidades(
	especialidadid varchar(50)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;

CREATE SEQUENCE autorizaciones.estadosautorizaciones_id_seq;


	
CREATE TABLE autorizaciones.estadosautorizaciones(
	registroID  integer NOT NULL default nextval('autorizaciones.estadosautorizaciones_id_seq') ,
	institucionID integer NULL ,
	titularID numeric(9, 0) NULL ,
	codfamID integer NULL ,
	fecha_carga timestamp NULL ,
	codigoNN varchar(10)  NULL ,
	motivo varchar(500)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	estado varchar(1)  NULL 
) ;


CREATE TABLE afiliados.facturacion_CBU(
	institucionID integer NULL ,
	titularID numeric(18, 0) NULL ,
	fenvio timestamp NULL ,
	anio_periodo  int NULL ,
	mes_periodo int NULL ,
	importe numeric(18, 2) NULL 
) ;


CREATE TABLE afiliados.facturacion_derivada(
	codigoID varchar(5)  NULL ,
	institucionid integer NULL ,
	empresa varchar(50)  NULL ,
	domicilio_fact varchar(60)  NULL ,
	localidad_fact varchar(40)  NULL ,
	cod_postal_fact int NULL ,
	telefono_fact varchar(15)  NULL ,
	cuit varchar(15)  NULL ,
	fecha_alta timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE contable.facturas(
	institucionID integer NOT NULL ,
	centro_emisor integer NOT NULL ,
	letra varchar(1)  NOT NULL ,
	numero int NOT NULL ,
	tipo_documento varchar(1)  NOT NULL ,
	fecha_gene timestamp NULL ,
	fecha_listado timestamp NULL ,
	titularid int NOT NULL ,
	empresaid integer  NULL ,
	anio_periodo integer NULL ,
	mes_periodo integer NULL ,
	descripcion varchar(500)  NULL ,
	tipo_factura varchar(6)  NULL ,
	estado varchar(1)  NULL ,
	importe numeric(10, 2) NULL ,
	iva numeric(9, 2) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	Aplica_Factura int NULL ,
	fecha_venc timestamp NULL ,
	cae varchar(14)  NULL ,
	FVencCAE timestamp NULL ,
	FAnulacion timestamp NULL ,
	sBase64QR varchar(1000)  NULL 
) ;


CREATE TABLE contable.facturas_de_prestadores(
	nro_liquidacion int NOT NULL ,
	institucionid integer NOT NULL ,
	prestadorid  integer NOT NULL ,
	tipo_gasto varchar(10)  NULL ,
	letra_factura varchar(1)  NOT NULL ,
	centro_emisor int NOT NULL ,
	nro_factura int NOT NULL ,
	detalle varchar(50)  NULL ,
	fecha_contable timestamp NOT NULL ,
	fecha_emision timestamp NULL ,
	estado nchar(20)  NULL ,
	importe_gravado numeric(10, 2) NOT NULL ,
	importe_exento numeric(10, 2) NULL ,
	iva numeric(8, 2) NULL ,
	importe_final numeric(10, 2) NOT NULL ,
	total_debitos numeric(10, 2) NULL ,
	importe_pagado numeric(10, 2) NULL ,
	mes_gasto integer NOT NULL ,
	anio_gasto int NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	fecha_venc timestamp NULL ,
	tipo_docu varchar(1)  NULL ,
	ncaja int NULL ,
	percepcion_ib numeric(9, 2) NULL 
) ;


CREATE TABLE hist_mov_deb(
	institucionID integer NOT NULL ,
	fpresentacion timestamp NOT NULL ,
	empresa varchar(10)  NOT NULL ,
	numero varchar(16)  NOT NULL ,
	titularID int NOT NULL ,
	apenom varchar(50)  NOT NULL ,
	factura varchar(13)  NOT NULL ,
	importe numeric(9, 2) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE afiliados.historico_de_bajas(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	motivoID varchar(30)  NOT NULL ,
	fecha_baja timestamp NOT NULL 
) ;


CREATE TABLE afiliados.historico_de_planes(
	titularID int NOT NULL ,
	numero_anterior int NULL ,
	institucionID integer NOT NULL ,
	planID varchar(10)  NOT NULL ,
	fecha_cambio timestamp NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE afiliados.historico_os(
	institucionid integer NOT NULL ,
	titularid int NOT NULL ,
	codfamid integer NOT NULL ,
	derivacionID varchar(15)  NOT NULL ,
	fdesde timestamp NOT NULL ,
	fhasta timestamp NULL ,
	cusuario varchar(15)  NOT NULL ,
	fultman timestamp NOT NULL 
) ;


CREATE TABLE contable.impreCtaCteDeudores(
	fecha timestamp NULL 
) ;


CREATE TABLE afiliados.impresion_grupo_familiar(
	numero int NULL ,
	institucionid integer NULL ,
	grupoFamiliar varchar(1000)  NULL 
) ;


CREATE TABLE afiliados.impresionTitulares(
	institucionID int NULL ,
	desdeTitular numeric(11, 0) NULL ,
	hastaTitular numeric(11, 0) NULL ,
	desdeEmpresa varchar(11)  NULL ,
	hastaEmpresa varchar(11)  NULL ,
	desdePlan varchar(10)  NULL ,
	hastaPlan varchar(10)  NULL ,
	desdeCobrador varchar(20)  NULL ,
	hastaCobrador varchar(20)  NULL ,
	desdePromotor varchar(20)  NULL ,
	hastaPromotor varchar(20)  NULL ,
	desdeLocalidad varchar(40)  NULL ,
	hastaLocalidad varchar(40)  NULL ,
	desdeFalta timestamp NULL ,
	hastaFalta timestamp NULL ,
	desdeFbaja timestamp NULL ,
	hastaFbaja timestamp NULL ,
	desdeafiliados varchar(15)  NULL ,
	hastaafiliados varchar(15)  NULL ,
	cantCapitas int NULL 
) ;


CREATE TABLE institucion.institucion(
	institucionID integer NOT NULL ,
	razon_social varchar(30)  NOT NULL ,
	domicilio varchar(150)  NULL ,
	codigopostal varchar(15)  NULL ,
	localidad varchar(20)  NOT NULL ,
	cuit varchar(15)  NOT NULL ,
	ingresos_brutos varchar(15)  NULL ,
	ramo varchar(20)  NULL ,
	autoimpresor varchar(1)  NULL ,
	logo varchar(50)  NULL ,
	email varchar(50)  NULL ,
	telefono varchar(60)  NULL ,
	nNroRefEmpresaPagoFacil int NULL ,
	nNroRefEmpresaPagoMisCuentas int NULL ,
	nNroRefEmpresaRapiPago int NULL ,
	servidor_smtp varchar(100)  NULL ,
	servidor_pop varchar(100)  NULL ,
	puerto_mail varchar(5)  NULL ,
	ip_pagina_admin varchar(20)  NULL ,
	path_pagina_admin varchar(200)  NULL 
) ;


CREATE TABLE afiliados.inventario_solicitudes(
	institucionID integer NULL ,
	NroSolicitud numeric(18, 0) NULL ,
	titularID int NULL ,
	promotorID varchar(20)  NULL ,
	fecha_a_promotor timestamp NULL ,
	fecha_a_sistema timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE contable.letra_Comprobante(
	institucionID integer NULL ,
	letra varchar(1)  NULL 
) ;


CREATE TABLE listados_de_facturacion(
	codigo integer NOT NULL ,
	descripcion varchar(60)  NULL 
) ;


CREATE TABLE estadisticas.local_sssalud(
	id int NOT NULL ,
	iprovID int NULL ,
	ilocalID int NULL ,
	descripcion varchar(70)  NULL 
) ;


CREATE TABLE afiliados.localidades(
	localidadID varchar(40)  NULL ,
	institucionID integer NOT NULL ,
	zona varchar(30)  NOT NULL 
) ;


CREATE TABLE logFallasAfilStatusPlan(
	institucionID integer NOT NULL ,
	planID varchar(10)  NOT NULL ,
	titularid int NOT NULL ,
	codfamid integer NOT NULL ,
	edad integer NOT NULL 
) ;


CREATE TABLE autorizaciones.memoautorizaciones(
	descripcion varchar(200)  NULL ,
	institucionID integer NULL 
) ;


CREATE TABLE auditoria.memoDebitos(
	descripcion varchar(2500)  NULL ,
	institucionID integer NULL 
) ;


CREATE TABLE miscelaneas(
	codigo integer NULL ,
	descripcion varchar(60)  NULL 
) ;


CREATE TABLE afiliados.motivos_de_baja (
	motivoID varchar(30)  NULL 
) ;

CREATE SEQUENCE contable.motivos_de_debitos_id_seq;

	
CREATE TABLE contable.motivos_de_debitos(
	debitoid  integer NOT NULL default nextval('contable.motivos_de_debitos_id_seq') ,
	descripcion varchar(60)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE auditoria.nomenclador_estudios(
	codigoestudio int NULL ,
	codigoencabezado int NULL ,
	practica varchar(50)  NULL 
) ;


CREATE TABLE auditoria.nomenclador_nacional(
	codigonn varchar(10)  NOT NULL ,
	institucionid integer NOT NULL ,
	id_nom varchar(255)  NULL ,
	cod01 integer NULL ,
	cod02 integer NULL ,
	cod03 integer NULL ,
	subcodigo integer NOT NULL ,
	descripcion varchar(255)  NULL ,
	especialista numeric(7, 2) NULL ,
	ayudante numeric(6, 2) NULL ,
	anestesista numeric(6, 2) NULL ,
	thonorarios numeric(6, 2) NULL ,
	gastos numeric(6, 2) NULL ,
	total numeric(8, 2) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	observaciones varchar(500)  NULL ,
	nCantAyu integer NULL ,
	dNorma varchar(500)  NULL ,
	cUnidadArancelaria varchar(1)  NULL ,
	dFormaFact varchar(50)  NULL ,
	nCodigoAdemp integer NULL ,
	nUnidadEspecialista numeric(8, 2) NULL ,
	nUnidadAyudante numeric(8, 2) NULL ,
	nUnidadAnestesista numeric(8, 2) NULL ,
	nUnidadGastos numeric(8, 2) NULL ,
	tipoModulo varchar(20)  NULL ,
	unidad_bioquimica numeric(6, 2) NULL 
) ;


alter table  auditoria.nomenclador_nacional(
  add CONSTRAINT nomenclador_nacional_pkey primary KEY
  (codigonn, institucionid) references afiliados.afiliados (codigonn ,institucionid)
		
		
CREATE TABLE contable.numeros_de_control(
	tipo nchar(30)  NULL ,
	institucionid integer NULL ,
	numero int NULL 
) ;


CREATE TABLE contable.orden_de_pago(
	nro_orden_pago int NOT NULL ,
	institucionid integer NOT NULL ,
	proveedorid varchar(15)  NULL ,
	tipo_operacion varchar(1)  NULL ,
	descripcion varchar(35)  NULL ,
	fecha_emision timestamp NOT NULL ,
	importe_parcial numeric(9, 2) NOT NULL ,
	retencion_ganancias numeric(9, 2) NULL ,
	retencion_ingr_brutos numeric(7, 2) NULL ,
	importe_total numeric(9, 2) NULL ,
	forma_pago  varchar(1)  NOT NULL ,
	cheque_numero varchar(15)  NULL ,
	banco varchar(20)  NULL ,
	fecha_cheque timestamp NULL ,
	certificadoIB numeric(18, 0) NULL ,
	certificadoIG numeric(18, 0) NULL ,
	retencion_caja_provincia numeric(18, 0) NULL ,
	certificadoCP numeric(18, 0) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	recibo_prov varchar(15)  NULL 
) ;

CREATE TABLE contable.renglon_orden_de_pago (
	nro_orden_pago int NOT NULL ,
	institucionid smallint NOT NULL ,
	nro_liquidacion int NOT NULL ,
	letra char (1)  NULL ,
	centro_emisor int NULL ,
	numero_factura int NOT NULL ,
	importe_total numeric(9, 2) NOT NULL ,
	descripcion char (25) NOT NULL ,
	cusuario char (15)  NULL ,
	fultman timestamp NULL 
) ;



CREATE SEQUENCE afiliados.patologiasafiliados_id_seq;

	
CREATE TABLE afiliados.patologiasafiliados(
	registroID  integer NOT NULL default nextval('afiliados.patologiasafiliados_id_seq') ,
	institucionID integer NOT NULL ,
	titularID int NOT NULL ,
	codfamID integer NOT NULL ,
	fecha_carga timestamp NOT NULL ,
	tipopatologia varchar(40)  NOT NULL ,
	observaciones text  NULL ,
	valor numeric(9, 2) NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	fdesde timestamp NULL ,
	fhasta timestamp NULL 
) ;


CREATE TABLE pepe(
	codigo varchar(10)  NULL 
) ;


CREATE TABLE estadisticas.periodosAdemp(
	anio int NULL ,
	mes int NULL 
) ;


CREATE TABLE afiliados.periodosConsumo(
	desdePer int NULL ,
	hastaPer int NULL ,
	trimestre int NULL 
) ;


CREATE TABLE permisos_a_programas(
	institucionid integer NOT NULL ,
	nombre_formulario varchar(30)  NOT NULL ,
	usuario varchar(30)  NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE afiliados.plan_anterior(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	planID varchar(8)  NOT NULL ,
	fecha_cambio timestamp NOT NULL 
) ;


CREATE TABLE afiliados.planes(
	planID varchar(10)  NOT NULL ,
	institucionID integer NOT NULL ,
	descripcion varchar(30)  NOT NULL ,
	tipo varchar(10)  NOT NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	porce_farmacia integer NULL 
) ;

CREATE TABLE afiliados.planes_crede (
	institucionid smallint not null,
	planID varchar (10) nOT NULL ,
	planID_credencial varchar (10) nOT NULL ,
	cusuario varchar (15) ,
	fultman timestamp NULL ,
constraint planes_crede_pkey primary key  (institucionid,planID, planID_credencial ),
 constraint planes_crede_fkey foreign key (institucionid,planID) references afiliados.planes (institucionid,planID)
) 

CREATE TABLE afiliados.precio_de_planes_para_empresas(
	planID varchar(10)  NOT NULL ,
	institucionID integer NOT NULL ,
	empresaid int NOT NULL ,
	claseID integer NOT NULL ,
	precio money NOT NULL 
) ;


CREATE TABLE afiliados.precio_planes_empresa_19_08_2020(
	planID varchar(10)  NOT NULL ,
	institucionID integer NOT NULL ,
	empresaid int NOT NULL ,
	claseID integer NOT NULL ,
	precio money NOT NULL 
) ;


CREATE TABLE autorizaciones.prestadores(
	prestadorid int NOT NULL ,
	institucionid integer NOT NULL ,
	nombre varchar(60)  NULL ,
	tipo varchar(20)  NULL ,
	estado integer NULL ,
	matr_naci int NULL ,
	matr_prov int NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	proveedorid int NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	ctipoIVR varchar(1)  NULL ,
	atiende_solo_planes_altos integer NULL 
) ;


CREATE TABLE autorizaciones.prestadoresbackup(
	prestadorid int NOT NULL ,
	institucionid integer NOT NULL ,
	nombre varchar(60)  NULL ,
	tipo varchar(20)  NULL ,
	estado integer NULL ,
	matr_naci int NULL ,
	matr_prov int NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	proveedorid varchar(15)  NULL 
) ;


CREATE TABLE afiliados.promotores(
	promotorID varchar(30)  NOT NULL ,
	institucionID integer NOT NULL ,
	supervisor varchar(30)  NULL ,
	categoria varchar(10)  NULL ,
	domicilio varchar(40)  NULL ,
	telefonos varchar(50)  NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	zona_cobro varchar(15)  NULL 
) ;


CREATE TABLE contable.proveedores(
	proveedorid int NOT NULL ,
	institucionid integer NOT NULL ,
	cta_interna varchar(1)  NULL ,
	razon_social varchar(35)  NOT NULL ,
	razonSocReal varchar(50)  NULL ,
	domicilio varchar(40)  NULL ,
	localidad varchar(40)  NULL ,
	telefono varchar(25)  NULL ,
	responsable varchar(30)  NULL ,
	tipo_iva varchar(30)  NULL ,
	tipo_ret_gan varchar(20)  NULL ,
	cuit float NULL ,
	jubilacion float NULL ,
	ingresos_brutos float NULL ,
	tipo_gasto varchar(10)  NULL ,
	cta_debe float NULL ,
	cta_haber float NULL ,
	estado integer NULL ,
	tipo_ret_ib varchar(20)  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	ctaBancaria varchar(25)  NULL ,
	NdiasPago integer NULL ,
	cta_debe_exenta float NULL 
) ;




CREATE TABLE contable.recibos_de_cobro(
	titularid int NULL ,
	institucionid integer NULL ,
	numero int NULL ,
	letra varchar(1)  NULL ,
	centro_emisor integer NULL ,
	cancela_factura int NULL ,
	cobradorid varchar(20)  NULL ,
	forma_pago  varchar(2)  NULL ,
	descr_cheque varchar(20)  NULL ,
	importe numeric(10, 2) NULL ,
	porcentaje_cobro numeric(3, 1) NULL ,
	fecha_cobro timestamp NULL ,
	retencion numeric(7, 2) NULL ,
	fecha_rendicion timestamp NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	recibo_cobro varchar(15)  NULL 
) ;


CREATE TABLE afiliados.registros_de_debito_automatico(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	apellido varchar(30)  NULL ,
	empresa_tarjeta varchar(10)  NULL ,
	numero varchar(16)  NULL ,
	valor numeric(7, 2) NULL ,
	anio integer NULL ,
	mes integer NULL 
) ;





CREATE TABLE contable.retenciones(
	retencionid varchar(30)  NULL ,
	monto numeric(9, 2) NULL ,
	porcentaje numeric(5, 2) NULL 
) ;


CREATE TABLE  contable.retencionesIB(
	retencionID varchar(30)  NULL ,
	monto numeric(18, 0) NULL ,
	porcentaje numeric(18, 0) NULL 
) ;


CREATE TABLE institucion.sucursales(
	institucionid integer NOT NULL ,
	sucursal varchar(50)  NOT NULL 
) ;


CREATE TABLE afiliados.suscripcionFacturas(
	institucionid integer NOT NULL ,
	titularid int NOT NULL ,
	fecha timestamp NOT NULL 
) ;


CREATE TABLE afiliados.tarjetas_de_creditopago(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	emprdebID varchar(15)  NOT NULL ,
	numero varchar(16)  NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;




/*
CREATE TABLE tempImpresionBajas(
	desdeFecha timestamp NULL ,
	hastaFecha timestamp NULL ,
	codigo varchar(50)  NULL ,
	descripcion varchar(60)  NULL ,
	institucionID integer NULL 
) ;


CREATE TABLE tempImpresionGasto(
	desdePeriodo varchar(10)  NULL ,
	hastaPeriodo varchar(10)  NULL ,
	tipo varchar(255)  NULL ,
	descripcion varchar(255)  NULL ,
	cantidad int NULL ,
	totFacturado numeric(10, 2) NULL ,
	totDebitos numeric(10, 2) NULL ,
	totPagado numeric(10, 2) NULL ,
	tasaDeUsoXAfil numeric(10, 2) NULL ,
	tasaDeUsoCadaMilAfil numeric(10, 2) NULL 
) ;


CREATE TABLE tempInformeAnalisisEmpresas(
	institucionID integer NULL ,
	codigoEmpresa numeric(11, 0) NULL ,
	razon_social varchar(40)  NULL ,
	deriva varchar(40)  NULL ,
	sumCapitasEmp int NULL ,
	titularID numeric(9, 0) NULL ,
	fecha_alta timestamp NULL ,
	fecha_baja timestamp NULL ,
	planID varchar(8)  NULL ,
	sumCapitasTit int NULL ,
	valor_cuota numeric(9, 2) NULL ,
	sumAportes numeric(9, 2) NULL ,
	sumFacturacion numeric(9, 2) NULL ,
	sumGastoMedico numeric(9, 2) NULL 
) ;


CREATE TABLE tempPrintInternacion(
	autorizacionID int NULL ,
	descripcion varchar(80)  NULL ,
	institucionID integer NULL 
) ;


CREATE TABLE tempPrintNotasRenovaCred(
	institucionID integer NOT NULL ,
	titularID int NOT NULL 
) ;



CREATE TABLE temp_print_cupones(
	institucionID integer NULL ,
	Nombre_01 varchar(30)  NULL ,
	Socio_01 varchar(20)  NULL ,
	PlanID_01 varchar(15)  NULL ,
	Cobertura_01 varchar(12)  NULL ,
	Nombre_02 varchar(30)  NULL ,
	Socio_02 varchar(20)  NULL ,
	PlanID_02 varchar(15)  NULL ,
	Cobertura_02 varchar(12)  NULL ,
	Nombre_03 varchar(30)  NULL ,
	Socio_03 varchar(20)  NULL ,
	PlanID_03 varchar(15)  NULL ,
	Cobertura_03 varchar(12)  NULL ,
	Nombre_04 varchar(30)  NULL ,
	Socio_04 varchar(20)  NULL ,
	PlanID_04 varchar(15)  NULL ,
	Cobertura_04 varchar(12)  NULL ,
	Nombre_05 varchar(30)  NULL ,
	Socio_05 varchar(20)  NULL ,
	PlanID_05 varchar(15)  NULL ,
	Cobertura_05 varchar(12)  NULL ,
	Nombre_06 varchar(30)  NULL ,
	Socio_06 varchar(20)  NULL ,
	PlanID_06 varchar(15)  NULL ,
	Cobertura_06 varchar(12)  NULL ,
	Nombre_07 varchar(30)  NULL ,
	Socio_07 varchar(20)  NULL ,
	PlanID_07 varchar(15)  NULL ,
	Cobertura_07 varchar(12)  NULL ,
	Nombre_08 varchar(30)  NULL ,
	Socio_08 varchar(20)  NULL ,
	PlanID_08 varchar(15)  NULL ,
	Cobertura_08 varchar(12)  NULL ,
	Nombre_09 varchar(30)  NULL ,
	Socio_09 varchar(20)  NULL ,
	PlanID_09 varchar(15)  NULL ,
	Cobertura_09 varchar(12)  NULL ,
	Nombre_10 varchar(30)  NULL ,
	Socio_10 varchar(20)  NULL ,
	PlanID_10 varchar(15)  NULL ,
	Cobertura_10 varchar(12)  NULL ,
	Nombre_11 varchar(30)  NULL ,
	Socio_11 varchar(20)  NULL ,
	PlanID_11 varchar(15)  NULL ,
	Cobertura_11 varchar(12)  NULL 
) ;


CREATE TABLE temp_print_fact(
	institucionID integer NOT NULL ,
	letra varchar(1)  NOT NULL ,
	centro_emisor_desde integer NOT NULL ,
	factura_desde int NOT NULL ,
	centro_emisor_hasta integer NOT NULL ,
	factura_hasta int NOT NULL ,
	nro_liquidacion int NULL ,
	tipo_documento varchar(10)  NULL 
) ;




CREATE TABLE temporal_de_impresion_ctacte_proveedores(
	tipo_docu varchar(10)  NULL ,
	proveedorid varchar(10)  NULL ,
	institucionid integer NULL ,
	nro_orden_pago int NULL ,
	detalle varchar(35)  NULL ,
	letra varchar(1)  NULL ,
	centro_emisor integer NULL ,
	nro_factura int NULL ,
	fecha timestamp NULL ,
	importe numeric(9, 2) NULL ,
	saldo_factura numeric(9, 2) NULL ,
	saldo_final numeric(9, 2) NULL ,
	recibo_prov varchar(15)  NULL 
) ;

*/

CREATE TABLE contable.tipo_gasto(
	gastoid varchar(10)  NULL ,
	descripcion varchar(50)  NULL 
) ;


CREATE TABLE auditoria.tipopatologia(
	institucionid integer NOT NULL ,
	patologia varchar(40)  NOT NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL 
) ;


CREATE TABLE afiliados.titulares(
	titularID int NOT NULL ,
	institucionID integer NOT NULL ,
	empresaID int NULL ,
	apellido varchar(30)  NULL ,
	nombre varchar(20)  NULL ,
	planID varchar(10)  NOT NULL ,
	domicilio_fact varchar(65)  NULL ,
	cod_postal_fact int NULL ,
	localidad_fact varchar(40)  NULL ,
	provincia varchar(15)  NULL ,
	telefono_fact varchar(40)  NULL ,
	domicilio_adic varchar(65)  NULL ,
	cod_postal_adic int NULL ,
	localidad_adic varchar(40)  NULL ,
	telefono_adic varchar(40)  NULL ,
	correo_electronico varchar(320)  NULL ,
	cobradorID varchar(20)  NULL ,
	promotorID varchar(30)  NULL ,
	referencia_cobranza varchar(40)  NULL ,
	fecha_alta timestamp NULL ,
	fecha_carga timestamp NULL ,
	fecha_baja timestamp NULL ,
	fecha_cambio_plan timestamp NULL ,
	estado integer NULL ,
	tipo_iva varchar(30)  NULL ,
	cuit varchar(15)  NULL ,
	derivacionID varchar(15)  NULL ,
	deriva_facturacion varchar(5)  NULL ,
	cuil varchar(15)  NULL ,
	_30_dias integer NULL ,
	_60_dias integer NULL ,
	_180_dias integer NULL ,
	_300_dias integer NULL ,
	_360_dias integer NULL ,
	tipo_descuento varchar(1)  NULL ,
	descuento numeric(5, 2) NULL ,
	fin_descuento timestamp NULL ,
	valor_cuota numeric(7, 2) NULL ,
	factura_desde timestamp NULL ,
	miscelanea text  NULL ,
	cusuario varchar(15)  NULL ,
	fultman timestamp NULL ,
	cuit_empleador varchar(11)  NULL ,
	razon_social_empleador varchar(40)  NULL ,
	fax varchar(20)  NULL ,
	interseccion_domi varchar(45)  NULL ,
	interseccion_fact varchar(45)  NULL ,
	mail_facturacion varchar(256)  NULL ,
	whatsup varchar(20)  NULL ,
	ccodigoIngresoWeb int NULL 
) ;




CREATE TABLE institucion.usuarios(
	institucionid integer NOT NULL ,
	usuario varchar(30)  NOT NULL ,
	sucursal varchar(50)  NOT NULL ,
	cusuario varchar(15)  NOT NULL ,
	fultman timestamp NOT NULL 
) ;


CREATE TABLE institucion.usuariosafiliados(
	institucionID integer NOT NULL ,
	nuserID int NOT NULL ,
	cusuario int NOT NULL ,
	ccontrasenia bytea NOT NULL ,
	falta timestamp NULL ,
	ccodigoCambPwd int NULL 
) ;


CREATE TABLE institucion.afiliadosRoles(
	institucionID integer NOT NULL ,
	rolID integer NOT NULL ,
	nuserID int NOT NULL ,
	rolName varchar(50)  NOT NULL 
) ;
CREATE SEQUENCE institucion.usuariosPrestadores_id_seq;


CREATE TABLE institucion.usuariosPrestadores(
	institucionID integer NOT NULL ,
	nuserID  integer NOT NULL default nextval('institucion.usuariosPrestadores_id_seq') ,
	nprestadorID int NOT NULL ,
	cusuario varchar(256)  NOT NULL ,
	token varchar(256)  NULL ,
	ccontrasenia bytea NOT NULL ,
	falta timestamp NULL ,
	ccodigoCambPwd int NULL 
) ;
ALTER TABLE institucion.usuariosPrestadores ADD CONSTRAINT usuariosPrestadores_pk PRIMARY KEY    
	(
		institucionID ,
		nuserID
	)   
;


CREATE TABLE institucion.usuariosPrestadoresRoles(
	institucionID integer NOT NULL ,
	rolID integer NOT NULL ,
	nuserID int NOT NULL ,
	rolName varchar(50)  NOT NULL 
) ;

-- Table: institucion.usuariosempleados

-- DROP TABLE institucion.usuariosempleados;
begin;

CREATE SEQUENCE institucion.usuariosempleados_id_seq;

CREATE TABLE institucion.usuariosempleados
(
  institucionid integer NOT NULL,
  nuserid integer NOT NULL DEFAULT nextval('institucion.usuariosempleados_id_seq'::regclass),
  email  character varying(256) NOT NULL,
  token character varying(256),
  ccontrasenia bytea NOT NULL,
  falta timestamp without time zone,
  ccodigocambpwd integer,
  cusuario varchar(15)  NULL ,
  fultman timestamp NULL ,
  CONSTRAINT usuariosempleados_pk PRIMARY KEY (institucionid, nuserid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE institucion.usuariosempleados
  OWNER TO postgres;

  CREATE TABLE institucion.usuariosempleadosroles
(
  institucionid integer NOT NULL,
  nuserid integer NOT NULL,
  rolname character varying(50) NOT NULL,
  item_menu boolean,
  cusuario varchar(15)  NULL ,
  fultman timestamp NULL ,
   constraint usuariosempleadosroles_pkey primary key (institucionid,nuserid,rolname) ,
  constraint usuariosempleadosroles_fkey foreign key(institucionid,nuserid) 
   references institucion.usuariosempleados (institucionid,nuserid) 
) ;
ALTER TABLE institucion.usuariosempleadosroles  OWNER TO postgres;






CREATE UNIQUE INDEX usuariosempleados_idx
  ON institucion.usuariosempleados
  USING btree
  (institucionid, email COLLATE pg_catalog."default");




CREATE TABLE zonas(
	zona varchar(30)  NOT NULL 
) ;








CREATE  view vCobranzas as 
select e.institucionID, a.codigoid, e.numero,e.letra, t.titularID, t.apellido || ' ' || t.nombre as nom, 
 e.importe,
 e.importe/1.105 * e.porcentaje_cobro/100 as comision,
 (e.importe -  e.importe/1.105 * e.porcentaje_cobro/100) as diferencia  
,e.fecha_cobro, e.fecha_rendicion, e.cobradorID 
from afiliados.titulares t, 
     contable.recibos_de_cobro e left join afiliados.agentes_de_cobro a on ( e.institucionID =  a.institucionID  and    e.cobradorid = a.cobradorid ) ,  
      contable.alicuota_iva d 
 where e.institucionID =  t.institucionID  
   and e.institucionID =  d.institucionID  
   and e.titularid = t.titularid 


union all
select e.institucionID, a.codigoid, e.numero,e.letra, e.titularID, t.razon_social as nom, 
 e.importe,
 e.importe/1.105 * e.porcentaje_cobro/100 as comision,
 (e.importe -  e.importe/1.105 * e.porcentaje_cobro/100) as diferencia  
,e.fecha_cobro, e.fecha_rendicion, e.cobradorID 
from afiliados.empresas t,
 contable.recibos_de_cobro e left join afiliados.agentes_de_cobro a on ( e.institucionID =  a.institucionID  and    e.cobradorid = a.cobradorid ) ,  
      contable.alicuota_iva d 
 where   e.institucionID =  t.institucionID 
   and   e.institucionID =  d.institucionID   
   and   e.titularID = t.empresaID 
    ;
 















-- drop view autorizaciones.conveniosValoresActuales
create view autorizaciones.conveniosValoresActuales
as
select distinct
       t.institucionid,
       t.prestadorID,
       t.desde_practica,
       t.hasta_practica,
       t.planes,
       (select  x.civr from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes 
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha, x.civr desc limit 1 ) as civr ,
       (select  x.gastos from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes 
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha ,x.civr desc limit 1) as gastos ,
       (select  x.observaciones from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes   
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha desc limit 1) as observaciones,
       (select  x.fecha from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes   
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha limit 1) as fecha ,
       (select x.tipo from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes   
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha limit 1) as tipo ,
       (select x.tipo_valor from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes   
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha limit 1) as tipo_valor ,  
       (select  x.valor from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes   
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha limit 1) as valor ,
        (select  x.cusuario from autorizaciones.convenios x
        where x.institucionID = t.institucionID
	and   x.prestadorID = t.prestadorID  
	and   x.desde_practica = t.desde_practica 
	and   x.hasta_practica = t.hasta_practica 
	and   x.planes = t.planes   
	--and   x.tipo_= t.tipo_
	and   x.tipo_valor = t.tipo_valor
        order by x.fecha limit 1) as usuario  

from autorizaciones.convenios t, auditoria.nomenclador_nacional n
Where t.institucionID = n.institucionID
and   t.desde_practica = n.codigoNN;





















create view vCtasCtesClientes as 
select  f.institucionID,
	f.centro_emisor, 
	f.letra ,
	f.numero,
	f.tipo_documento,
	f.fecha_listado,
	f.titularid,
	f.empresaid ,
	f.anio_periodo,
	f.mes_periodo,
	f.descripcion,
	f.estado ,
	f.importe,
	f.Aplica_Factura,
        f.titularID as CodCliente, 
        rtrim(t.apellido) || ' ' || rtrim(t.nombre) as nomCliente
from contable.facturas f, afiliados.titulares t
where f.titularID  = t.titularID 
and   f.institucionID  = t.institucionID 
and   f.tipo_documento='F'
and   f.estado<>'A'
union all
select 
	f.institucionID,
	f.centro_emisor, 
	f.letra ,
	f.numero,
	f.tipo_documento,
	f.fecha_listado,
	f.titularid,
	f.empresaid ,
	f.anio_periodo,
	f.mes_periodo,
	f.descripcion,
	f.estado ,
	f.importe,
	f.Aplica_Factura,
        f.empresaID as CodCliente, 
        rtrim(t.razon_social) as nomCliente
from contable.facturas f, afiliados.empresas t
where f.empresaID    = t.empresaID 
and   f.institucionID  = t.institucionID 
and   f.titularID<100
and   f.tipo_documento='F'
and   f.estado<>'A' 
union all
select  f.institucionID,
	f.centro_emisor, 
	f.letra ,
	f.numero,
	f.tipo_documento,
	f.fecha_listado,
	f.titularid,
	f.empresaid ,
	f.anio_periodo,
	f.mes_periodo,
	f.descripcion,
	f.estado ,
	f.importe*-1 ,
	f.Aplica_Factura,
        f.titularID as CodCliente, 
        rtrim(t.apellido) || ' ' || rtrim(t.nombre) as nomCliente
from contable.facturas f, afiliados.titulares t
where f.titularID  = t.titularID 
and   f.institucionID  = t.institucionID 
and   f.tipo_documento<>'F'
and   f.estado<>'A'
and   COALESCE (f.Aplica_Factura,0)=0
union all
select 
	f.institucionID,
	f.centro_emisor, 
	f.letra ,
	f.numero,
	f.tipo_documento,
	f.fecha_listado,
	f.titularid,
	f.empresaid ,
	f.anio_periodo,
	f.mes_periodo,
	f.descripcion,
	f.estado ,
	f.importe*-1 ,
	f.Aplica_Factura,
        f.empresaID   as CodCliente, 
        rtrim(t.razon_social) as nomCliente
from contable.facturas f, afiliados.empresas t
where f.empresaID  = t.empresaID 
and   f.institucionID  = t.institucionID 
and   f.tipo_documento<>'F'
and   f.titularID<5000
and   f.estado<>'A'
and   COALESCE (f.Aplica_Factura,0)=0
union all
select 
	f.institucionID,
	1 as centro_emisor, 
	'X' as letra ,
	f.numero,
	'X' as tipo_documento,
	f.fechaImpresion as fecha_listado,
	f.titularid,
	t.empresaid,
	f.anio as anio_periodo,
	f.mes as mes_periodo,
	'RECIBO PROVISORIO' as descripcion,
	f.estado ,
	f.valor as importe,
	Null as Aplica_Factura,
        f.titularID as CodCliente, 
        rtrim(t.apellido) || ' ' || rtrim(t.nombre) as nomCliente
 FROM contable.impresion_de_recibos f, afiliados.titulares t
where f.titularid = t.titularID
 and f.institucionid = t.institucionid;








create view vCtaCteDeudoresCocina as 
select  r.institucionid, r.titularid, count(1) as flagFechaPasada 
     from contable.recibos_de_cobro r, vCtasCtesClientes v, contable.impreCtaCteDeudores d
     where  v.institucionID = r.institucionid 
     AND v.letra = r.letra 
     AND v.centro_emisor = r.centro_emisor 
     AND v.numero = r.cancela_factura
     AND DATE_PART('day', d.fecha::timestamp -r.fecha_cobro::timestamp)>0
     AND DATE_PART('day', d.fecha::timestamp -v.fecha_listado::timestamp)<=0
     
group by r.institucionid, r.titularid;












CREATE view vCtasCtesClientesConcilia as
SELECT
    v.institucionID, v.centro_emisor, v.letra, v.numero, v.tipo_documento, v.fecha_listado, 
    v.anio_periodo, v.mes_periodo, v.descripcion, v.estado, v.importe, v.CodCliente, 
    v.nomCliente
FROM
    contable.impreCtaCteDeudores c ,vCtasCtesClientes v 
WHERE v.estado ='P'
 AND  v.fecha_listado<=c.fecha
 AND v.numero not in 
(select n.Aplica_Factura from contable.facturas n
where n.institucionid=v.institucionid
and  n.tipo_documento IN ('C')
and  n.letra=v.letra
and  n.importe = v.importe
and  n.titularid = v.titularid 
and  n.fecha_listado<=c.fecha)
UNION
SELECT
    v.institucionID, v.centro_emisor, v.letra, v.numero, v.tipo_documento, v.fecha_listado, 
    v.anio_periodo, v.mes_periodo, v.descripcion, v.estado, v.importe, v.CodCliente, 
    v.nomCliente
FROM
   contable.impreCtaCteDeudores c , vCtasCtesClientes v 
WHERE v.estado ='C'
  AND v.fecha_listado<=c.fecha
  AND v.numero in 
(select n.cancela_factura from contable.recibos_de_cobro n
where n.institucionid=v.institucionid
and  n.letra=v.letra
and  n.centro_emisor=v.centro_emisor
and  n.fecha_cobro>c.fecha);














CREATE       view vEstadisInternaciones as
select
f.institucionID,
f.titularid,
f.codFamid,
f.numero_internacion,
(select  x.fecha_practica from autorizaciones.autorizaciones x
    where  x.institucionID= f.institucionID 
      and  x.numero_internacion= f.numero_internacion
       order by  x.fecha_practica desc limit 1) as fechaPractica,
f.codigoPreInstituto,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='QUIURGICO') as  cant_dias_quirurgico,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='CLINICOS') as  cant_dias_clinico,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='UCO') as  cant_dias_uco,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='UTI') as  cant_dias_uti,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='UTI_NEO') as  cant_dias_uti_neo,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='PARTO') as  cant_dias_parto,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='CESAREA') as  cant_dias_cesarea,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo='INTERDOMI') as  cant_dias_interdomi,
(select coalesce(sum(d.cantidad),0) from  autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional n
			WHERE a.institucionID= f.institucionID 
			And a.institucionID= d.institucionID 
			And a.institucionID= n.institucionID 
			AND a.autorizacionid= d.autorizacionid  
			AND d.codigo_practica=n.codigonn 
			AND a.numero_internacion=f.numero_internacion
			AND n.tipoModulo is null) as  cant_dias_otros

from  autorizaciones.autorizaciones f
WHERE f.numero_internacion>0 
GROUP BY f.institucionID,f.titularid,f.codFamid,f.numero_internacion,f.codigoPreInstituto;



create view vGastoIngresadoSinAuditar as  
select r.proveedorID,
        r.razon_social,
        f.nro_liquidacion,
        f.letra_factura,
        f.nro_factura,
        f.fecha_emision as femision,
	f.importe_final AS totImporte,
	r.tipo_gasto,  
	f.anio_gasto*100+f.mes_gasto as periodo,
	f.institucionID,
	f.ncaja
 from contable.facturas_de_prestadores f, 
 autorizaciones.prestadores p, 
 contable.proveedores r 
 WHERE f.prestadorID = p.prestadorID
 AND   p.proveedorID= r.proveedorID
 AND   f.tipo_gasto= 'PME'
 AND   f.institucionid= p.institucionid
 AND   f.institucionid= r.institucionid
 AND   f.nro_liquidacion not in
(select  nro_liquidacion  
 from  contable.detalle_de_facturas_de_prestadores
  where institucionID =  f.institucionID
);



create view vGastoIngresadoSinEstadoAuditado as  
select r.proveedorID,
        r.razon_social,
        f.nro_liquidacion,
        f.letra_factura,
        f.nro_factura,
        f.fecha_emision as femision,
	f.importe_final AS totImporte,
	r.tipo_gasto,  
	f.anio_gasto*100+f.mes_gasto as periodo,
        f.estado,
	f.institucionID,
        f.ncaja 
 from contable.facturas_de_prestadores f, 
 autorizaciones.prestadores p, 
 contable.proveedores r 
 WHERE f.prestadorID= p.prestadorID
 AND   p.proveedorID= r.proveedorID
 AND   f.institucionid= p.institucionid
 AND   f.institucionid= r.institucionid
 AND   f.estado='PARA AUDITAR'
 AND   f.tipo_gasto= 'PME';

create view vGastoPagadoSinAuditar as  
select r.proveedorID,
        r.razon_social,
        f.nro_liquidacion,
        f.letra_factura,
        f.nro_factura,
        f.fecha_emision as femision,
	o.importe_total AS totPagado,
	r.tipo_gasto,  
	f.anio_gasto*100+f.mes_gasto as periodo,
        o.nro_orden_pago as nODP,
	f.institucionID,
        f.ncaja
 from contable.renglon_orden_de_pago o, 
 contable.facturas_de_prestadores f, 
 autorizaciones.prestadores p, 
 contable.proveedores r 
 WHERE o.nro_liquidacion = f.nro_liquidacion
 AND   f.prestadorID= p.prestadorID
 AND   p.proveedorID= r.proveedorID
 AND   o.institucionid = f.institucionid
 AND   o.institucionID= p.institucionID
 AND   o.institucionID= r.institucionID
 AND   f.tipo_gasto= 'PME'
 AND   f.nro_liquidacion not in
(select  nro_liquidacion  
 from  contable.detalle_de_facturas_de_prestadores
  where institucionID =  f.institucionID
);



















CREATE     view vInternadosActuales as

select distinct v.* from vEstadisInternaciones v, autorizaciones.autorizaciones a
where v.institucionid=a.institucionid
  and v.numero_internacion=a.numero_internacion
  and a.fecha_alta_internacion is null
and v.institucionid=1;
















CREATE  view vIvaventas as 
SELECT     f.institucionid, t .titularID AS CodCliente, f.tipo_documento, f.fecha_listado, t .apellido || ' ' || t .nombre AS descr, '0' AS cuit, t .tipo_iva, f.mes_periodo, 
                      f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, f.importe- f.iva AS neto, f.iva, 0 AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.titulares t
WHERE     f.institucionid = t .institucionid AND f.titularid = t .titularid AND t .tipo_iva in ('CONSUMIDOR FINAL','MONOTRIBUTISTA') AND f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, t .titularID AS CodCliente, f.tipo_documento, f.fecha_listado, t .apellido || ' ' || t .nombre AS descr, t .cuit AS cuit, t .tipo_iva, 
                      f.mes_periodo, f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, f.importe- f.iva AS neto, f.iva, 0 AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.titulares t
WHERE     f.institucionid = t .institucionid AND f.titularid = t .titularid AND t .tipo_iva = 'RESPONSABLE INSCRIPTO' AND t .deriva_facturacion NOT IN
                          (SELECT     n.codigoid
                            FROM          afiliados.facturacion_derivada n
                            WHERE      n.codigoid = t .deriva_facturacion) AND f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, f.titularID AS CodCliente, f.tipo_documento, f.fecha_listado, e.empresa AS descr, e.cuit AS cuit, t .tipo_iva, f.mes_periodo, 
                      f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, f.importe- f.iva AS neto, f.iva, 0 AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.titulares t, afiliados.facturacion_derivada e
WHERE     f.institucionid = t .institucionid AND f.institucionid = e.institucionid AND f.titularid = t .titularid AND t .deriva_facturacion = e.codigoid AND 
                      t .tipo_iva = 'RESPONSABLE INSCRIPTO' AND f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, t .titularID AS CodCliente, f.tipo_documento, f.fecha_listado, t .apellido || ' ' || t .nombre AS descr, t .cuil AS cuit, t .tipo_iva, 
                      f.mes_periodo, f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, f.importe- f.iva AS neto, f.iva, f.importe AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.titulares t
WHERE     f.titularid = t .titularid AND t .tipo_iva = 'EXENTO' AND f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, t.empresaID AS CodCliente, f.tipo_documento, f.fecha_listado, t .razon_social AS descr, t .cuit AS cuit, t .tipo_iva, f.mes_periodo, 
                      f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, f.importe- f.iva AS neto, f.iva, 0 AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.empresas t
WHERE     f.institucionid = t .institucionid AND t .tipo_iva = 'RESPONSABLE INSCRIPTO' AND f.empresaid = t.empresaid AND f.empresaid > 0 AND 
                      f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, t.empresaID AS CodCliente, f.tipo_documento, f.fecha_listado, t .razon_social AS descr, t .cuit AS cuit, t .tipo_iva, f.mes_periodo, 
                      f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, 0 AS neto, f.iva, f.importe AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.empresas t
WHERE     f.institucionid = t .institucionid AND t .tipo_iva = 'EXENTO' AND f.empresaid = t.empresaid AND f.empresaid > 0 AND f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, t.empresaID AS CodCliente, f.tipo_documento, f.fecha_listado, t .razon_social AS descr, t .cuit AS cuit, t .tipo_iva, f.mes_periodo, 
                      f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe AS total, f.importe- f.iva AS neto, f.iva, 0 AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f, afiliados.empresas t
WHERE     f.institucionid = t .institucionid AND t .tipo_iva   in ('CONSUMIDOR FINAL','MONOTRIBUTISTA')AND f.empresaid = t.empresaid AND f.empresaid > 0 AND f.estado <> 'A'
UNION ALL
SELECT     f.institucionid, NULL AS codCliente, f.tipo_documento, f.fecha_listado, 'ANULADA' AS descr, '0' AS cuit, '', f.mes_periodo, f.anio_periodo, f.letra, 
                      f.centro_emisor, f.numero, 0 AS total, 0 AS neto, 0, 0 AS exento, f.tipo_factura as tipoFactura
FROM         contable.facturas f
WHERE     f.estado = 'A';

















create view vLibroCompras as 
select  f.institucionid,
	'FACTURA' as tDoc,
	f.letra_factura,
	f.centro_emisor,
	f.nro_factura,
	f.fecha_emision,
	f.fecha_contable  as fcontable,
	f.importe_gravado as ImpGravado,
	f.importe_exento as ImpExento,
	f.iva ,
	f.importe_final,
        f.percepcion_ib as ImpPercIIBB,
	t.razon_social,
	t.cuit
from contable.facturas_de_prestadores f, contable.proveedores t 
 Where f.institucionid=t.institucionid 
  and  f.prestadorid=t.proveedorid
union 
select  f.institucionid,
	f.tipo_documento as tDoc,
	f.letra_documento,
	f.centro_emisor documento,
	f.nro_documento,
	f.fecha_emision,
	f.fecha_emision as fcontable,
	f.importe_gravado as ImpGravado,
	f.importe_subtotal1 as ImpExento,
	f.iva ,
	f.importe_final,
        0 as ImpPercIIBB,
	t.razon_social,
	t.cuit 
from contable.debitoscreditos f, contable.proveedores t

where f.institucionid=t.institucionid 
  and f.proveedorID=t.proveedorID
  and f.tipo_documento='DEBITO'
union 
select  f.institucionid,
	f.tipo_documento as tDoc,
	f.letra_documento,
	f.centro_emisor documento,
	f.nro_documento,
	f.fecha_emision,
        f.fecha_emision  as fcontable,
	f.importe_gravado as ImpGravado,
	f.importe_subtotal1 as ImpExento,
	f.iva ,
	f.importe_final,
        0 as ImpPercIIBB,
	t.razon_social,
	t.cuit
from contable.debitoscreditos f,  contable.proveedores t 
where f.proveedorID=t.proveedorID
  and f.tipo_documento='CREDITO';



















CREATE  view vOrdenDePagos as 
select  f.institucionid,
        o.nro_orden_pago,
    f.nro_liquidacion,
    'FACTURA' as tDoc,
    f.letra_factura,
    f.centro_emisor,
    f.nro_factura,
    f.fecha_emision,
    f.fecha_contable  as fcontable,
    f.importe_gravado as ImpGravado,
    f.importe_exento as ImpExento,
    f.iva ,
    f.importe_final,
        f.detalle as descripcion,
    t.razon_social,
    t.cuit
from contable.renglon_orden_de_pago o,contable.facturas_de_prestadores f, contable.proveedores t 
 Where f.institucionid=t.institucionid 
  and  f.institucionid=o.institucionid 
  and  f.prestadorID=t.proveedorID
  and  f.nro_liquidacion= o.nro_liquidacion
union 
select  f.institucionid,
        o.nro_orden_pago, 
    f.nro_liquidacion,
    f.tipo_documento as tDoc,
    f.letra_documento,
    f.centro_emisor documento,
    f.nro_documento,
    f.fecha_emision,
    f.fecha_emision as fcontable,
    f.importe_gravado as ImpGravado,
    f.importe_subtotal1 as ImpExento,
    f.iva ,
    f.importe_final,
        f.detalle as descripcion,
    t.razon_social,
    t.cuit 
from contable.renglon_orden_de_pago o, contable.debitoscreditos f, contable.proveedores t 
 Where f.institucionid=t.institucionid 
  and  f.institucionid=o.institucionid 
  and  f.proveedorID=t.proveedorID
  and  f.nro_liquidacion= o.nro_liquidacion
  and  f.estado<>'A';










CREATE  function fnGetEdadHastaDeClase (
inst integer,
clase varchar(50))
returns  integer as 
$body$


declare return_val integer;
-- recibe la string con la descripcion de la tabla clase, ejemplo "DE 18 A 24 AÑOS"
-- y devuelve 24
begin

select
 case 
  when position(' 100 ' in descripcion) >0 then
    substring (descripcion,position(' A ' in descripcion)+3,3)
  when position(' 6 ' in descripcion)> 0 or position(' 100 ' in descripcion) >0 then
    substring (descripcion , position(' A ' in descripcion)+3,2)
  when descripcion='MENORES 0 A 11 MESES' then
    '1'
  else
    substring (descripcion,position(' A ' in descripcion)+3,3) 
 end  into return_val
  from clases
where institucionid=inst and descripcion = clase and charindex(' A ',descripcion)>0;


return return_val;

END;

$body$
language plpgsql volatile  
cost 100;







create view vPasadosEdadPlan as 
select a.institucionID, 
a.titularid, a.codfamid, 
DATE_PART('year', AGE(now(), a.fecha_naci)) as edad,
c.descripcion as descPlan
from afiliados.clases c,
afiliados.contrato_para_facturar_afiliados f,
afiliados.precio_de_planes_para_empresas s,
afiliados.titulares t,
afiliados.afiliados a 
where f.claseID = c.claseID 
and f.claseID = s.claseID
and s.empresaid= t.empresaid
and f.institucionID = c.institucionID
and f.institucionID = s.institucionID
and f.institucionID = t.institucionID
and f.institucionID = a.institucionID
and f.titularID = t.titularID
and a.titularID = t.titularID
and f.codfamiD = a.codfamID
and s.planID = t.planID
and a.fecha_baja is null
and DATE_PART('year', AGE(now(), a.fecha_naci))  > fnGetEdadHastaDeClase(1,descripcion)
and position ('AÑO' in c.descripcion) > 0 ;

create  view vSeguimientoBajas as
SELECT   
 t.institucionid,
 t.titularID , 
 a.codfamid,
 a.apellido || ' ' || a.nombre as nombre,
 t.planID,  
 case
  when a.codfamID = 0 then 
     t.valor_cuota
  else
     0
 end as cuota,
 (select  count(1) from afiliados.afiliados h
  where h.titularid=t.titularid
    and h.institucionID=t.institucionID
    and h.fecha_baja = a.fecha_baja) as cantFam,
 a.fecha_alta,
 a.fecha_baja,
 cast(date_part('day', a.fecha_baja -  a.fecha_alta)/30 as  VARCHAR)  as Meses_En_Prepaga,
  (select  h.motivoid from afiliados.historico_de_bajas h
  where h.titularid=t.titularid
    and h.institucionID=t.institucionID
   order by h.fecha_baja desc limit 1) as motivo_baja,
(select  coalesce(sum(d.importe_pagado),0) from contable.detalle_de_facturas_de_prestadores d
  where d.titularid=t.titularid
    and d.institucionID=t.institucionID) as consumoTotal,
  t.domicilio_fact as domicilio,
  t.localidad_fact as localidad,
  t.telefono_fact as telefonos,
  s.razon_social
 FROM  afiliados.titulares t, 
       afiliados.empresas s, 
       afiliados.afiliados a
   WHERE t.institucionID=a.institucionID
   AND   s.institucionID = a.institucionID
   AND   t.titularID = a.titularid 
   AND   t.empresaID = s.empresaID
   AND   a.codfamID = 0;
   













create VIEW vTotalesBajasPorMotivo as
SELECT b.institucionid, b.motivoid, SUM(totGrupos) as totGrupos , SUM(totCapitas) as totCapitas  FROM
(SELECT institucionid, motivoid ,count(1) as totGrupos, 0 as totCapitas FROM afiliados.bajasafiliados
WHERE codfamID=0
GROUP BY institucionid, motivoid
UNION ALL 
SELECT institucionid, motivoid , 0 as totGrupos, count(1) as totCapitas FROM afiliados.bajasafiliados
GROUP BY institucionid, motivoid) b
GROUP BY b.institucionid, b.motivoid; 













create view v_DatosDeafiliados as
select 
a.institucionID, 
a.titularid, 
a.codfamid,
a.apellido || ' ' || a.nombre as apenom, 
a.fecha_alta as falta,
a.fecha_baja as fbaja,
a.fecha_naci as fnaci,
DATE_PART('year', AGE(now(), a.fecha_naci)) as edad_actual,
t.planid,
c.descripcion as descPlan
from afiliados.clases c,
afiliados.contrato_para_facturar_afiliados f,
afiliados.precio_de_planes_para_empresas s,
afiliados.titulares t,
afiliados.afiliados a 
where f.claseID = c.claseID 
and f.claseID = s.claseID
and s.empresaid= t.empresaid
and f.institucionID = c.institucionID
and f.institucionID = s.institucionID
and f.institucionID = t.institucionID
and f.institucionID = a.institucionID
and f.titularID = t.titularID
and a.titularID = t.titularID
and f.codfamiD = a.codfamID
and s.planID = t.planID;



create view v_MotovoBajaAgrupado as 
select 'GRUPO 1' as grupo,'BAJA OPCION' as motivo
union
select 'GRUPO 1' as grupo,'CAMBIO OBRA SOCIAL' as motivo
union
select 'GRUPO 1' as grupo,'CAMBIO OBRA SOCIAL (FTP)' as motivo
union
select 'GRUPO 1' as grupo,'DISISTIR CAMBIO O.S.' as motivo
union
select 'GRUPO 1' as grupo,'OBRA SOCIAL' as motivo
union
select 'GRUPO 1' as grupo,'OPCION FINALIZADA ANSES)' as motivo
union
select 'GRUPO 1' as grupo,'OPCION FINALIZADA SSS)' as motivo
union
select 'GRUPO 1' as grupo,'RECHAZO S.S.S.' as motivo
union
select 'GRUPO 2' as grupo,'BAJA LABORAL' as motivo
union
select 'GRUPO 2' as grupo,'BAJA LABORAL INF POR EMPRESA' as motivo
union
select 'GRUPO 2' as grupo,'BAJA LABORAL INF POR O.S.)' as motivo
union
select 'GRUPO 2' as grupo,'DISTRATO LABORAL' as motivo
union
select 'GRUPO 3' as grupo,'AUMENTO DE CUOTA' as motivo
union
select 'GRUPO 3' as grupo,'PROBLEMAS ECONOMICOS' as motivo;














--drop view v_NomenclaNacional

CREATE  view v_NomenclaNacional as 
select codigonn, institucionid, id_nom, cod01, cod02, cod03, 
subcodigo, descripcion, especialista, ayudante, anestesista, 
thonorarios, gastos,  total,
cusuario, fultman, observaciones,
 nCantAyu, dNorma, cUnidadArancelaria, dFormaFact, ncodigoAdemp,unidad_bioquimica
  from auditoria.nomenclador_nacional
;














create  view v_comparativo_clinicas as
select distinct 
t.institucionid,
l.zona, 
t.desde_practica,
y.descripcion,
t.tipo_valor,
n.nombre,
t.tipo, 
(select x.otros_datos  from autorizaciones.datos_de_prestadores x
Where x.institucionID = t.institucionID
and   x.prestadorID = t.prestadorID  limit 1) as localidad,
case
 when t.tipo_valor = 'VF' then t.valor
 when t.tipo_valor = 'NN' then
 (select  n.total + (n.total * t.valor /100)
  from auditoria.nomenclador_nacional n
  Where n.INSTITUCIONID = t.INSTITUCIONID
   and n.codigonn =t.desde_practica )

 when t.tipo_valor = 'UN' then
 (select  (coalesce(n.nUnidadEspecialista,0)+coalesce(n.nUnidadAyudante,0)*coalesce(n.nCantAyu,1)+coalesce(n.nUnidadAnestesista,0)) * t.valor +  n.nUnidadGastos * t.gastos
  from auditoria.nomenclador_nacional n
 Where n.INSTITUCIONID = t.INSTITUCIONID
   and n.codigonn =t.desde_practica )
 end  As valor
from autorizaciones.conveniosValoresActuales t,
autorizaciones.prestadores n, autorizaciones.datos_de_prestadores x, afiliados.localidades l , auditoria.nomenclador_nacional y
Where t.institucionID = 1
and   t.institucionID = n.institucionID
and   t.institucionID = l.institucionID
and   t.institucionID = x.institucionID
and   t.institucionID = y.institucionID
and   t.desde_practica=y.codigonn
and   t.desde_practica in 
('1','180101','340301','420101','4201011','180140','180301','170101','COLELAP','MODARTRO','MODARTROC ','MODCLI',
'MODCLIPED','MODPARTO','MODCESAR','UTISARM','UTICARM','UTINEOCA','UTINEOSA','UTIPED','UTIPEDSARM','MODQX1SD',
'MODQX1D','MODQXDS', 'COLELAP', 'MODARTRO','MODARTROC','MODCLI')
and   t.prestadorID = n.prestadorID
and   t.prestadorID = x.prestadorID
and   x.otros_datos = l.localidadid
--and l.zona in ('GRAN BS.AS.SUR','GRAN BS.AS.NORTE','GRAN BS.AS.OESTE')
--and l.zona in ('GRAN BS.AS.OESTE')
--and fecha>='01/01/2014'
--and   t.tipo_='A'
and   n.estado=0
and n.tipo in('CLINICA','SANATORIO');



CREATE     view v_consumoPorAfiliado
as 

select
 a.institucionid,
 a.planid,
 a.titularid,
 a.tot_capitas,
 a.tot_facturado,
 a.tot_consumo_pagado,
 a.tot_cobranza
from
(select
 institucionid,
 planid,
 titularid,
 count(tot_capitas) as tot_capitas,
 sum(tot_facturado)as tot_facturado,
 sum(tot_consumo_pagado) as tot_consumo_pagado,
 sum(tot_cobranza) tot_cobranza

from afiliados.consumo_afiliados 
where tipo='A'
group by institucionid, planid, titularid) a
where  a.tot_capitas +  a.tot_facturado +  a.tot_consumo_pagado + a.tot_cobranza >0
;

cREATE    view v_consumoPorPlan
as 

select
 a.institucionid,
 a.planid,
 a.tot_capitas,
 a.tot_facturado,
 a.tot_consumo_pagado,
 a.tot_cobranza
from
(select
 institucionid,
 planid,
 sum(tot_capitas) as tot_capitas,
 sum(tot_facturado)as tot_facturado,
 sum(tot_consumo_pagado) as tot_consumo_pagado,
 sum(tot_cobranza) tot_cobranza

from afiliados.consumo_afiliados 
where tipo='A'
group by institucionid, planid) a
where  a.tot_capitas +  a.tot_facturado +  a.tot_consumo_pagado + a.tot_cobranza >0

;
CREATE  view  v_ctacte_apo as
SELECT 
c.institucionID, 
c.titularid,
c.factura_anio,
c.factura_mes, 
c.valor_cuota, 
c.aporte,
c.saldo, 
c.facturado_por,
	(select cast (h.periodo_anio as   varchar(4)) || '/' || cast(h.periodo_mes as  varchar(2))  from afiliados.aportes_de_afiliados    h
	where  h.institucionID = c.institucionID
	and    h.titularid = c.titularid
	and    h.factura_anio*100 + h.factura_mes < c.factura_anio*100 + c.factura_mes
	order by h.periodo_anio*100 + h.periodo_mes desc limit 1) as ultPeridoAporte,

	(select h.saldo from  afiliados.ctacte_apo  h
	where  h.institucionID = c.institucionID
	and    h.titularid = c.titularid
	and    h.factura_anio*100 + h.factura_mes < c.factura_anio*100 + c.factura_mes
	order by h.factura_anio*100 + h.factura_mes desc limit 1) as saldo_anterior

FROM afiliados.ctacte_apo c;














CREATE  view v_descuentosAfil as
SELECT 
institucionid,
titularID, 
empresaID,
apellido, 
nombre, 
planID,
fecha_alta,
derivacionID ,
descuento, 
valor_cuota,
(select  aporte from 
 afiliados.aportes_de_afiliados a
where a.titularid=titulares.titularid   
and   a.institucionid=titulares.institucionid
order by a.fultman desc limit 1) as ult_aporte
FROM afiliados.titulares
where fecha_baja is null 
and descuento>0;
















CREATE    view  v_detalle_consumo_por_afil  as
select
t.institucionid,
d.titularid,
t.planid,
t.apellido || ' ' || t.nombre as apenom,
d.codfamid,
f.prestadorid,
extract(year from d.fecha_prestacion)*100 + extract(month from d.fecha_prestacion) as periodo,
d.codigonomenclador,
n.descripcion as desc_practica,
p.nombre as nom_prestador,
d.importe_facturado,
d.importe_pagado,
d.fecha_prestacion as fPresta,
f.nro_liquidacion

from contable.detalle_de_facturas_de_prestadores d,contable.facturas_de_prestadores f, 
      afiliados.titulares t, auditoria.nomenclador_nacional n, autorizaciones.prestadores p
where d.institucionid= f.institucionid
and   d.institucionid= t.institucionid
and   d.institucionid= n.institucionid
and   d.institucionid= p.institucionid
and   d.nro_liquidacion= f.nro_liquidacion
and   d.codigonomenclador = n.codigonn
and   p.prestadorid = f.prestadorid 
and   d.titularid = t.titularid;















CREATE view v_totalConsumoPorAnioTipoPrestador as
select p.institucionid, d.tipo_prestacion, extract (year  from fecha_prestacion) as anio_prestacion,
 p.prestadorid,p.nombre,p.tipo, sum(d.importe_pagado) as pagado 
 from contable.detalle_de_facturas_de_prestadores d, contable.facturas_de_prestadores f,        autorizaciones.prestadores p
where d.institucionid= 1
and   d.institucionid= f.institucionid
and   d.institucionid= p.institucionid
and   d.nro_liquidacion= f.nro_liquidacion
and   p.prestadorid = f.prestadorid 
--and  year (d.fecha_prestacion) between  year(getdate())-4 and year(getdate())

group by p.institucionid,d.tipo_prestacion, extract (year  from fecha_prestacion),
 p.prestadorid, p.nombre,p.tipo;





CREATE OR REPLACE FUNCTION isnumeric(text) RETURNS BOOLEAN AS $$
DECLARE x NUMERIC;
BEGIN
    x = $1::NUMERIC;
    RETURN TRUE;
EXCEPTION WHEN others THEN
    RETURN FALSE;
END;
$$
STRICT
LANGUAGE plpgsql IMMUTABLE;









CREATE FUNCTION ValorNNpractica (
inst SMALLINT, 
codigo varchar(10), 
subcodigo SMALLINT)

RETURNS NUMERIC(6,2) 
AS
$body$
DECLARE Total numeric(6,2);

BEGIN
          IF ISNUMERIC(Codigo)=0 THEN
           Total = 0;
          ELSE
     
	          SELECT  (n.especialista+n.ayudante*n.nCantAyu+n.anestesista)*a.nGaleno + n.gastos*a.nGasto  into Total
	          FROM   auditoria.arancelPractica a, auditoria.nomenclador_nacional n
	          where a.institucionid= inst
		    AND a.institucionid= n.institucionid
		    AND n.CodigoNN = Codigo
	            AND n.subcodigo= subcodigo
	            and n.codigonn >=  a.nDesdeNN and n.codigonn <=  a.nHastaNN;
	          
	END IF;
	
	RETURN Total;
END;

$body$
language plpgsql volatile  
cost 100;


















-- select dbo.fnGetClasePorEdad(1,2,'770CXE') 

-- drop function fnGetClasePorEdad


CREATE OR REPLACE FUNCTION public.fngetclaseporedad(
	inst integer,
	edad integer,
	plan character varying,
	empresa integer)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

declare 

 precio  integer;
 clase   integer;
 return  integer;
 dEdad  varchar(5);
 hEdad  varchar(5);
 descr   varchar(50);
 i      integer;
 len_str integer;

declare Cur Cursor for
select  c.descripcion, c.claseID
 from afiliados.clases c, afiliados.precio_de_planes_para_empresas p
 where c.claseID= p.claseID
 and  p.planID = plan
 and  strpos(descripcion, 'AÑO')>0 
 and  p.institucionID = inst
 and  p.institucionID = c.institucionID
 and  c.cvigente='S'
 and  p.empresaid=empresa;

begin
 i=0;
 descr='';
 dEdad=0;
 return=0;
 dEdad='';
 hEdad='';
len_str=0;

 open Cur;
	

      
LOOP

	FETCH Cur  INTO descr,  clase ;
	EXIT WHEN NOT FOUND ;

 

	len_str = length(descr);
	
	 WHILE i <= len_str 	 LOOP
            
	 	IF (substring(descr,i,1) ~ '^[0-9\.]+$') = true THEN
			  if i > 7 then
			    hEdad=hEdad || substring(descr,i,1) ;
			  else
			    dEdad=dEdad || substring(descr,i,1) ;
			 end if ;
		end if ;
		i=i+1;
	 END LOOP;

         -- Me fijo el rango y tomo precio
    
         IF edad >= cast(dEdad  as INTEGER) and edad <= cast(hEdad as  INTEGER) then
              return = clase;
         end if;

     
	 i=0;
	 dEdad='';
	 hEdad='';
            

END LOOP;

return return;

END;

$BODY$;

ALTER FUNCTION public.fngetclaseporedad(integer, integer, character varying, integer)
    OWNER TO postgres;


-- select dbo.fnGetEdadDesdeDeClase(1,'DE 65 A 120 AÑOS')
-- drop  function fnGetEdadDesdeDeClase 


CREATE  function fnGetEdadDesdeDeClase (
inst integer,
clase varchar(50))
returns  integer as 

$body$


declare ret integer;
-- recibe la string con la descripcion de la tabla clase, ejemplo "DE 18 A 24 AÑOS"
-- y devuelve 24

begin

select     substring (descripcion,3,3) into ret
  from clases
where institucionid=inst and descripcion = clase and charindex(' A ',descripcion)>0;


return ret;

END;

$body$
language plpgsql volatile  
cost 100;




-- select dbo.fnGetEdadHastaDeClase(1,'DE 1 A 6 AÑOS') 

-- select dbo.fnGetPrecioPorEdad(180, '770CXE',1,1, 63,'clase') 



CREATE  function fnGetPrecioPorEdad (
emp  integer, plan  varchar(8), cfam  integer,  inst  integer, edad  varchar(2),tipo varchar(6))
returns  integer as 

$body$

declare 
 precio  integer;
 clase   integer;
 ret	 integer;
 dEdad  varchar(5);
 hEdad  varchar(5);
 descr   varchar(50);
 i      integer;

 Cur Cursor for
SELECT  c.descripcion, e.precio, c.claseID
FROM precio_de_planes_para_empresas.empresase, afiliados.clases c
where e.institucionid=inst
and e.institucionid=c.institucionid
and e.planid =plan
and e.empresaid =emp
--and patindex('%HIJO%',c.descripcion)=0
and e.claseId = c.claseId;

begin

 i=0;
 descr='';
 dEdad=0;
 ret=0;
 dEdad='' ;
 hEdad='';

 
OPEN Cur;

LOOP

	FETCH  Cur INTO descr, precio, clase ;
	EXIT WHEN NOT FOUND ;

 	
		  -- esta mal cargado en PRIVAMED, lo arreglo
		 IF descr='DE O A 11 MESES' THEN
		    descr='DE 0 A 1 AÑO';
                 END IF;


		 WHILE i <=  length(trim(descr))
		 LOOP
		 
		    
			IF IsNumeric(substring(descr,i,1))>0 THEN
			
				  if i > 7 THEN
				     hEdad=hEdad + substring(descr,i,1);
				  else
				     dEdad=dEdad + substring(descr,i,1);
				 end if;  
                        END IF;
			 i=i+1;
			
		 END LOOP;

		 -- Me fijo el rango y tomo precio
	    
		 IF edad >= cast(dEdad  as VARCHAR) and edad <= cast(hEdad as VARCHAR) THEN

			if position('INDIVIDUAL' in descr) > 0 and cfam=0 THEN
			    if upper(tipo)='PRECIO' then
				ret = precio;
			    else
				ret = clase;
			    end if;
			end if;	
			if  position('INDIVIDUAL' in descr) =0 and cfam>0 and dEdad=1 and hEdad=6 THEN
			    if upper(tipo)='PRECIO' then
				ret = precio;
			    else
				ret = clase;
			    end if;	
			 end if;
			if  position('INDIVIDUAL' in descr)=0 and not(dEdad=1 and hEdad=6) THEN
			    if upper(tipo)='PRECIO' then
				ret = precio;
			    else
				ret =  clase;
			    end if;	
			end if;    
			
		 end if;

	     
		 i=0;
		 dEdad='';
		 hEdad='';
            
         END LOOP;


return ret;

END;

$body$
language plpgsql volatile  
cost 100;








CREATE OR REPLACE FUNCTION public.getdomiciliodiscriminado(
	domi character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
declare
 vReturn  varchar(37);
 vCalle varchar(20);
 vPuerta varchar(15);
 vPiso  varchar(4);
 vDepto  varchar(4);

DECLARE textpos  int;
	posCalle int;
	posPuerta int;
	posPiso int;
        resto    varchar(4000);
        tmpstr   varchar(4000);
        leftover varchar(4000);
        leave boolean;

begin

    textpos = 1;
    leftover = '';
    posCalle = 0;
    leave = false;

   -- primera validacion si domi supera 37 bytes parceo y byebye
   if LENGTH(rtrim(domi)) > 34 then
   	 vCalle =SUBSTRING(domi,1,20);
	 vPuerta =SUBSTRING(domi,21,5);
	 vPiso =SUBSTRING(domi,26,4);
	 vDepto =SUBSTRING(domi,30,4);
         leave = true;
   END IF;
  
   -- busco marca de calle

   IF leave = false THEN
   
	   WHILE textpos <= LENGTH(domi)
	   LOOP
	      IF textpos > 5 AND ISNUMERIC(SUBSTRING(domi,textpos,1)) AND posCalle = 0 THEN
	        posCalle =  textpos-1;
	      END IF;
	      textpos=textpos+1;
	   END LOOP;
	   
	   IF posCalle = 0 THEN
	      posCalle=textpos-1;
	   END IF;
	   	
	   -- seteo variable calle  
	   vCalle = LEFT (domi,posCalle) ;

	   if posCalle = LENGTH(domi) THEN
		leave = true;
	   END IF;	 

       IF 	leave = false THEN
		   -- seteo variable resto y busco numero
		    resto = RIGHT(domi,LENGTH(domi)-posCalle);
		    textpos=1;
		    posPuerta = 0;
		   -- Armo numero_de puerta
		   WHILE textpos <= LENGTH(resto)
		   LOOP
		     IF (SUBSTRING(resto,textpos,1) =' ') AND posPuerta=0 THEN
		           posPuerta =  textpos-1;
		             
		      END IF;
		      textpos=textpos+1;
		   END LOOP;
		     
		   -- seteo variable puerta  
		   IF posPuerta = 0  THEN
                        posPuerta=textpos-1 ;
                         
           END IF;
                           
		   vPuerta = LEFT (resto,posPuerta) ;

		   if posPuerta = LENGTH(resto) THEN
			 leave = true;
		   end if;
		   	 
	   END IF;

	   IF 	leave = false THEN	 
		   -- seteo variable resto y busco piso
		    resto = RIGHT(resto,LENGTH(resto)-(posPuerta+1));
		    textpos=1;
		   -- Armo piso
		    posPiso =0;
		   WHILE textpos <= LENGTH(resto)
		   LOOP
		      IF textpos>1 AND (SUBSTRING(resto,textpos,1) =' ' ) AND posPiso = 0 THEN
		        posPiso =  textpos-1;
		      END IF;
		       textpos=textpos+1;
		   END LOOP;
		   
		   IF posPiso = 0 THEN
		      posPiso=textpos-1;
		    end if;	  
		   -- seteo variable piso  
		    vPiso = LEFT (resto,posPiso) ;
       
		   if posPiso = LENGTH(resto) then
			 leave = true;
		   end if;	 
      END IF ;

      IF leave = false THEN
		   -- armo  depto
		    vDepto = RIGHT(resto,length(resto)-posPiso);
		    textpos=1;
            END IF;		   

      
  END IF;
  /*
 vReturn = left(coalesce(rtrim(vCalle),''),20) || space(20 - LENGTH(coalesce(rtrim(vCalle),''))) || '|' ||
	       left(coalesce(rtrim(vPuerta),''),5) || space(5 - LENGTH(coalesce(rtrim(vPuerta),''))) || '|' ||
	       left(coalesce(rtrim(vPiso),''),4) || space(4 - LENGTH(coalesce(rtrim(vPiso),''))) || '|' ||
	       left(coalesce(rtrim(vDepto),''),4) || space(4 - LENGTH(coalesce(rtrim(vDepto),'')))  || '|' ;

  */
 vReturn = left(coalesce(rtrim(vCalle),''),20) ||  '|' ||  left(coalesce(rtrim(vPuerta),''),5) || '|' ||  left(coalesce(rtrim(vPiso),''),4) || '|' ||  left(coalesce(rtrim(vDepto),''),4) || '|' ;	       
 return vReturn;

end
$BODY$;

ALTER FUNCTION public.getdomiciliodiscriminado(character varying)
    OWNER TO postgres;








create  function getPerteneceOSocial (
titu integer, cfam integer,  inst  integer, fecha  timestamp, OSocial varchar(3))
returns  varchar(1) as

$body$

declare ret  varchar(1);

begin

if  exists(
select 1 from afiliados.historico_os 
where titularID = titu  
  and codfamid = cfam
  and institucionID= inst
  and derivacionID= OSocial  
  and fdesde <= fecha and coalesce(fhasta,'31/12/2090') >=fecha) then
	ret ='T';
else
	 ret ='F';
end if; 

 return ret;
end
$body$
language plpgsql volatile  
cost 100;
















CREATE FUNCTION sp_ConviertoCodigosIVR (
Practica  VARCHAR(10)  )
returns VARCHAR(10)   as 

$body$
declare 
PracticaRet   VARCHAR(10) ; 
BEGIN
        -- hardcode hermoso como me gusta a mi

	IF   Practica = '1000' THEN
		PracticaRet = 'PSA';       
	ELSIF   Practica = '1005' THEN
		PracticaRet = 'SUBUNIB'  ; 
	ELSIF   Practica = '1006' THEN
		PracticaRet = 'SUBUNIBC' ; 
	ELSIF   Practica = '1035' THEN
		PracticaRet = 'HDLCOL' ;   
	ELSIF   Practica = '1040' THEN
		PracticaRet = 'LDLCOL';    
	ELSIF   Practica = '1045' THEN
		PracticaRet = 'CPKMB' ;    
	ELSIF   Practica = '1070' THEN
		PracticaRet = 'HEMOGLI' ;  
	ELSIF   Practica = '1155' THEN
		PracticaRet = 'TESTRA';    
	ELSIF   Practica = '1185' THEN
		PracticaRet = 'TESTOBIO' ; 
	ELSIF   Practica = '180202' THEN
		PracticaRet = 'DOPPLERVA' ;
	ELSIF   Practica = '180301' THEN
		PracticaRet = 'DOPPLERC' ; 
	ELSIF   Practica = '180501' THEN
		PracticaRet = 'DOPPLERFE' ;
	ELSIF   Practica = '180602' THEN
		PracticaRet = 'ECOCADERAI';
	ELSIF   Practica = '300119' THEN
		PracticaRet = 'OBI'     ;  
	ELSIF   Practica = '300204' THEN
		PracticaRet = 'TOPO'  ;    
	ELSIF   Practica = '310109' THEN
		PracticaRet = 'TIMPANO' ;
        ELSE  
	        PracticaRet = Practica;
	END IF;        

        RETURN PracticaRet;
END
$body$
language plpgsql volatile  
cost 100;



 CREATE  INDEX idx_nombre ON afiliados.afiliados(apellido, nombre);


ALTER TABLE afiliados.afiliados ADD CONSTRAINT PK_afiliados PRIMARY KEY   
	(
		titularID,
		codfamID,
		institucionID
	) ;

ALTER TABLE afiliados.agentes_de_cobro ADD CONSTRAINT cobradorID_pkey PRIMARY KEY   
	(
		institucionID ,
		cobradorID
	)  ;



 CREATE  INDEX  IX_aportes_de_afiliados ON  afiliados.aportes_de_afiliados (titularID , institucionID ) ;
ALTER TABLE auditoria.arancelPractica ADD CONSTRAINT arancelPractica_pk PRIMARY KEY   
	(
		institucionid ,
		nDesdeNN ,
		nHastaNN
	) ;

ALTER TABLE autorizaciones.auditoriaAutorizacionWeb ADD CONSTRAINT auditoriaAutorizacionWeb_pk PRIMARY KEY   
	(
		institucionID ,
		autorizacionID
	) ;

ALTER TABLE autorizaciones.auditoriaAutorizacionWeb ADD CONSTRAINT auditoriaAutorizacionWeb_fk FOREIGN KEY 
	(
		institucionID ,
		nuserID
	) REFERENCES institucion.usuariosPrestadores (
		institucionID ,
		nuserID
	);


CREATE  INDEX idx_autorizacionID ON autorizaciones.autorizaciones (institucionid , autorizacionID ) ;


 	 
 CREATE  INDEX idx_fecha_practica ON autorizaciones.autorizaciones (fecha_practica ) ;
 
 CREATE  INDEX idx_autorizaciones_nro_interna ON autorizaciones.autorizaciones (institucionid , numero_internacion ) ;
 
 		 ALTER TABLE autorizaciones.autorizaciones ADD CONSTRAINT autorizaciones_pkey PRIMARY KEY   
	(
		institucionid ,
		autorizacionID
	) ;


/*

    
CREATE TRIGGER tri_autorizaciones.autorizaciones after delete
ON autorizaciones.autorizaciones 
FOR delete AS
ROWCOUNT 1
      INSERT INTO audit_registros_borrados
	(tabla ,
         institucionID ,
	 refe_clave ,
	 observa ,
         fultman )
         SELECT 'autorizaciones.autorizaciones', 
	    del.institucionID,  
	    del.autorizacionID,  
            substring('titular:' + cast(del.titularIDCHAR(11)) +  ' f/Gene:' + cast(del.fultmanCHAR(10))  + ' lugar:' + del.lugar de intervencion ,1,100) ,
           substring(cast(cast(getdate() as smalldatetime)  varchar),1,11)
         FROM  deleted del;

CREATE  TRIGGER autorizaciones.auditoriaAutorizacionWeb_DELETE
       ON autorizaciones.autorizaciones
AFTER DELETE
AS
BEGIN
       BEGIN TRAN;  
 
       DECLARE @institucionID tinyint,@autorizacionID int
      
       SELECT @institucionID = DELETED.institucionID, @autorizacionID = DELETED.autorizacionID        
       FROM DELETED;
 
       /* roles generales para todos */ 
       UPDATE autorizaciones.auditoriaAutorizacionWeb feliminacion =getdate() WHERE  @institucionID = @institucionID AND autorizacionID = @autorizacionID;
      
       COMMIT TRAN; 

END;*/

ALTER TABLE estadisticas.cabeceraAdemp ADD CONSTRAINT cabeceraAdemp_PK PRIMARY KEY   
	(
		ncodigo
	);         

    /*     	
CREATE  TRIGGER tri_autorizaciones.convenios 
ON autorizaciones.convenios 
FOR update,delete AS
ROWCOUNT 1
      INSERT INTO audit_registros_borrados
	(tabla ,
         institucionID ,
	 refe_clave ,
	 observa ,
         fultman )
         SELECT 'autorizaciones.convenios', 
	    del.institucionID,  
	    right( '00000' + cast( prestadorid  varchar(5)), 5 ) || ' ' || del.desde_practica  as refe_clave,  
            substring('autorizaciones.convenios/Prest:' + 
            cast(del.prestadorIDCHAR(6)) +  
            ' fecha.:' + coalesce(cast(del.fechaCHAR(11)),'')  + 
            ' practica:' +  cast(desde_practicaCHAR(11))  +
            ' IVR anterior:' +  cast(del.cIVRCHAR(1)),1,100) ,
           substring(cast(cast(getdate() as smalldatetime)  varchar),1,11)
         FROM  deleted del;


create  TRIGGER trgautorizaciones.conveniosPlanes
    ON  dbo.autorizaciones.convenios       
    AFTER INSERT
AS       
    BEGIN         
    ROWCOUNT 0;
    NOCOUNT ON;

    IF EXISTS
    (
        SELECT 1
        FROM Inserted i, autorizaciones.prestadores p
                WHERE i.institucionid= p.institucionid
                  AND i.prestadorid= p.prestadorid
    AND UPPER(i.planes)='TODOS'
                          AND p.atiende_solo_planes_altos =1
            
    )
    BEGIN
        RAISERROR ('Este prestador solo atiende afiliados.planes ALTOS', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
    END:     
*/

   CREATE  INDEX convenios2_idx ON autorizaciones.convenios (prestadorid , institucionid , desde_practica , hasta_practica , 
   planes , tipo , tipo_valor , fecha ) ;

   ALTER TABLE afiliados.titulares ADD CONSTRAINT PK_titulares PRIMARY KEY    
	(
		titularID ,
		institucionID
	)   
;

   ALTER TABLE afiliados.ctacte_apo ADD CONSTRAINT ctacte_apo_fkey FOREIGN KEY 
	(
		titularid ,
		institucionID
	) REFERENCES afiliados.titulares (
		titularID ,
		institucionID
	);

	ALTER TABLE autorizaciones.datos_de_prestadores ADD  PRIMARY KEY   
	(
		institucionid ,
		prestadorid ,
		domicilio ,
		telefono ,
		area ,
		especialidad ,
		otros_datos
	) ;

ALTER TABLE autorizaciones.prestadores ADD CONSTRAINT PK_autorizaciones PRIMARY KEY    
	(
		prestadorid ,
		institucionid
	)   
;	
	ALTER TABLE autorizaciones.datos_de_prestadores ADD  FOREIGN KEY 
	(
		prestadorid ,
		institucionid
	) REFERENCES autorizaciones.prestadores (
		prestadorid ,
		institucionid
	)

;
ALTER TABLE afiliados.derivacion ADD CONSTRAINT aportes_pkey PRIMARY KEY   
	(
		institucionID ,
		derivacionID
	)
	;
 CREATE  INDEX idx_det_autorizacionID ON autorizaciones.detalle_de_autorizaciones (institucionID , autorizacionID ) 
;	


ALTER TABLE autorizaciones.detalle_de_autorizaciones ADD CONSTRAINT autorizaciones_fkey FOREIGN KEY 
	(
		institucionID ,
		autorizacionID
	) REFERENCES autorizaciones.autorizaciones (
		institucionid ,
		autorizacionID
	) ;
 CREATE  INDEX detalle_de_facturas_de_prestadores_imppagado ON contable.detalle_de_facturas (importe_pagado ) 
;
 CREATE  INDEX detalle_de_facturas_de_prestadores_2 ON contable.detalle_de_facturas (institucionid , titularid , fecha_prestacion ) 
;
 CREATE  INDEX detalle_de_facturas_de_prestadores_3 ON contable.detalle_de_facturas (nro_liquidacion , institucionid , titularid , codfamid , importe_facturado , importe_pagado ) 
;


/*
CREATE TRIGGER tri_auditoria 
ON contable.detalle_de_facturas_de_prestadores 
FOR delete AS
ROWCOUNT 1
      INSERT INTO audit_registros_borrados
	(tabla ,
         institucionID ,
	 refe_clave ,
	 observa ,
         fultman )
         SELECT 'contable.detalle_de_facturas_de_prestadores', 
	    del.institucionID,  
	    del.codigo,  
            substring('Liq:' + cast(nro_liquidacion  varchar) + ' titular:' + cast(del.titularIDCHAR(11)) +  ' f/Gene:' + cast(del.fultmanCHAR(11))  + 'Practica:' + del.codigo nomenclador ,1,100) ,
           substring(cast(cast(getdate() as smalldatetime)  varchar),1,11)
         FROM  deleted del
;
	*/


ALTER TABLE afiliados.empresas ADD  PRIMARY KEY   
	(
		institucionID ,
		empresaID
	)   
;
ALTER TABLE estadisticas.especial_sssalud ADD CONSTRAINT especial_sssalud_pk PRIMARY KEY   
	(
		id
	)   
;
 CREATE  INDEX idx_factura ON contable.facturas (institucionID , centro_emisor , letra , numero , tipo_documento ) 
;

ALTER TABLE contable.facturas ADD CONSTRAINT facturas_pk PRIMARY KEY   
	(
		institucionID ,
		centro_emisor ,
		letra ,
		numero ,
		tipo_documento
	)   
;

 CREATE  INDEX IX_contable ON contable.facturas_de_prestadores (nro_liquidacion , institucionid , prestadorid , letra_factura , centro_emisor , nro_factura ) 
;

 CREATE  INDEX facturas_de_prestadores1 ON contable.facturas_de_prestadores (nro_liquidacion , institucionid , mes_gasto , anio_gasto ) 
;

ALTER TABLE contable.facturas_de_prestadores ADD CONSTRAINT PK_facturas_de_prestadores PRIMARY KEY    
	(
		nro_liquidacion ,
		institucionid ,
		prestadorid ,
		letra_factura ,
		centro_emisor ,
		nro_factura
	)   
;



create table afiliados.provincias(
institucionid integer not null,
provinciaID varchar(20) not null,
	constraint provincias_pk primary key (institucionid, provinciaID ),
	constraint institucion_fkey foreign key (institucionid) references 
	institucion.institucion (institucionid)
);



insert into afiliados.provincias values (1,'BUENOS AIRES');
insert into afiliados.provincias values (1,'CATAMARCA');
insert into afiliados.provincias values (1,'CHACO');
insert into afiliados.provincias values (1,'CHUBUT');
insert into afiliados.provincias values (1,'CORDOBA');
insert into afiliados.provincias values (1,'CORRIENTES');
insert into afiliados.provincias values (1,'ENTRE RIOS');
insert into afiliados.provincias values (1,'FORMOSA');
insert into afiliados.provincias values (1,'JUJUY');
insert into afiliados.provincias values (1,'LA PAMPA');
insert into afiliados.provincias values (1,'LA RIOJA');
insert into afiliados.provincias values (1,'MENDOZA');
insert into afiliados.provincias values (1,'MISIONES');
insert into afiliados.provincias values (1,'NEUQUEN');
insert into afiliados.provincias values (1,'RIO NEGRO');
insert into afiliados.provincias values (1,'SALTA');
insert into afiliados.provincias values (1,'SAN JUAN');
insert into afiliados.provincias values (1,'SAN LUIS');
insert into afiliados.provincias values (1,'SANTA CRUZ');
insert into afiliados.provincias values (1,'SANTA FE');
insert into afiliados.provincias values (1,'SANTIAGO DEL ESTERO');
insert into afiliados.provincias values (1,'TIERRA DEL FUEGO');
insert into afiliados.provincias values (1,'TUCUMAN');



create table institucion.tipoIva(
institucionid integer not null,
tipoIvaID varchar(30) not null,
	constraint tipoIva_pk primary key (institucionid, tipoIvaID ),
	constraint institucion_fkey foreign key (institucionid) references 	institucion.institucion (institucionid)
);
   



insert into institucion.tipoIva values (1,'CONSUMIDOR FINAL');
insert into institucion.tipoIva values (1,'RESPONSABLE INSCRIPTO');
insert into institucion.tipoIva values (1,'RESPONSABLE NO INSCRIPTO');
insert into institucion.tipoIva values (1,'EXENTO');
insert into institucion.tipoIva values (1,'MONOTRIBUTISTA');




/*

CREATE TRIGGER tri_facturas_autorizaciones.prestadores 
ON contable.facturas_de_prestadores 
FOR delete AS
ROWCOUNT 1
      INSERT INTO audit_registros_borrados
	(tabla ,
         institucionID ,
	 refe_clave ,
	 observa ,
         fultman )
         SELECT 'contable.facturas_de_prestadores', 
	    del.institucionID,  
	    del.nro_liquidacion ,  
            substring('Prest:' + cast(del.prestadorIDCHAR(5)) +  ' f/Cont.:' + coalesce(cast(del.fecha contableCHAR(11)),'')  + ' factura:' + del.letra_factura + '-' + cast(nro_facturaCHAR(9)),1,100) ,
           substring(cast(cast(getdate() as smalldatetime)  varchar),1,11)
         FROM  deleted del


;

ALTER TABLE hist_mov_deb ADD CONSTRAINT hist_mov_deb_pk PRIMARY KEY   
	(
		institucionID ,
		empresa ,
		fpresentacion ,
		numero ,
		factura
	)   
;*/
ALTER TABLE contable.ImprentaFactNumeracion ADD CONSTRAINT ImprentaFactNumeracion_pk PRIMARY KEY   
	(
		institucionid ,
		cTMovi ,
		cletra ,
		nCentroEmisor ,
		nDesdeN
	)   
;

ALTER TABLE estadisticas.InfoIISSCABECERA ADD  PRIMARY KEY   
	(
		codigo ,
		subcodigo
	)   
;

ALTER TABLE estadisticas.InfoIISSDETALLE ADD  PRIMARY KEY   
	(
		institucionID ,
		nsecuencia ,
		codigo ,
		subcodigo ,
		periodo ,
		titularID
	)   
;

ALTER TABLE institucion.institucion ADD CONSTRAINT institucion_pkey PRIMARY KEY   
	(
		institucionID
	)   
;

ALTER TABLE estadisticas.local_sssalud ADD CONSTRAINT local_sssalud_pk PRIMARY KEY   
	(
		id
	)   
;

ALTER TABLE auditoria.nomenclador_nacional ADD CONSTRAINT nomenclador_nacional_pk PRIMARY KEY   
	(
		institucionid ,
		codigonn ,
		subcodigo
	)   
;

ALTER TABLE contable.orden_de_pago ADD CONSTRAINT PK_orden_pago PRIMARY KEY   
	(
		nro_orden_pago ,
		institucionid
	)   
;

/*
CREATE TRIGGER tri_contable.orden_de_pago 
ON contable.orden_de_pago
FOR delete AS
ROWCOUNT 1
      INSERT INTO audit_registros_borrados
	(tabla ,
         institucionID ,
	 refe_clave ,
	 observa ,
         fultman )
         SELECT 'contable.orden_de_pago', 
	    del.institucionID,  
	    del.nro_orden_pago ,  
            substring('Proveedor:' + cast(del.proveedorIDCHAR(11)) +  ' f/Emision:' + cast(del.fecha emisionCHAR(11))  + ' valor:' + cast(del.importe totalCHAR(10)) ,1,100) ,
           substring(cast(cast(getdate() as smalldatetime)  varchar),1,11)
         FROM  deleted del


;*/


ALTER TABLE afiliados.planes ADD CONSTRAINT plan_pk PRIMARY KEY   
	(
		planID ,
		institucionID
	)   
;


ALTER TABLE afiliados.precio_de_planes_para_empresas ADD CONSTRAINT precio_plan_pk PRIMARY KEY   
	(
		planID ,
		institucionID ,
		empresaid ,
		claseID ,
		precio
	)   
;




ALTER TABLE afiliados.promotores ADD CONSTRAINT promotorID_pkey PRIMARY KEY   
	(
		institucionID ,
		promotorID
	)   
;

ALTER TABLE contable.proveedores ADD CONSTRAINT PK_proveedores PRIMARY KEY    
	(
		proveedorid ,
		institucionid
	)   
;



ALTER TABLE institucion.sucursales ADD CONSTRAINT sucursales_pk PRIMARY KEY   
	(
		institucionid ,
		sucursal
	)   
;




ALTER TABLE institucion.usuarios ADD CONSTRAINT usuarios_pk PRIMARY KEY   
	(
		institucionid ,
		usuario
	)   
;
ALTER TABLE permisos_a_programas ADD CONSTRAINT permisos_fk FOREIGN KEY 
	(
		institucionid ,
		usuario
	) REFERENCES institucion.usuarios (
		institucionid ,
		usuario
	)
;

ALTER TABLE institucion.usuarios ADD CONSTRAINT usuarios_fk FOREIGN KEY 
	(
		institucionid ,
		sucursal
	) REFERENCES institucion.sucursales(
		institucionid ,
		sucursal
	)
;


ALTER TABLE institucion.usuariosafiliados ADD CONSTRAINT usuariosafiliados_pk PRIMARY KEY   
	(
		institucionID ,
		nuserID
	)   
;




ALTER TABLE institucion.usuariosafiliados ADD CONSTRAINT usuariosafiliados_fk FOREIGN KEY 
	(
		cusuario ,
		institucionID
	) REFERENCES afiliados.titulares (
		titularID ,
		institucionID
	)
;

ALTER TABLE institucion.afiliadosRoles ADD CONSTRAINT afiliadosRoles_pk PRIMARY KEY   
	(
		institucionID ,
		nuserID ,
		rolID ,
		rolName
	)   
;

ALTER TABLE institucion.afiliadosRoles ADD CONSTRAINT afiliadosRoles_fk FOREIGN KEY 
	(
		institucionID ,
		nuserID
	) REFERENCES institucion.usuariosafiliados (
		institucionID ,
		nuserID
	) ON DELETE CASCADE 
;



 CREATE  UNIQUE  INDEX usuariosPrestadores_idx ON institucion.usuariosPrestadores (institucionID , nprestadorID , cusuario ) 
;




 CREATE  INDEX idx_nombre_tit ON afiliados.titulares (apellido , nombre ) 
;

 CREATE  INDEX titulares_ccodigoIngresoWeb_idx ON afiliados.titulares (institucionID , ccodigoIngresoWeb ) 
;


ALTER TABLE afiliados.titulares ADD CONSTRAINT institucionid_fkey FOREIGN KEY 
	(
		institucionID 
	) REFERENCES institucion.institucion (
		institucionID
	)
;

ALTER TABLE afiliados.titulares ADD CONSTRAINT derivacion_fkey FOREIGN KEY 
	(
		institucionID ,
		derivacionid
	) REFERENCES afiliados.derivacion (
		institucionID,
		derivacionid
	)
;
ALTER TABLE afiliados.titulares ADD CONSTRAINT plan_fkey FOREIGN KEY 
	(
		institucionID ,
		planid
	) REFERENCES afiliados.planes (
		institucionID,
		planid
	)
;




ALTER TABLE afiliados.titulares ADD CONSTRAINT empresas_fkey FOREIGN KEY 
	(
		institucionID ,
		empresaid
	) REFERENCES afiliados.empresas (
		institucionID,
		empresaid
	)
;


ALTER TABLE afiliados.titulares ADD CONSTRAINT localidaes_fkey FOREIGN KEY 
	(
		institucionID ,
		localidad_fact
	) REFERENCES afiliados.localidades (
		institucionID,
		localidadid
	)
;


ALTER TABLE afiliados.titulares ADD CONSTRAINT localidaes_adic_fkey FOREIGN KEY 
	(
		institucionID ,
		localidad_adic
	) REFERENCES afiliados.localidades (
		institucionID,
		localidadid
	)
;

alter table afiliados.titulares drop CONSTRAINT localidaes_fkey ;

alter table afiliados.titulares drop CONSTRAINT localidaes_fact_fkey ;

ALTER TABLE afiliados.titulares ADD CONSTRAINT cobrador_fkey FOREIGN KEY 
	(
		institucionID ,
		cobradorID
	) REFERENCES afiliados.agentes_de_cobro (
		institucionID ,
		cobradorID
	)
;

ALTER TABLE afiliados.titulares ADD CONSTRAINT promotor_fkey FOREIGN KEY 
	(
		institucionID ,
		promotorID
	) REFERENCES afiliados.promotores (
		institucionID ,
		promotorID
	)
;



ALTER TABLE afiliados.afiliados ADD CONSTRAINT titular_fkey FOREIGN KEY 
	(
		institucionID ,
		titularid
	) REFERENCES afiliados.titulares (
		institucionID ,
		titularid
	)
;
    







CREATE FUNCTION SP_ANALISIS_afiliados(
DESDE_PERIODO int,
HASTA_PERIODO int,
INSTITUCIONID int,
DESREGULADOS int,
 DESDE_CAPITAS int,
 HASTA_CAPITAS int) RETURNS VOID  AS

$body$

begin
-- vacio tabla temporal
delete from tempInformeAnalisisEmpresas;

-- insercion masiva de  datos de empresa y afiliado
IF DESREGULADOS = 1 THEN 

		INSERT INTO  tempInformeAnalisisafiliados.empresas(
		  institucionID,
		  codigoEmpresa,
		  razon_social,
		  deriva,
		  sumCapitasEmp,
		  titularID,
		  fecha_alta,
		  planID,
		  sumCapitasTit ,
		  valor_cuota)
		 select 
		  e.institucionID,
		  e.cuit_empleador,
                  null,
		  null, 
		  e.sumCap,
		  a.titularID, 
		  a.fecha_alta,
		  a.planID,
		  a.sumCapPorTit, 
		  a.ValorCuota
		from
		(-- datos generales de las empresas
		select t.institucionID,t.cuit_empleador ,d.razon_social as deriva,count(*) as sumCap from
		 afiliados.titulares t, afiliados.afiliados a, afiliados.derivacion d
		 where t.institucionID=a.institucionID
		 and   t.titularID=a.titularID
		 and   t.institucionID=d.institucionID
		 and   t.derivacionID=d.derivacionID
		 and   t.cuit_empleador is not null
		 and   year(a.fecha_alta)*100 + month(a.fecha_alta) <=  HASTA_PERIODO
		 and   (a.fecha_baja is null or year(a.fecha_baja)*100 + month(a.fecha_baja) >= HASTA_PERIODO)
		 group  by  t.institucionID, razon_social, t.cuit_empleador,d.razon_social
		) e,
		(-- datos del afiliado
		select t.institucionID,t.cuit_empleador,t.titularID, t.fecha_alta,planID,t.valor_cuota as ValorCuota,
		 count(*) as sumCapPorTit from
		 afiliados.titulares t, afiliados.afiliados a
		 where   t.institucionID=a.institucionID
		 and   t.titularID=a.titularID
		 and   year(a.fecha_alta)*100 + month(a.fecha_alta) <=HASTA_PERIODO
		 and   (a.fecha_baja is null or year(a.fecha_baja)*100 + month(a.fecha_baja) >= HASTA_PERIODO)
		 group  by  t.institucionID,t.cuit_empleador,t.titularID, t.fecha_alta,planID,t.valor_cuota) a
		
		where  a.institucionID= INSTITUCIONID
		and a.institucionID=e.institucionID
		and  a.cuit_empleador=e.cuit_empleador
		
		group by e.institucionID, e.cuit_empleador, e.deriva, e.sumCap,a.titularID, a.fecha_alta,a.planID,a.sumCapPorTit,
		 a.ValorCuota
		
		having e.sumCap between  DESDE_CAPITAS and HASTA_CAPITAS 
		order by e.cuit_empleador;

ELSE

		INSERT INTO  tempInformeAnalisisafiliados.empresas(
		  institucionID,
		  codigoEmpresa,
		  razon_social,
		  deriva,
		  sumCapitasEmp,
		  titularID,
		  fecha_alta,
		  planID,
		  sumCapitasTit ,
		  valor_cuota)
		  select 
		  e.institucionID,
		  e.empresaID,
		  e.razon_social,
		  e.deriva, 
		  e.sumCap,
		  a.titularID, 
		  a.fecha_alta,
		  a.planID,
		  a.sumCapPorTit, 
		  a.ValorCuota
		from
		(-- datos generales de las empresas
		select t.institucionID,e.empresaID,e.razon_social,d.razon_social as deriva,count(*) as sumCap from
		 afiliados.titulares t, afiliados.afiliados a,afiliados.empresase,afiliados.derivacion d
		 where   t.institucionID=e.institucionID
		 and   t.empresaID=e.empresaID
		 and   t.institucionID=a.institucionID
		 and   t.titularID=a.titularID
		 and   t.institucionID=d.institucionID
		 and   e.derivacionID=d.derivacionID
		 and   year(a.fecha_alta)*100 + month(a.fecha_alta) <= HASTA_PERIODO
		 and   (a.fecha_baja is null or year(a.fecha_baja)*100 + month(a.fecha_baja) >= HASTA_PERIODO)
		 group  by  t.institucionID,e.empresaID,e.razon_social,d.razon_social
		) e,
		(-- datos del afiliado
		select t.institucionID,t.empresaID,t.titularID, t.fecha_alta,planID,t.valor_cuota as ValorCuota,
		 count(*) as sumCapPorTit from
		 afiliados.titulares t, afiliados.afiliados a
		 where   t.institucionID=a.institucionID
		 and   t.titularID=a.titularID
		 and   year(a.fecha_alta)*100 + month(a.fecha_alta) <= HASTA_PERIODO
		 and   (a.fecha_baja is null or year(a.fecha_baja)*100 + month(a.fecha_baja) >= HASTA_PERIODO)
		 group  by  t.institucionID,t.empresaID,t.titularID,t.fecha_alta,planID,t.valor_cuota) a
		
		where  a.institucionID= INSTITUCIONID
		and a.institucionID=e.institucionID
		and  a.empresaID=e.empresaID
		
		group by e.institucionID,e.empresaID,e.razon_social,e.deriva, e.sumCap,a.titularID, a.fecha_alta,a.planID,a.sumCapPorTit,
		 a.ValorCuota
		
		having e.sumCap between  DESDE_CAPITAS and HASTA_CAPITAS 
		order by e.razon_social;
end if;
-- cargo gasto medico

update tempInformeAnalisisEmpresas
set sumGastoMedico = 
(select sum(importe_pagado) from contable.detalle_de_facturas_de_prestadores
where institucionID= tempInformeAnalisisEmpresas.institucionID
  and titularID = tempInformeAnalisisEmpresas.titularID
  and year(fecha_prestacion)*100 + month(fecha_prestacion) between DESDE_PERIODO and HASTA_PERIODO );



-- cargo aportes del afiliado


update tempInformeAnalisisEmpresas
set sumAportes = 
(select sum(aporte) from afiliados.aportes_de_afiliados
where institucionID= tempInformeAnalisisEmpresas.institucionID
  and titularID = tempInformeAnalisisEmpresas.titularID
  and factura_anio*100 + factura_mes between DESDE_PERIODO and HASTA_PERIODO );


-- cargo contable.facturas del afiliado


update tempInformeAnalisisEmpresas
set sumFacturacion = 
(select sum(importe) from facturas
where institucionID= tempInformeAnalisisEmpresas.institucionID
  and titularID = tempInformeAnalisisEmpresas.titularID
  and tipo_documento='F'
  and estado<>'A'
  and year(fecha_listado)*100 + month(fecha_listado) between DESDE_PERIODO and HASTA_PERIODO );


-- convierto nulos en ceros

update tempInformeAnalisisEmpresas
set sumGastoMedico = 0 where sumGastoMedico IS  null;

update tempInformeAnalisisEmpresas
set sumAportes = 0 where sumAportes IS null;


update tempInformeAnalisisEmpresas
set sumFacturacion = 0 where sumFacturacion IS null;


-- cargo Empresa Empleador


update tempInformeAnalisisEmpresas
set razon_social = 
(select  razon_social_empleador from titulares
where institucionID= tempInformeAnalisisEmpresas.institucionID
  and titularID = tempInformeAnalisisEmpresas.titularID
);

-- cargo afiliados.derivacion


update tempInformeAnalisisEmpresas
set deriva = 
(select  razon_social from afiliados.derivacion d, afiliados.titulares t
where d.institucionID= 1
  and t.titularID = 10260
  and d.institucionID= t.institucionID
  and d.derivacionID = t.derivacionID
);


end
$body$
language plpgsql volatile  
cost 100;











CREATE FUNCTION dndInformeFacturasPrestadores(
-- proyecto contable.orden_de_pago 
inst  INTEGER,
mes  INTEGER,
anio  INTEGER,
saldo  CHAR(15))

RETURNS VOID as 

$body$
BEGIN

IF saldo='Impagas' THEN

    SELECT distinct p.RazonSocReal, f.*, (f.importe_final - f.total_debitos- f.importepagado)  AS impSaldo, 0 as impPagado,
                   NULL AS fecOP,  NULL AS cheqNum, NULL AS banco
                 
    FROM contable.facturas_de_prestadores f, contable.proveedoresp
    WHERE f.institucionid = inst
    AND       f.institucionid =  p.institucionid
    AND       f.prestadorid =  p.proveedorid
    AND       f.mes_gasto= mes
    AND       f.anio_gasto= anio
    AND       f.nro_liquidacion NOT IN
   (SELECT  o.nro_liquidacion  from contable.renglon_orden_de_pago o
     WHERE o.nro_liquidacion = f.nro_liquidacion 
           AND o.institucionID = f.institucionID)
    ORDER BY f.nro_liquidacion;
  END IF;


IF saldo='Todas' THEN

    SELECT p.RazonSocReal, f.*, (f.importe_final - f.total_debitos- r.importe_total) AS impSaldo, r.importe_total as impPagado,
                  o.fecha_emision AS fecOP,  o.cheque_numero AS cheqNum, o.banco AS banco
     FROM contable.proveedoresp,
         contable.facturas_de_prestadores f LEFT  JOIN contable.renglon_orden_de_pago r
    ON          f.nro_liquidacion = r.nro_liquidacion
    AND	      f.institucionid =  r.institucionid
    AND       r.institucionid= inst
    LEFT  JOIN contable.orden_de_pago o
    ON              r.nro_orden_pago = o.nro_orden_pago 
    AND           r.institucionid =  o.institucionid
    WHERE     f.institucionid=  inst
    AND	         f.prestadorID =  p.proveedorID
    AND	         f.institucionid =  p.institucionid
    AND          f.mes_gasto= mes
    AND          f.anio_gasto= anio
   ORDER BY f.nro_liquidacion;

  END IF;



end
$body$
language plpgsql volatile  
cost 100;












-- Anula autorizaciònes por IVR
-- Fecha creaciòn 28/04/2009
-- Devuelve:  
-- 0 Autorizacion anulada

-- 20	La orden de autorización xxxx es incorrecta. Intentelo nuevamente. 	
-- 21	La orden de autorización xxxx no puede anularse porque fue autorizada por otro prestador.	
-- 22	La práctica no puede anularse porque venció el plazo de 24 hs. Comuníquese con Privamed.	

-- 99 error de base de datos



CREATE FUNCTION sp_AnulacionesPorIVR (vNumeroAutoriza  INTEGER,vPrestador  INTEGER )RETURNS INTEGER
AS
$body$


DECLARE 
vfecGen timestamp;
 vUsuario  varchar(15);
 vPrest  INTEGER ;
 intInstitut integer;
 sigo boolean;
 vCodigoRetorno integer;

 
 BEGIN

 intInstitut = 1;


        -- llamo a la autoriz<acion
         SELECT fecha_generacion, 
	                cusuario,
	                 codigoPreInstituto   
	 		FROM autorizaciones.autorizaciones
	                WHERE institucionID =  intInstitut
	                  AND autorizacionID = vNumeroAutoriza
	                  into vfecGen, vUsuario, vPrest;


         IF vfecGen IS NULL OR vUsuario IS NULL OR vPrest IS NULL THEN
		            vCodigoRetorno = 20 ;-- La orden de autorización xxxx es incorrecta. Intentelo nuevamente. 
         ELSIF vPrest<>vPrestador THEN
		            vCodigoRetorno = 21; --La orden de autorización xxxx no puede anularse porque fue autorizada por otro prestador.	

	 ELSIF vUsuario<>'IVR' THEN
		            vCodigoRetorno = 20; -- La orden de autorización xxxx es incorrecta. Intentelo nuevamente. 

         ELSIF  datediff(hh,vfecGen,getdate())>24  THEN
			   vCodigoRetorno = 22 ;--	La práctica no puede anularse porque venció el plazo de 24 hs. Comuníquese con Privamed.	
         ELSE   

	                           -- borro autorizacion  
	                           DELETE FROM autorizaciones.detalle_de_autorizaciones 	
			           WHERE institucionID =  intInstitut
		                     AND autorizacionID = vNumeroAutoriza;
	
	                           DELETE FROM autorizaciones.autorizaciones 	
			           WHERE institucionID =  intInstitut
		                     AND autorizacionID = vNumeroAutoriza;
	
				 vCodigoRetorno = 0;
          END IF;

	RETURN vCodigoRetorno;




end
$body$
language plpgsql volatile  
cost 100;







CREATE   FUNCTION sp_AumentoMasivoValorCuota(inst  INTEGER,fhasta  timestamp,planid  varchar(10)) returns void as

$body$

BEGIN


update afiliados.titulares   
set valor_cuota=  (select   round(y.valor_plan-(y.valor_plan*t.descuento/100),0)
from afiliados.titulares t,
(select  f.institucionid, f.titularid, s.planid, round(sum(s.precio),0) as valor_plan
 from  afiliados.contrato_para_facturar_afiliados f,
 precio_de_planes_para_empresas s, afiliados.afiliados a 
 where f.institucionID = s.institucionID
 and f.institucionID=a.institucionID
 and f.claseID = s.claseID
 and f.titularID = a.titularID
 and f.codfamID = a.codfamID
 and a.fecha_baja is null
 and s.empresaid = a.empresaid
 group by f.institucionid, f.titularid,s.planid) y
 where  t.fecha_baja is null
  and   t.fecha_alta< fhasta
  and   t.institucionID=inst
  and   t.titularID = y.titularID
  and   t.institucionID = y.institucionID
  and   t.planID = y.planID
  and   t.planid = planid
  and   titulares.titularid = y.titularid 
) 
where titulares.titularid in 
(select   t.titularid
from afiliados.titulares t,
(select  f.institucionid, f.titularid, s.planid, round(sum(s.precio),0) as valor_plan
 from  afiliados.contrato_para_facturar_afiliados f,
 precio_de_planes_para_empresas s, afiliados.afiliados a 
 where f.institucionID = s.institucionID
 and f.institucionID=a.institucionID
 and f.claseID = s.claseID
 and f.titularID = a.titularID
 and f.codfamID = a.codfamID
 and a.fecha_baja is null
 and s.empresaid = a.empresaid
 group by f.institucionid, f.titularid,s.planid) y
 where  t.fecha_baja is null
  and   t.fecha_alta< fhasta
  and   t.institucionID=inst
  and   t.titularID = y.titularID
  and   t.institucionID = y.institucionID
  and   t.planID = y.planID
  and   t.planid = planid
);



end
$body$
language plpgsql volatile  
cost 100;












CREATE  function sp_CambioDePlan (instID int,tituID int, tituNue int, pla varchar(10)) returns void as

 $body$

 begin

update afiliados.titulares set  titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.titulares  set  planid= pla where titularid=tituNue and institucionid=instid;
update afiliados.afiliados  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.aportes_de_afiliados  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update autorizaciones.autorizaciones_de_practicas  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update autorizaciones.autorizaciones_de_internaciones  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.contrato_para_facturar_afiliados  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update contable.detalle_de_facturas_de_prestadores set   titularid= tituNue where titularid=tituID and institucionid=instid;
update contable.facturas set   titularid= tituNue where titularid=tituID and institucionid=instid;
update contable.recibos_de_cobro  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.historico_de_bajas  set  titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.historico_de_afiliados.planes set   titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.registros_de_debito_automatico  set   titularid= tituNue where titularid=tituID and institucionid=instid;
update afiliados.tarjetas_de_creditopago set  titularid= tituNue where titularid=tituID and institucionid=instid;



end
$body$
language plpgsql volatile  
cost 100;














CREATE FUNCTION sp_ControlConsultasAuditadas(prestador  int,inst  int,titularID numeric(9),codFamID integer,periodo int,practica varchar(10)) returns  integer 

AS

$body$
declare
iReturn integer;

begin
select  sum(d.cantidad)  into iReturn
  from contable.facturas_de_prestadores f, contable.detalle_de_facturas_de_prestadores d
where f.institucionID = Inst
  and f.institucionID = d.institucionID
  and f.prestadorID  = prestador
  and f.nro_liquidacion = d.nro_liquidacion
  and d.titularID = titularID
  and d.codFamID = codFamID
  and year(fecha_prestacion) *100 + month(fecha_prestacion)= periodo 
  and d.codigonomenclador = practica;


 return iReturn;


end
$body$
language plpgsql volatile  
cost 100;









CREATE FUNCTION sp_CtaCteProv ( prov  varchar(8),inst  int) returns void
AS
$body$
begin

delete from temporal_de_impresion_ctacte_proveedores;
 
insert into temporal_de_impresion_ctacte_proveedores
select 'FACTURA' as tipo,f.prestadorid,f.institucionid,0,substring( f.detalle,1,35) as descr,f.letra_factura as letra,f.centro_emisor as centro,f.nro_factura as numero,f.fecha_emision as fecha,f.importe_final*-1 as importe,0,0,0 as recibo_prov
from contable.facturas_de_prestadores f where f.prestadorid = prov and f.institucionid=inst
union all
select 'O.DE PAGO' as tipo,x.prestadorid,x.institucionid,f.nro_orden_pago,substring(f.descripcion,1,35) as descr,f.letra as letra, f.centro_emisor as centro, f.numero_factura as numero,p.fecha_emision as fecha,f.importetotal  as impo,0,0, p.recibo_prov as recibo_prov
from contable.renglon_orden_de_pago f, contable.orden_de_pago p, contable.facturas_de_prestadores x where p.tipo_operacion='P' and p.institucionid = f.institucionid and f.nro_orden_pago=p.nro_orden_pago and x.prestadorid =prov and x.institucionid=inst and f.institucionid=x.institucionid and f.nro_liquidacion=x.nro_liquidacion
union all
select 'DEBITO' as tipo,x.prestadorid,x.institucionid,f.nro_documento, substring(f.detalle,1,35) as descr,f.letra_factura as letra, f.centro_emisor as centro,f.nro_factura as numero,f.fecha_emision as fecha,f.importe_final*1  as impo,0,0,0 as recibo_prov
from contable.debitoscreditos f, contable.facturas_de_prestadores x where f.tipo_documento='DEBITO'  and  f.Estado<> 'A' and x.institucionid = f.institucionid and f.nro_factura=x.nro_factura and x.PrestadorID= f.ProveedorID and x.prestadorid =prov and x.institucionid=inst and f.institucionid=x.institucionid 
union all
select 'CREDITO' as tipo,x.prestadorid,x.institucionid,f.nro_documento, substring(f.detalle,1,35) as descr,f.letra_factura as letra, f.centro_emisor as centro,f.nro_factura as numero,f.fecha_emision as fecha,f.importe_final*-1  as impo,0,0,0 as recibo_prov
from contable.debitoscreditos f, contable.facturas_de_prestadores x where f.tipo_documento='CREDITO' and f.Estado<> 'A' and x.institucionid = f.institucionid and f.nro_factura=x.nro_factura and x.PrestadorID= f.ProveedorID and x.prestadorid =prov and x.institucionid=inst and f.institucionid=x.institucionid 
union all
select 'DEBITO' as tipo,x.prestadorid,x.institucionid,f.nro_orden_pago, substring(f.descripcion,1,35) as descr,f.letra as letra, f.centro_emisor as centro,f.numero_factura as numero,p.fecha_emision as fecha,f.importetotal*-1  as impo,0,0, p.recibo_prov as recibo_prov
from contable.renglon_orden_de_pago f, contable.orden_de_pago p, contable.facturas_de_prestadores x where  p.tipo_operacion='D' and p.institucionid = f.institucionid and f.nro_orden_pago=p.nro_orden_pago and x.prestadorid =prov and x.institucionid=inst and f.institucionid=x.institucionid and f.nro_liquidacion=x.nro_liquidacion
union all
select 'CREDITO' as tipo,x.prestadorid,x.institucionid,f.nro_orden_pago,substring(f.descripcion,1,35) as descr,f.letra as letra, f.centro_emisor as centro,f.numero_factura as numero,p.fecha_emision as fecha,f.importetotal  as impo,0,0, p.recibo_prov as recibo_prov
from contable.renglon_orden_de_pago f, contable.orden_de_pago p, contable.facturas_de_prestadores x where p.tipo_operacion='C' and p.institucionid = f.institucionid and f.nro_orden_pago=p.nro_orden_pago and x.prestadorid =prov and x.institucionid=inst  and f.institucionid=x.institucionid and f.nro_liquidacion=x.nro_liquidacion;





end
$body$
language plpgsql volatile  
cost 100;







/*





create     function sp_ExecuteQuery (vQuery    varCHAR(1500)) returns void
AS
BEGIN
IF POSITION('DELETE',UPPER(vQuery))>0 OR CHARINDEX('DROP',UPPER(vQuery))>0
BEGIN
  print 'query invalido';
  GOTO fin
END

EXEC (vQuery)

fin:



end
$body$
language plpgsql volatile  
cost 100;




*/









CREATE FUNCTION sp_FacturasPorCobrador (
cobra_desde varchar(20), cobra_hasta varchar(20),inst int, anio_desde int,  mes_desde int,  anio_hasta int,  mes_hasta int,  estado char
) returns void AS

$body$
begin

select i.razon_social,t.*,f.*  from
afiliados.institucioni, afiliados.titulares t, contable.facturas f
where i.institucionid=inst
  and i.institucionid=t.institucionid
  and i.institucionid=f.institucionid
  and t.titularid=f.titularid
  and t.fecha_baja is null
  and t.cobradorid between cobra_desde and cobra_hasta
  and f.estado=estado
  and (f.anio_periodo*100 + f.mes_periodo) between (anio_desde*100 + mes_desde)  and (anio_hasta*100 + mes_hasta)
order by t.cobradorid;



end
$body$
language plpgsql volatile  
cost 100;














CREATE    function  sp_GeneraEstadisticaConsumo (
vDesde INTEGER ,
vHasta  INTEGER ,
vInstitut   SMALLINT,
vPerAlta  INTEGER ) returns void as


$body$

DECLARE
vfecHasta  varchar(10);

begin

 vfecHasta = '20/'  + substring(cast(vHasta as varchar(6)),5,2) + '/' + substring(cast(vHasta  as varchar(6)),1,4) ;
 
delete from afiliados.consumo_afiliados_total;
 
-- afiliados.afiliados
INSERT INTO afiliados.consumo_afiliados_total
(institucionID, Tipo, titularID, planID, empresaID, derivacionID,
 tot_Consumo_Pagado,tot_Facturado, tot_Capitas, tot_Cobranza)

 SELECT   t.institucionid,'A',t.titularid,t.planid,t.empresaid,t.derivacionID,
          --consumo
          (SELECT coalesce(sum(d.importe_pagado),0)  from  contable.detalle_de_facturas_de_prestadores d 
                  WHERE d.titularid=t.titularid 
                  and   d.institucionid=t.institucionid
                  and  year(d.fecha_prestacion)*100+month(d.fecha_prestacion) between vDesde and vHasta) 
            AS tot_Consumo_Pagado,
	   --facturado
           (select coalesce(sum(f.importe),0) from contable.facturas f 
           where f.titularid=t.titularid  
           and f.institucionid=t.institucionid
           AND   year(f.fecha_listado)*100 + month(f.fecha_listado)  between vDesde and vHasta
 	   and   f.tipo_documento='F'
           and   f.estado<>'A'
           and   f.numero_not in (
            select Aplica_Factura 
            from contable.facturas 
	    where  institucionid=f.institucionid
               and titularid=f.titularid
               and tipo_documento='C' 
               and letra = f.letra
               --and centro_emisor = f.centro_emisor NO va
               and Aplica_Factura is not null)) as tot_Facturado,
          -- total capitas
          (SELECT count(*)  from afiliados.afiliados f 
           where f.titularid=t.titularid 
           and f.institucionid=t.institucionid
           and (f.fecha_baja is null or f.fecha_baja > vfecHasta)
           and year(f.fecha_alta)*100 + month(f.fecha_alta)<=  vHasta) as tot_Capitas,
            -- cobranzas
	   (SELECT coalesce(sum(d.importe),0)  from  contable.recibos_de_cobro d 
		                  WHERE d.titularid=t.titularid 
		                  and   d.institucionid=t.institucionid
		                  and  year(d.fecha_cobro)*100+month(d.fecha_cobro) between vDesde and vHasta)  + 
             --aportes
	    (SELECT coalesce(sum(d.aporte),0)  from  afiliados.aportes_de_afiliados d 
		                  WHERE d.titularid=t.titularid 
		                  and   d.institucionid=t.institucionid
		                  and  d.factura_anio*100+d.factura_mes between vDesde and vHasta)    as tot_Cobrado        
from afiliados.titulares t
 where   t.institucionid=vInstitut and year(t.fecha_alta)*100 + month(t.fecha_alta) >= vPerAlta;


-- empresas
INSERT INTO afiliados.consumo_afiliados_total
(institucionID, Tipo, titularID, planID, empresaID, derivacionID,
 tot_Consumo_Pagado,tot_Facturado, tot_Capitas, tot_Cobranza)

 SELECT   t.institucionid,'E',0,NULL as planid,t.empresaid,t.derivacionID,
          --consumo
          (SELECT coalesce(sum(d.tot_Consumo_Pagado),0)  from  afiliados.consumo_afiliados_total d 
                  WHERE d.empresaid=t.empresaid 
                  and   d.institucionid=t.institucionid
                  and tipo='A'  
                  ) 
            AS tot_Consumo_Pagado,
            -- facturado
           (select coalesce(sum(f.tot_Facturado),0) from afiliados.consumo_afiliados_total f 
           where f.empresaid=t.empresaid  
           and f.institucionid=t.institucionid
           and tipo='A') + 
           (select coalesce(sum(f.importe),0) from contable.facturas f 
           where f.empresaid=t.empresaid  
           and f.titularid=0  
           and f.institucionid=t.institucionid
           AND year(f.fecha_listado)*100 + month(f.fecha_listado)  between vDesde and vHasta
 	   and f.tipo_documento='F'
           and f.estado<>'A'
	   and f.numero_not in (
            select Aplica_Factura 
            from contable.facturas 
	    where institucionid=f.institucionid
               and empresaid=f.empresaid 
               and tipo_documento='C' 
               and letra = f.letra
              -- and centro_emisor = f.centro_emisor
               and Aplica_Factura is not null))   as tot_Facturado,
           --capitas
          (SELECT sum(tot_Capitas)  from afiliados.consumo_afiliados_total f 
           where f.empresaid=t.empresaid 
           and f.institucionid=t.institucionid
           and tipo='A') as tot_Capitas,
           -- cobranzas
	   (SELECT coalesce(sum(d.importe),0)  from  contable.recibos_de_cobro d 
		                  WHERE d.titularid=t.empresaid 
		                  and   d.institucionid=t.institucionid
                                  and   d.titularid <> 942 -- el cobro de osem no va. me dijo Jose
		                  and  year(d.fecha_cobro)*100+month(d.fecha_cobro)
                                  between vDesde and vHasta) +
	   (select coalesce(sum(f.tot_Cobranza),0) from afiliados.consumo_afiliados_total f 
           where f.empresaid=t.empresaid  
           and f.institucionid=t.institucionid and tipo='A')     as tot_Cobrado       
from afiliados.empresas t
 where  t.institucionid=vInstitut;

delete from afiliados.consumo_afiliados;
insert into afiliados.consumo_afiliados ( institucionID, Tipo, titularID, planID, 
				empresaID , derivacionID, tot_Facturado, tot_Capitas, tot_Consumo_Pagado, tot_Cobranza) 
select  institucionID, Tipo, titularID, planID, empresaID , 
        derivacionID, sum(tot_Facturado), sum(tot_Capitas), 
	sum(tot_Consumo_Pagado), sum(tot_Cobranza)  
from afiliados.consumo_afiliados_total group by  institucionID, Tipo, 
titularID, planID, empresaID , derivacionID ;

end

$body$
language plpgsql volatile  
cost 100;




















--***** Objeto:  procedimiento almacenado dbo.sp_GeneraInformePrevenSalud    fecha_de la secuencia de comandos: 26/09/2007 04:02:06 p.m. ******
create  function sp_GeneraInformePrevenSalud(
   Desde_p  int,
   Hasta_p  int,
  Inst  int,
   gRazonSoc varchar(50)) returns void AS

$body$

DECLARE 
ApeNom varchar(100);
TitularID numeric;
CodFamID int;
Edad numeric(6,2) ;
Practica varchar(15);
FecPrest timestamp;
PrestadorID int;
nro_Encontro int;
Per  int;
Area varchar(80);
Especialidad varchar(50);
TipoPrest varchar(15);
codigo int;
Subcodigo int;
PREV_CANCER_CUELLO_MAMA int ;
MATERNO_INFANTIL  int;
Ver_Embarazo int;
Descripcion varchar(200);



DECLARE  pCur Cursor for  
select rtrim(apellido) || ' ' || rtrim(nombre) as ApeNom,
a.titularID, 
a.codfamID,
DateDiff(month, a.fecha_naci, getdate()) / 12 as edad,
d.codigonomenclador,
d.fecha_prestacion,
f.prestadorID,
 year(d.fecha_prestacion)*100 +  month(d.fecha_prestacion) as periodo,
i.codigo,i.subcodigo,  i.descripcion
from afiliados.afiliados a, 
contable.facturas_de_prestadores f,
contable.detalle_de_facturas_de_prestadores d,
 estadisticas.InfoIISSCABECERA i
 Where a.institucionID = inst
 and d.institucionID = a.institucionID
 and f.institucionID = d.institucionID
 and d.titularID =  a.titularID
 and d.codFamID  =  a.codFamID
and year(d.fecha_prestacion)*100 +  month(d.fecha_prestacion)  between Desde_p and Hasta_p
 and d.codigonomenclador = i.prestacion
 and i.prestacion is not null
 and f.nro_liquidacion  =  d.nro_liquidacion
 and f.prestadorID in (
 select prestadorID from autorizaciones.datos_de_prestadores
 Where institucionID = inst
 and prestadorID = f.prestadorID
 and (especialidad like '%NUTRIC%' or 
 especialidad like '%GINECO%' or 
 especialidad like '%CARDIO%' or 
 especialidad like '%ODONTO%' or 
 especialidad like '%UROLOG%'))
 order by f.prestadorID,d.codigonomenclador;

 

begin

 PREV_CANCER_CUELLO_MAMA = 3 ;
 MATERNO_INFANTIL   = 1;

-- Borro registros del periodo
DELETE from estadisticas.InfoIISSDETALLE  where institucionID = inst and periodo  between Desde_p and Hasta_p;

--armo cursor 

      
LOOP


        fetch pCur into  ApeNom , TitularID, CodFamID  , Edad, Practica, FecPrest, PrestadorID, Per,
                                         codigo, SubCodigo, Descripcion;
	EXIT WHEN NOT FOUND ;
  

		 -- busco datos en autorizaciones.prestadores 
		SELECT  a.area, a.especialidad,  d.tipo
		   FROM autorizaciones.datos_de_prestadores a, autorizaciones.prestadores d
		 Where a.institucionID = Inst
		 and a.institucionID = d.institucionID 
		 and a.prestadorID = d.prestadorID 
		 and a.prestadorID = PrestadorID into Area ,  Especialidad , TipoPrest ;

		  IF Practica= '420101' And TipoPrest <> 'MEDICO'  then
				 Especialidad = null;
				 Area = null;
		  Elsif Area <> 'CAPITAL FEDERAL' then
			      Area = 'GRAN BS. AS.';

		  end if;
		  
		  IF Especialidad = null  then
			   continue;
		  end if;         
		  
	       
		 IF Practica= '420101'   then

			
		      codigo= 0 ;
		      Subcodigo= 0 ;
			
		      IF position ( 'NUTRIC' in Especialidad) >0 then
		    
				 codigo= 11 ;
				 Subcodigo= 1;
		     END  if;

		     IF POSITION('GINECO' in  Especialidad) >0 then
				     codigo= 2;
				     Subcodigo= 1;
		     END  if;

		     IF POSITION('CARDIO' in Especialidad) >0 then
				     codigo= 12;
				     Subcodigo= 2;
		     END  if;


		     IF POSITION('UROLOG' in Especialidad) >0 then
				     codigo= 4;
				     Subcodigo= 1;
		     END  if; 

	  
	      END  if;  
	       

	      
	       -- filtro casos
	      
		IF codigo=  PREV_CANCER_CUELLO_MAMA then
		
			  If  Practica = '340601'   OR Practica = '340602' then
		
			      IF Edad < 40 then
				continue;
			      end if ; 
			      
			   end if ;           
		end if ; 
		
		Ver_Embarazo = 0;
		 
		IF codigo=   MATERNO_INFANTIL then
		
				If  Practica = '180104'   then
				       
				      SELECT  1 FROM contable.detalle_de_facturas_de_prestadores
					WHERE institucionID = Inst
					and TitularID = TitularID
					and codFamID = CodFamID
					and codigonomenclador in ('MODPARTO','110401','801101','801103','801105','801109','110403','MODCESA') 
					into Ver_Embarazo ;

				      IF Ver_Embarazo = 0 then 
					       continue;
				     END if;
				END if;     

	       END if;
		      
	      IF  codigo> 0 AND Subcodigo> 0 then
		      
				INSERT INTO estadisticas.InfoIISSDETALLE (
				institucionID ,
				codigo,
				subcodigo,
				periodo ,
				titularID ,
				codFamID ,
				edad ,
				prestacionID,
				zonaPrestador)
				VALUES ( 
				inst,
				Codigo,
				SubCodigo,
				Per,
				TitularID,
				CodFamID,
				Edad,
				Practica,
				Area
				);
	       END if;
 
                       
 END     LOOP;



end
$body$
language plpgsql volatile  
cost 100;


 















-- Actualiza tabla de autorizaciones.detalle_de_autorizaciones
-- con el valor del coseguro calculado por el IVR
-- fecha_13/03/2011
-- 0    Coseguro acturalizado
-- 99   No se dio de alta en la base de datos

-- grant execute  on sp_IVRActualizaCoseguro to produivr


create  function  sp_IVRActualizaCoseguro(pAutorizacion  integer,pPractica  varchar(10),pCoseguro  numeric(5,2)) returns integer as

$body$


declare
vCodigoRetorno integer;
vintInstitut  integer;
myRowCount int ;

begin

 vintInstitut = 1;





   -- Get count from UPDATE

	   update autorizaciones.autorizaciones
	     set observaciones=rtrim(observaciones) + ' '  + 'Coseguro= ' + cast(pCoseguro  as varchar(6))
	     where institucionid = vintInstitut
	       and autorizacionid =  pAutorizacion;

		get diagnostics myRowCount = row_count;
			  
		
		if myRowCount = 0 then
		      vCodigoRetorno = 99;
		      rollback;
		      return vCodigoRetorno;
		end if;

	   update autorizaciones.detalle_de_autorizaciones
	      set  coseguro = pCoseguro
	     where institucionid = vintInstitut
	       and autorizacionid =  pAutorizacion
	       and codigo_practica=pPractica;

		get diagnostics myRowCount = row_count;
			  
		
		if myRowCount = 0 then
		      vCodigoRetorno = 99;
		      rollback;
		      return vCodigoRetorno;
		else
		      vCodigoRetorno = 0;  
		      commit;
		      return vCodigoRetorno;
		end if;





end
$body$
language plpgsql volatile  
cost 100;


























-- Habilita o no la autorizaciòn de practicas por IVR
-- Fecha creaciòn 14/06/2009
-- Devuelve:  


-- 0 Afiliado Autorizado
-- 3 Número de asociado incorrecto. Inténtelo nuevamente.
-- 4 Asociado no dado de alta aun en nuestro sistema.
-- 5 Asociado de Baja. Comuníquese con Privamed.
-- 6 Prestador no habilitado para el plan 550
-- 7 Prestador no habilitado para el plan 660
-- 8 Prestador no habilitado para el plan 770
-- 9 Prestador no habilitado para el plan 990
-- 10 Asociado no habilitado para su atencion. Comuniquese con Privamed
-- 11 Plan 440 no habilitado para el servicio IVR
-- 12 Prestador no habilitado para el plan 100






-- DROP  PROCEDURE sp_IVR_ValidaAfiliado 



CREATE or replace  function sp_IVR_ValidaAfiliado (
vTitularID  DECIMAL(38) ,
vCodFam     DECIMAL(38) ,
vPrestador  DECIMAL(38) ,
OUT vCodigoRetorno SMALLINT ,
OUT vAfilApeNom  varCHAR(50) ,
OUT vCodEmpresa  VARCHAR ,
OUT vPlan CHAR(10) ) as 

$body$





DECLARE intInstitut SMALLINT ;
DECLARE constMesesEnMora SMALLINT ;


DECLARE iReturn  VARCHAR ;
DECLARE pPlanAfi CHAR(8) ;
DECLARE pPlanConvenio CHAR(8) ;

DECLARE vPlanes  VARCHAR(500);

DECLARE pAtiendePlan CHAR(5) ;


DECLARE falta  timestamp ;
DECLARE cobrador CHAR(20) ;



DECLARE CurConvenio CURSOR FOR
SELECT  ltrim(rtrim(planes)) as planes FROM autorizaciones.convenios
WHERE institucionid=intInstitut
AND   prestadorID = vPrestador
AND   cIVR=1
order by fecha_desc LIMIT 100;

       -- declaro cursor de split del campo afiliados.planes de tabla autorizaciones.convenios
DECLARE CurPractica CURSOR FOR
SELECT item FROM regexp_split_to_table(vPlanes,',');

BEGIN

	intInstitut = 1 ;
	-- seteo variable con valor considerado como "AFILIADO EN MORA"
	constMesesEnMora=2 ;


	  -- Valido parametros del afiliado
	IF  ISNUMERIC(vTitularID) =0 THEN
	  vCodigoRetorno = 3 ;
	  RETURN;
	END IF;

	IF LEN(vTitularID) <3 OR LEN(vTitularID) >11 THEN
	  vCodigoRetorno = 3 ;
	  RETURN;
	END IF;

	IF  vTitularID IS NULL  THEN
	  vCodigoRetorno = 3 ;
	  RETURN;
	END IF;




	    -- Valido parametros del afiliado
	IF  ISNUMERIC(vCodFam) =0  THEN
	  vCodigoRetorno = 3 ;
	  RETURN;
	END IF;

	IF LEN(vCodFam) >2  THEN
	  vCodigoRetorno = 3;
	  RETURN;
	END IF;

	IF  vCodFam IS NULL  THEN
	  vCodigoRetorno = 3;
	  RETURN;
	END IF;




	  -- Valido parametros de prestador
	IF  ISNUMERIC(vPrestador) =0  THEN
	  vCodigoRetorno = 1;
	  RETURN;
	END IF;

	IF LENGTH(vPrestador) >5   THEN
	  vCodigoRetorno = 1;
	  RETURN;
	END IF;

	IF  vPrestador IS NULL THEN
	  vCodigoRetorno = 1;
	  RETURN;
	END IF;


		-- Valido existencia del afiliado


	IF NOT EXISTS (SELECT * FROM afiliados.afiliados  WHERE titularID= vTitularID
	  AND codfamID = vCodFam  AND institucionID= intInstitut )  THEN 
		   vCodigoRetorno = 3;
		   RETURN;
	END IF;




        -- Valido fecha_de baja del afiliado


        IF EXISTS (SELECT 1  FROM afiliados.afiliados  WHERE titularID= vTitularID
          AND codfamID = vCodFam  AND institucionID= intInstitut 
          AND fecha_baja IS NOT  NULL )  THEN
           vCodigoRetorno = 5;
	   RETURN;
	END IF;


-- obtengo plan del afiliado
        SELECT planID into pPlanAfi FROM titulares
           WHERE titularID= vTitularID
           AND  institucionID= intInstitut;


        vPlan = pPlanAfi; -- me piden que retorne el plan   


        -- Valido morosidad del afiliado


        SELECT  cobradorID, falta = fecha_alta    FROM afiliados.titulares  
          WHERE titularID= vTitularID
          AND  institucionID= intInstitut  INTO cobrador;


        IF cobrador IN ('VIP')  THEN
          SELECT  empresaid ,  RTRIM(apellido) || ' ' || RTRIM(nombre)  into vCodEmpresa, vAfilApeNom   FROM afiliados.afiliados  
          WHERE titularID= vTitularID
          AND codfamID = vCodFam  
          AND institucionID= intInstitut ;
          
          vCodigoRetorno = 0 ;-- afiliados.afiliados con permisos irrestrictos
	   RETURN;
	END IF;


        IF cobrador IN ('CON DEUDA','FISCALIZACION','SIN APORTES')   THEN
          vCodigoRetorno = 10 ;-- Asociado no habilitado para su atencion. Comuniquese con Privamed
	   RETURN;
	END IF;


        IF cobrador IN ('P.M.O.E.','PMOE')   THEN
           vCodigoRetorno = 11 ;-- Asociado no habilitado para su atencion. Comuniquese con Privamed
	   RETURN;
	END IF;




       IF datediff(dd,falta,getdate()) < 0  THEN
          vCodigoRetorno = 4 ;-- Afiliado no dado de alta aun
	   RETURN;
	END IF;


	IF vPrestador = 0 THEN
          SELECT  empresaid ,  RTRIM(apellido) || ' ' || RTRIM(nombre)  into vCodEmpresa, vAfilApeNom   FROM afiliados.afiliados  
          WHERE titularID= vTitularID
          AND codfamID = vCodFam  
          AND institucionID= intInstitut ;
          
          vCodigoRetorno = 0 ; -- PRESTADOR = 0 es un comodin / si llego hasta aqui el afilido es valido
	   RETURN;            -- No valido prestador.
	END IF;
			     


        -- Valido que exista practica y que tenga autorizacion de IVR para el prestador / plan del afiliads


        pAtiendePlan = 'FALSE';


	OPEN CurConvenio;

	LOOP

	FETCH CurConvenio INTO  vPlanes;
	EXIT WHEN NOT FOUND ;

		OPEN CurPractica;

		LOOP

		FETCH  CurPractica INTO  pPlanConvenio;
		EXIT WHEN NOT FOUND ;



                   IF    upper(pPlanConvenio) like  '%TODOS%' then
                       pAtiendePlan='TRUE'	;
		  END IF;

                   IF   pPlanConvenio = pPlanAfi  then
                       pAtiendePlan='TRUE';
                   end if;    
 

          END  LOOP;

        END  LOOP;


       IF  pAtiendePlan= 'FALSE'  THEN

		IF left(pPlanAfi,3) ='100'  THEN
		  vCodigoRetorno = 12 ;
	          RETURN;  	
	        END IF;  	 
	END IF;


	IF left(pPlanAfi,3) ='440'  THEN

		SELECT vCodigoRetorno = 11
		RETURN;   
	 ELSIF left(pPlanAfi,3) ='550' then

		SELECT vCodigoRetorno = 6
		return;
	ELSIF left(pPlanAfi,3) ='660' then

		SELECT vCodigoRetorno = 7
		return;
	 ELSIF  left(pPlanAfi,3) ='770' then

		SELECT vCodigoRetorno = 8
		return;
	 ELSIF  left(pPlanAfi,3) ='990' then

		SELECT vCodigoRetorno = 9
		return;
	 ELSE
  
		SELECT vCodigoRetorno = 10
		RETURN;
          END  IF; 


        -- Valido fecha_de baja del afiliado

         SELECT  empresaid ,  RTRIM(apellido) || ' ' || RTRIM(nombre)  into vCodEmpresa, vAfilApeNom   FROM afiliados.afiliados  
          WHERE titularID= vTitularID
          AND codfamID = vCodFam  
          AND institucionID= intInstitut ;
          
        vCodigoRetorno =0;


         RETURN ;

END;


$body$
language plpgsql volatile  
cost 100;

-- Habilita o no la autorizaciòn de practicas por IVR
-- Fecha creaciòn 14/06/2009
-- Devuelve:  
-- 0 Prestador Autorizado
-- 1 Número de prestador ingresado es incorrecto.Inténtelo nuevamente.	
-- 2 Prestador no autorizado para el servicio IVR
-- 3 Nombre del Prestador.
-- 4 tipo_de prestador (guardia / ambulatorio / psicoterapia)
-- 5 afiliados.planes que atiEND IF;e el prestador

-- DROP  PROCEDURE sp_IVR_ValidaPrestador 

CREATE FUNCTION  sp_IVR_ValidaPrestador(
vPrestador   DECIMAL(38) ,
out vCodigoRetorno SMALLINT ,
out vPrestaApeNom  varchar(60) ,
out vTipoPresta  varchar(1) ,
out vPlanes      varchar(350) )

AS
$body$



DECLARE intInstitut SMALLINT;
DECLARE constMesesEnMora SMALLINT;

DECLARE iReturn  VARCHAR;

BEGIN

        vPrestaApeNom = NULL;
	vTipoPresta = NULL;

	intInstitut = 1;

 	-- Valido parametros de prestador
	IF  ISNUMERIC(vPrestador) =0 THEN
	
	   vCodigoRetorno = 1;
	   return;
	END IF;
	
	IF LENGTH(vPrestador) >5  THEN
	
	   vCodigoRetorno = 1;
	   return;
	END IF;
	
	IF  vPrestador IS NULL THEN
	
	   vCodigoRetorno = 1;
	   return;
	END IF;
   

        -- Valido existencia del prestador

        IF NOT EXISTS (SELECT * FROM autorizaciones.prestadores  WHERE PrestadorID= vPrestador
          AND institucionID= intInstitut )   THEN
        
           vCodigoRetorno = 1;
           return;
        END IF;


        -- Valido fecha_de baja del prestador

        IF EXISTS (SELECT 1  FROM autorizaciones.prestadores  WHERE PrestadorID= vPrestador
          AND institucionID= intInstitut 
          AND (fecha_baja IS NOT  NULL OR estado = 1 )) THEN
         
           vCodigoRetorno = 1;
           return;
        END IF;

       
         

     	 -- Valido Prestador  autorizado/ no autorizado para el servicio IVR
        IF NOT EXISTS (
           SELECT 1 FROM autorizaciones.convenios n
              WHERE n.institucionID =  intInstitut
                AND n.cIVR=1
                AND n.prestadorID = vPrestador) THEN
           
           vCodigoRetorno = 2;
           return;
          END IF;

 	-- obtengo nombre y tipo_prestador del prestador

        SELECT nombre,
              
               CASE 
                 WHEN tipo_IN ('CLINICA','SANATORIO') THEN 'G'
                 WHEN EXISTS(SELECT 1 FROM autorizaciones.datos_de_prestadores
                                WHERE institucionID =  intInstitut
                                AND   prestadorID =  vPrestador
		                AND   especialidad in  ('PSIQUIATRIA','PSICOLOGIA INFANTIL',
                                                        'PSICOLOGIA','PSICOPEDAGOGIA')) THEN 'P'
                 ELSE 'A'
               END INTO vPrestaApeNom, vTipoPresta
        FROM autorizaciones.prestadores  WHERE PrestadorID= vPrestador
          AND institucionID= intInstitut   ;

 	-- obtengo afiliados.planes que atiEND IF;e el PRESTADOR
	IF EXISTS(SELECT 1 FROM autorizaciones.convenios 
                  WHERE institucionID =  intInstitut
                  AND   prestadorID =  vPrestador 
                  AND   UPPER(planes) IN ('TODOS')
		  AND   cIVR =1)  THEN
           
           	  vPlanes = 'TODOS';
        
        ELSE SELECT  INTO vPlanes UPPER(LTRIM(RTRIM(REPLACE(planes,';',',')))) 
              FROM autorizaciones.convenios 
              WHERE institucionID =  intInstitut
              AND   prestadorID =  vPrestador
              AND   cIVR =1 LIMIT 1 ;

         END IF;
         
        vCodigoRetorno = 0;








END;
$body$
language plpgsql volatile  
cost 100;















CREATE FUNCTION sp_Imprimirfacturas () returns void as
$body$

BEGIN

SELECT f.*,(f.importe-f.iva)as subtotal,a.apellido as ape_fact, a.nombre as nom_fact, a.cuit, a.tipo_iva, a.domicilio_adic as domi_fact, a.localidad_adic as local_fact, a.telefono_adic as tele_fact, a.domicilio_fact as domi_refe, a.localidad_fact as local_refe, a.telefono_fact as tele_refe, a.referencia_cobranza,a.cobradorID ,i.ImpEnLetras  FROM contable.facturas f, afiliados.titulares a,temp_print_fact t, contable.ImporteLetras i
WHERE f.letra = t.letra
AND f.institucionID = t.institucionID
AND f.institucionID = a.institucionID
AND f.titularID = a.titularID 
AND (a.deriva_facturacion='' or a.deriva_facturacion is null OR a.deriva_facturacion  =0)
AND f.numero BETWEEN t.factura_desde AND t.factura_hasta 
AND f.numero=i.numero
UNION ALL
SELECT f.*,(f.importe-f.iva)as subtotal,d.empresa as ape_fact, NULL  as nom_fact, d.cuit, a.tipo_iva, d.domicilio_fact as domi_fact, d.localidad_fact as local_fact, d.telefono_fact as tele_fact,a.domicilio_adic as domi_refe, a.localidad_adic as local_refe, a.telefono_adic as tele_refe, a.referencia_cobranza,a.cobradorID ,i.ImpEnLetras   FROM contable.facturas f, afiliados.titulares a, afiliados.facturacion_derivada d,temp_print_fact t, contable.ImporteLetras i
WHERE f.letra = t.letra
AND f.institucionID = t.institucionID
AND f.institucionID = a.institucionID
AND f.titularID = a.titularID  
AND d.codigoid=a.deriva_facturacion
AND not (d.codigoid='' or d.codigoid is null OR d.codigoid =0)
AND f.numero BETWEEN t.factura_desde AND t.factura_hasta 
AND f.numero=i.numero
UNION ALL
SELECT f.*,(f.importe-f.iva)as subtotal,a.razon_social, NULL as nom_fact, a.cuit, a.tipo_iva, a.domicilio as domi_fact, a.localidadID as local_fact, a.telefono1 as tele_fact,null as domi_refe, null as local_refe, null as tele_refe,NULL ,a.cobradorID ,i.ImpEnLetras   FROM contable.facturas f, afiliados.empresasa,temp_print_fact t, contable.ImporteLetras i
WHERE f.letra = t.letra
AND f.institucionID = t.institucionID
AND f.institucionID = a.institucionID
AND f.empresaID = a.empresaID 
AND a.empresaID>0
AND f.numero BETWEEN t.factura_desde AND t.factura_hasta 
AND f.numero=i.numero
ORDER BY f.numero;

end
$body$
language plpgsql volatile  
cost 100;










CREATE FUNCTION sp_InsertarCabeceraautorizaciones(
	vInstitucionid INT  ,
	vTitularid INT  ,
	vCodfamid  VARCHAR  ,
	vnumero_internacion int  ,
	vNumero_prorroga int  ,
	vFecha_practica timestamp  ,
	vFecha_generacion timestamp  ,
	vDerivado_por  varchar (60),
	vcodigoPreDeriva int  ,
	vMedico_practicante  varchar (30),
	vCodigoPreCirujano  int  ,
	vLugar_intervencion  char (30),
	vCodigoPreInstituto  int  ,
	vDiagnostico   varchar (1500),
	vIngreso_por   varchar (15),
	vPiso CHAR (6),
	vCantidad   VARCHAR  ,
	vFacturar_afiliado  integer  ,
	vFactura  int  ,
	vMonto_factura  numeric(7, 2)  ,
	vCostoTotalPractica   numeric(7, 2)  ,
	vObservaciones   varchar (1500),
	vFecha_alta_internacion  timestamp  ,
	vCusuario  char (15),
	vFultman  timestamp,
        vPracticas  varCHAR(200) ,
        OUT id integer )   RETURNS integer
AS

$body$

BEGIN

       -- Inserto cabecera
       INSERT INTO autorizaciones.autorizaciones(
		institucionid, 
		titularid, 
		codfamid, 
		numero_internacion, 
		numero_prorroga, 
		fecha_practica, 
		fecha_generacion, 
		 derivado_por, 
		codigoPreDeriva, 
		medico_practicante, 
		codigoPreCirujano, 
		lugar_de_intervencion, 
		codigoPreInstituto, 
		diagnostico, 
		ingreso_por, 
		piso, 
		cantidad, 
		facturar_afiliado,
		factura, 
		monto_factura,
		costoTotalPractica, 
		observaciones, 
		fecha_alta_internacion, 
		cusuario, 
		fultman)
		VALUES(
		vInstitucionid,
		vTitularid,
		vCodfamid,
		vnumero_internacion,
		vNumero_prorroga ,
		vFecha_practica,
		vFecha_generacion ,
		vDerivado_por ,
		vcodigoPreDeriva,
		vMedico_practicante ,
		vCodigoPreCirujano ,
		vLugar_intervencion,
		vCodigoPreInstituto,
		vDiagnostico ,
		vIngreso_por ,
		vPiso,
		vCantidad ,
		vFacturar_afiliado,
		vFactura ,
		vMonto_factura,
		vCostoTotalPractica ,
		vObservaciones,
		vFecha_alta_internacion,
		vCusuario ,
		vFultman 
		) RETURNING autorizacionID INTO id;

end ;		
		

$body$
language plpgsql volatile  
cost 100;










CREATE FUNCTION sp_InsertarDetalleautorizaciones(
 	vAutorizacionid INT  ,
	vInstitucionid INT  ,
	vTitularid INT  ,
	vCodfamid  VARCHAR  ,
	vFecha_generacion timestamp  ,
	vPractica  varchar(10),
	vValorPractica   numeric(7, 2)  ,
	vCantidad  SMALLINT,
	vCusuario  char (15),
	vFultman  timestamp,
        NroLiquidacion  numeric(18,0)  ) returns void
AS
$body$

BEGIN

       -- Inserto detallle
       INSERT INTO autorizaciones.detalle_de_autorizaciones(
		autorizacionID,
		institucionid, 
		titularid, 
		codfamid, 
		fecha_generacion, 
		codigo_practica, 
		valor_practica, 
		cantidad, 
		cusuario, 
		fultman,
		nro_liquidacion
                 )
		VALUES(
		vAutorizacionid,
		vInstitucionid,
		vTitularid,
		vCodfamid,
		vFecha_generacion ,
		vPractica,
		vValorPractica,
		vCantidad,
		vCusuario,
		vFultman ,
	        NroLiquidacion 
		);
END;
		
		

$body$
language plpgsql volatile  
cost 100;











CREATE  FUNCTION sp_ListaafiliadosEnMora( inst int, cant_fact int ) returns void 
AS
$body$

begin

select i.razon_social,t.titularid,t.apellido,t.nombre,t.planid,count(*) as cantidad, sum(f.importe) as deuda from
afiliados.institucioni, afiliados.titulares t, contable.facturas f
where i.institucionid=inst
  and i.institucionid=t.institucionid
  and i.institucionid=f.institucionid
  and t.titularid=f.titularid
  and t.fecha_baja is null
  and f.estado='P'
  and f.tipo_documento in ('F','D')
  and f.numero_not in (
 select Aplica_Factura  from facturas
 Where institucionid =inst
 and tipo_documento ='C'
 and letra = f.letra
 and titularid = f.titularid
 and Aplica_Factura is not null)
group by i.razon_social,t.titularid,t.apellido,t.nombre,t.planid
having count(*) >= cant_fact
UNION ALL 
select i.razon_social,t.titularid,t.apellido,t.nombre,t.planid,count(*) as cantidad, sum(f.valor) as deuda from
afiliados.institucioni, afiliados.titulares t, contable.ImprentaFactNumeracion f
where i.institucionid=inst
  and i.institucionid=t.institucionid
  and i.institucionid=f.institucionid
  and t.titularid=f.titularid
  and t.fecha_baja is null
  and f.estado='P'
group by i.razon_social,t.titularid,t.apellido,t.nombre,t.planid
having count(*) >= cant_fact
order by t.titularid;



end;
$body$
language plpgsql volatile  
cost 100;











CREATE FUNCTION sp_ListaafiliadosMayor21anios( inst  int) returns void  AS
$body$
begin
select t.apellido,a.*,DateDiff(year,a.fecha_naci,getdate()) as edad 
 from afiliados.titulares t, afiliados.afiliados a 
  where t.institucionid=inst
    and t.institucionid=a.institucionid
    and t.titularid=a.titularid
    and t.fecha_baja is null
    and a.fecha_baja is null
    and a.codfamid between 30 and 39
    and DateDiff(year,a.fecha_naci,getdate())>21
order by a.titularid, a.codfamid;




end;
$body$
language plpgsql volatile  
cost 100;















CREATE FUNCTION sp_ListaAportesDeafiliados( inst  int) returns void as 
$body$

begin
select t.*,a.* 
 from afiliados.titulares t, afiliados.aportes_de_afiliados a 
  where t.institucionid=inst
    and t.institucionid=a.institucionid
    and t.titularid=a.titularid
    and t.fecha_baja is null
order by  a.factura_anio,a.factura_mes,a.periodo_anio,a.periodo_mes,a.titularid;



end;
$body$
language plpgsql volatile  
cost 100;



CREATE FUNCTION sp_ListaOrdenInternacion 
(inst int, numero_autorizacion int) returns void 

AS

$body$
begin
select t.*,t1.*, i.*, n.*, a.*, datediff(year, t.fecha_naci,getdate()) as edad from
afiliados.institucioni, afiliados.afiliados t, autorizaciones.autorizaciones a, auditoria.nomenclador_nacional n, afiliados.titulares t1, autorizaciones.detalle_de_autorizaciones d
where i.institucionid=inst
  and i.institucionid=t.institucionid
  and i.institucionid=a.institucionid
  and a.titularid=t.titularid
  and a.codfamid = t.codfamid
  and t.fecha_baja is null
  and i.institucionid=t1.institucionid
  and a.titularid=t1.titularid
  and t1.fecha_baja is null
  and a.autorizacionID= numero_autorizacion
  and a.autorizacionID= d.autorizacionID
  and d.codigo_practica =   n.codigoNN;



end;
$body$
language plpgsql volatile  
cost 100;
























CREATE  FUNCTION sp_ListaPadronafiliados(
inst int,
desde_titular int,
hasta_titular int,
desde_empresa int,
hasta_empresa int,
desde_plan varchar(10),
hasta_plan varchar(10),
desde_cobra varchar(20), hasta_cobra varchar(20),
desde_promo varchar(20), hasta_promo varchar(20),
desde_localidad varchar(20), hasta_localidad varchar(20),
desde_fecha_alta timestamp, hasta_fecha_alta timestamp,
desde_afiliados varchar(20),
hasta_afiliados varchar(20))
returns void 

AS

$body$
begin

select t.* from afiliados.titulares t, afiliados.afiliados a
where t.institucionid=inst
 and a.institucionid=inst
 and t.titularid = a.titularid
 and a.codfamid=0
 and t.titularid between desde_titular and hasta_titular
 and t.empresaid between desde_empresa and hasta_empresa
 and t.planid between desde_plan and hasta_plan
 and t.cobradorid between desde_cobra and hasta_cobra
 and t.promotorid between desde_promo and hasta_promo
 and t.localidad_fact between desde_localidad and hasta_localidad
 and t.fecha_alta between desde_fecha_alta and hasta_fecha_alta
 and t.derivacionID between desde_afiliados.derivacion and hasta_afiliados.derivacion
 and t.fecha_baja is null
 and a.fecha_baja is null
order by t.titularid;





end;
$body$
language plpgsql volatile  
cost 100;
















CREATE FUNCTION sp_ListaTitularesPorCobrador(

inst int,
desde_cobra varchar(20), hasta_cobra varchar(20),
desde_fecha_alta timestamp, hasta_fecha_alta timestamp
)
returns void 

AS

$body$
begin

select t.* from afiliados.titulares t
where t.institucionid=inst
 and t.cobradorid between desde_cobra and hasta_cobra
 and t.fecha_alta between desde_fecha_alta and hasta_fecha_alta
 and t.fecha_baja is null
order by t.titularid;





end;
$body$
language plpgsql volatile  
cost 100;









CREATE     FUNCTION sp_ModificaValorPlanPasadosEdad (
pintInstitut SMALLINT ,
OUT pCantRegistrosModificados SMALLINT  )


AS
$body$


DECLARE
  pTitularID  VARCHAR ;
  pCodFamID SMALLINT ;
  pEdad SMALLINT ;
  pEmpresaid  VARCHAR ;
  pPlanID CHAR(10) ;
  pMontoValorPlan  numeric(7,2) ;
  pValorCuota  numeric(7,2) ;
  pMontoDescuento  numeric(5,2) ;
  pSQL varchar(500) ;
  myERROR int ;
  myRowCount int  ;
  ParmDefinition varchar(1000) ;
  pClaseID SMALLINT ;

  CurPasados Cursor FOR 
        SELECT v.titularID, v.codfamID, v.edad, t.empresaid, t.planid, t.valor_cuota  
        FROM vPasadosEdadPlan v, afiliados.titulares t
        WHERE v.institucionID = pintInstitut   
          AND v.institucionID = t.institucionID 
          AND v.titularID = t.titularID ;
     --     AND t.valor_cuota  >0			


BEGIN

 	pCantRegistrosModificados=0;

	TRUNCATE TABLE logFallasAfilStatusPlan;



	OPEN CurPasados ;

	LOOP
		FETCH  CurPasados INTO pTitularID, pCodFamID, pEdad, pEmpresaid, pPlanID, pValorCuota;
		EXIT WHEN NOT FOUND ;

	
             

                SELECT dbo.fnGetClasePorEdad(pintInstitut, pEdad ,pPlanID,  pEmpresaid) INTO   pClaseID  ;

                IF pClaseID > 0 THEN
          
			--- Modifico contrato del afiliado
		       DELETE  FROM afiliados.contrato_para_facturar_afiliados
			WHERE  institucionid= pintInstitut
	                  AND  titularid  = pTitularID
	                  AND  codfamid  = pCodFamID;
	

		        get diagnostics myRowCount = row_count;
		        
			IF myRowCount = 0 THEN
			       pCantRegistrosModificados = 0;
			       ROLLBACK ;
			       return;
			 END IF;
 
                	INSERT INTO afiliados.contrato_para_facturar_afiliados(institucionid,titularid,claseID,codfamid)
                        VALUES (pintInstitut,pTitularID, pClaseID, pCodFamID);


		        get diagnostics myRowCount = row_count;
		        
			IF myRowCount = 0 THEN
			       pCantRegistrosModificados = 0;
			       ROLLBACK ;
			       return;
			 END IF;

		ELSE

                        INSERT INTO logFallasAfilStatusPlan (institucionid,titularid, codfamid, planid,edad) 
			VALUES (pintInstitut,pTitularID,pCodFamID, pPlanID,pEdad );
		 END IF;
 		
            
   		--- FIN Modifico contrato del afiliado

		--- Proceso descuento

		SELECT  SUM(s.precio) INTO pMontoValorPlan
		FROM afiliados.contrato_para_facturar_afiliados f, 
		precio_de_planes_para_empresas s 
		WHERE f.institucionid= pintInstitut 
		AND   f.institucionid= s.institucionid 
		AND   f.claseID = s.claseID 
		AND   s.empresaid= pEmpresaid 
		AND   f.titularID = pTitularID 
		AND   s.planID = pPlanID ;
	

                IF pValorCuota > 0  THEN
		        pMontoDescuento = ROUND(((pMontoValorPlan - pValorCuota) / pValorCuota * 100),2);
	         END IF;

	         
		UPDATE afiliados.titulares SET descuento = pMontoDescuento
		 WHERE institucionid= pintInstitut 
		   AND  titularid= pTitularID;


		get diagnostics myRowCount = row_count;
		
		IF myRowCount = 0 THEN
		       pCantRegistrosModificados = 0;
		       ROLLBACK ;
		       return;
		  END  IF;
	
	
	         pCantRegistrosModificados = pCantRegistrosModificados +1;
	
	         
        END LOOP;

        COMMIT;
        



END;



$body$
language plpgsql volatile  
cost 100;







-- Valida para el afiliado/plan/patologia/practica/prestador si paga coseguro o no
-- Fecha creaciòn 14/04/2011
-- Devuelve:  
-- S/N si el afiliado paga coseguro o no.
-- drop PROCEDURE sp_PagaCoseguro_IVR



CREATE   FUNCTION sp_PagaCoseguro_IVR (


pTitularID  DECIMAL(38) ,
pCodFam    SMALLINT ,
pintInstitut SMALLINT,
pPractica    varCHAR(10),
pPlanID      varCHAR(10),
pPrestador  varchar(6),
OUT pPagaCoseguro CHAR(1) ) 


AS
$body$

BEGIN

pPagaCoseguro='S';

-- ver coseguro por patologias
IF EXISTS (SELECT 1 FROM  afiliados.patologiasafiliados
		  WHERE titularID = pTitularID 
		    AND codfamID = pCodFam
	            AND institucionID = pintInstitut 
                    AND (auditoria.tipopatologia like  '%DISCAPACIDAD%' OR
		         auditoria.tipopatologia like  '%PMI%' OR
		         auditoria.tipopatologia like  '%P.M.I%' OR   
		         auditoria.tipopatologia like  '%ONCOLOGICO%' OR   
		         auditoria.tipopatologia like  '%HIV%')
		    AND getdate() between fdesde and fhasta)  THEN


                 pPagaCoseguro='N'  ;  
                 return;        
               END IF;

-- ver coseguro por cobrador VIP
IF EXISTS (SELECT 1 FROM  titulares
		  WHERE titularID = pTitularID 
	            AND institucionID = pintInstitut 
                    AND cobradorID='VIP') T THEN
                 pPagaCoseguro='N'  ;  
                 return;        
               END IF;

-- ver coseguro por afiliados.planes altos
IF EXISTS (SELECT 1 FROM  titulares
		  WHERE titularID = pTitularID 
	            AND institucionID = pintInstitut 
                    AND planID in ('880CXD','880CXE','1000')) THEN

                 pPagaCoseguro='N'  ;  
                 return;        
               END IF;


-- ver ver coseguro por plan/practica/prestador
IF  CHARINDEX(','+ pPrestador + ',',',207,123,329,367,296,240,194,321,120,47,03,293,338,170,280,67,10,77,194,305,280,123,64,159,310,306,197,437,415,213,61,367,448,97,216,492,') >0 AND
    left(pPlanID,3) in ('550','100')  and 
    CHARINDEX(pPractica,'420101,420112,420113,420110,4201010,420111')>0 THEN
                 pPagaCoseguro='N'  ;  
                 return;        
               END IF;


IF  CHARINDEX(','+ pPrestador + ',',',207,123,329,367,296,240,194,321,120,47,03,293,338,170,280,67,10,77,194,305,280,123,64,159,310,306,197,437,415,213,61,367,448,97,216,540,525,526,534,960,624,901,827,543,562,716,994,991,824,492,') >0  and 
    left(pPlanID,3)='660'  and 
    CHARINDEX(pPractica,'420101,420112,420113,420110,4201010,420111')>0  THEN
                 pPagaCoseguro='N'  ;  
                 return;        
               END IF;

--  Dr. Clemente, Damian, es Medico de Acceso Directo y no Cobra Coseguros en ningun plan
IF  pPrestador = 461 THEN
                 pPagaCoseguro='N'  ;  
                 return;        
               END IF;




END



$body$
language plpgsql volatile  
cost 100;

























-- Habilita o no la autorizaciòn de practicas por IVR
-- Fecha creaciòn 28/04/2009
-- Devuelve:
  
-- 0    Prestacion Autorizada
-- 12 Código de práctica incorrecto. Inténtelo nuevamente. 
-- 13 Práctica no habilitada para el servicio IVR 
-- 14 Práctica no autorizada, superó tope anual. Comuníquese con Privamed. 
-- 15 Práctica no autorizada, superó tope Mensual de 4. 
-- 16 Práctica reiterada. Comuníquese con Privamed. 
-- 17 Se autorizan xx sesiones ya que supero tope anual. 
-- 18 Restan 2 sesiones para alcanzar tope anual.
-- 19 Restan 5 sesiones para alcanzar tope anual.
-- 20 No es consulta de 1° vez, Pte ya fue atendido, corresponde Cod 420101l.
-- 99   Error al dar de alta en la base de datos



CREATE    FUNCTION sp_PermisoPorIVR (

vTitularID  DECIMAL(11) ,
vCodFam    SMALLINT ,
vPrestador  VARCHAR ,
vPracticas  varCHAR(200) ,
OUT vCodigoRetorno  VARCHAR ,
OUT vNumeroAutoriza  VARCHAR ,
OUT vPlanID   varCHAR(10) ,
OUT vCantPracDispo  VARCHAR ,
OUT vCantPracAutorizadas  VARCHAR ,
OUT vPagaCoseguroC CHAR(1) ,
OUT vPrestaApeNom  varCHAR(20)
 ) AS

$body$



DECLARE intInstitut SMALLINT ;
DECLARE constMesesEnMora SMALLINT ;
DECLARE vCantPract SMALLINT ;
DECLARE vCantTopeMensual SMALLINT ;
DECLARE prestadorID  SMALLINT ;
DECLARE AutorizaID  VARCHAR ;
DECLARE iReturn  VARCHAR ;
DECLARE FechaActual  TIMESTAMP ;
DECLARE Practica  varCHAR(10) ;
DECLARE valPrac  VARCHAR ;
DECLARE vSuperaTopeMensual CHAR(5) ;
DECLARE vSuperaTopeAnual CHAR(5) ;
DECLARE vSuperaTopePMI   CHAR(5) ;
DECLARE vCobradorID CHAR(20)  ;
DECLARE vValor   numeric(7,2)  ;
DECLARE vFlagInicio CHAR(5) ;
DECLARE vPagaCoseguro VARCHAR;



DECLARE CurPract CURSOR FOR
SELECT item FROM regexp_split_to_table(vPracticas,',');


BEGIN


	intInstitut = 1;
	vNumeroAutoriza=0;

	vCantPracDispo=0;
	vCantPracAutorizadas =0;
	vCodigoRetorno = 0;
	vFlagInicio = 'true';
	vPagaCoseguro='' ;


         select now() into FechaActual;

        -- Valido si la cadena de practica/s llegò vacia
         IF EXISTS (SELECT COUNT(1) FROM regexp_split_to_table(vPracticas,',') 
                    HAVING COUNT(1) = 0) THEN
           vCodigoRetorno = 12; -- Código de práctica incorrecto
           return;
          END IF; 






         -- busco plan del titular


	SELECT planID, cobradorID into  vPlanID, vCobradorID  FROM titulares
        WHERE titularID = vTitularID
          AND institucionID= intInstitut;



	-- Validacion de codigos de prestacion
	OPEN CurPract ;

	LOOP
	
			FETCH CurPract INTO Practica;
			EXIT WHEN NOT FOUND;







				-- me fijo si en la practica no viene adosada la cantidad e.g. 
		-- 330101-10
			       IF ( CHARINDEX ('-',Practica) > 0 ) THEN
						vCantPract=RIGHT (Practica,len (Practica)-CHARINDEX ('-',Practica)) ;-- tomo cantidad
			       END IF;			
			       
			       Practica =   SUBSTRING(Practica,1,CHARINDEX ('-',Practica)-1) ;-- tomo practica s/cant.  


			       IF vCantPract=0 OR vCantPract =NULL  THEN
		      
				   vCodigoRetorno = 12; -- Código de práctica incorrecto
				   ROLLBACK; 
				   RETURN;
			       ELSE
				   SELECT vCantPract =1;
			       END IF;


		       -- Valido que los codigos sean solamente numericos y de un maximo de 8 digitos


			       valPrac=ISNUMERIC (Practica);


			       IF valPrac = 0 OR LEN(Practica) >7 THEN
		       
				    vCodigoRetorno = 12 ;-- Código de práctica incorrecto
				    ROLLBACK ;
				    return;
			       END IF;


		  -- Valido que exista practica y que tenga autorizacion de IVR para el prestador


		      IF NOT EXISTS (
				 SELECT 1 FROM autorizaciones.convenios n
				      WHERE n.institucionID =  intInstitut
					AND n.cIVR=1
					AND n.prestadorID = vPrestador
					AND ISNUMERIC(n.desde_practica)>0
					AND ISNUMERIC(n.hasta_practica)>0
					AND CAST(Practica  AS DECIMAL) BETWEEN  
					CAST(n.desde_practica    AS DECIMAL) AND CAST(n.hasta_practica   AS DECIMAL)) THEN

				     vCodigoRetorno = 13 ;-- Práctica no habilitada para el servicio IVR
				    ROLLBACK ;
				    return;
			       END IF;

			     
		       vCantPract= coalesce(vCantPract,1);




			-- valida topes por practica


			 IF vCobradorID <> 'VIP' THEN -- afiliados.afiliados com permisos irrestrictos
		  
			   SELECT  sp_ValidaTopesPorPracticas_IVR( vTitularID,vCodFam,Practica, vCantPract,vPlanID) 
			   INTO  vSuperaTopeMensual, vSuperaTopeAnual , vSuperaTopePMI , vCantPracDispo ,  vCantTopeMensual ;




			  IF vSuperaTopePMI='true' THEN-- Cuando supera trimestral por PMI
			       
				   vCodigoRetorno = 16; -- Práctica Reiterada
				   ROLLBACK; 
				   RETURN;

			  END IF;


			 IF vSuperaTopeAnual='true' THEN--- Cuando supera tope .
			
				  IF vCantPracDispo > 0 THEN
				    
					vCodigoRetorno = 17; -- Se autorizan xx sesiones ya que supero tope anual
					vCantPracAutorizadas = vCantPracDispo;
					vCantPract= vCantPracDispo;
					vCantPracDispo =0 ;

				  ELSE
				    
					vCodigoRetorno = 14 ;-- Práctica no autorizada, superó tope anual. Comuníquese con Privamed.
					vCantPracDispo = 0;
					vCantPracAutorizadas =0;
					ROLLBACK ;
					return;
				   END IF;
					     
			  ELSE  -- cuando no supera tope anual.
			
				  IF vCantPracDispo = 2 then
					vCodigoRetorno = 18; -- Restan 2 sesiones para alcanzar tope anual.
				  end if;		
				  IF vCantPracDispo = 5 then
					vCodigoRetorno = 19; -- Restan 5 sesiones para alcanzar tope anual.
				  end if;	
			  END IF;




			-- valido item 15 Práctica no autorizada, superó tope Mensual de 4.
		 


			  IF vSuperaTopeMensual='true' then-- Cuando supera tope .
				   
				  vCodigoRetorno =  15; -- Práctica no autorizada, superó tope Mensual de 4
				  vCantPracAutorizadas =0;
				  vCantPracDispo=0;
				  ROLLBACK ;
				  return;
			  END IF;


				       -- grazada nueva
			 IF Practica ='4201010' AND EXISTS(SELECT 1
			       FROM autorizaciones.autorizaciones i, autorizaciones.detalle_de_autorizaciones d
			       WHERE i.institucionid = d.institucionid
			       and i.institucionid= intInstitut
			       and i.autorizacionID = d.autorizacionID
			       and d.codigo_practica= Practica 
			       and d.titularID= vTitularID
			       and d.codfamID= vCodFam
			       and i.codigopreinstituto= vPrestador) then
				       
					vCodigoRetorno =  20; -- No es consulta de 1° vez, Pte ya fue atendido, corresponde Cod 420101
					vCantPracAutorizadas =0;
					vCantPracDispo=0;
					ROLLBACK ;
					return;
			   END IF;





		  ELSE
				   
			  vCantPracDispo=999;
		  END IF; --cuando es VIP el afiliado
		   




        -- Valido si paga coseguro o no depEND IF;iEND IF;o de patologia
	   SELECT  sp_PagaCoseguro_IVR( vTitularID,vCodFam,intInstitut,Practica,vPlanID,vPrestador) INTO vPagaCoseguro ;


		--  hago cosas si estoy en la primera iteracion
	   IF  vFlagInicio = 'true' then
			  -- busco nombre del prestador


	       SELECT nombre  into vPrestaApeNom FROM autorizaciones.prestadores 
	       WHERE prestadorID = vPrestador
		 AND institucionID= intInstitut;
	 
		-- inserto cabecera de autorizaciones.autorizaciones
		select sp_InsertarCabeceraautorizaciones (
			intInstitut,
			vTitularID,
			vCodFam,
			0,--numero_internacion
			0,--numero_prorroga
			FechaActual, --fecha_practica 
			FechaActual,--fecha_generacion
			vPrestaApeNom,  -- derivado por
			vPrestador,      -- codigoPreDeriva
			'',  -- medico practicante
			0,        -- codigoPreCirujano
			vPrestaApeNom,-- lugar de intervencion
			vPrestador, -- codigoPreInstituto
			'.',     --Diagnostico
			'',        -- ingreso por
			'',        -- piso     
			1,  -- Cantidad
			0, -- facturar afiliado
			0, -- factura
			0, -- monto factura
			0, -- costoTotalPractica
			'Alta por IVR', --  observaciones
			Null,  -- fecha_alta_internacion
			'IVR', --cusuario
			FechaActual, -- fultman,
			vPracticas) into AutorizaID ;
			  
		
			vFlagInicio = 'false';

		
		 -- obtengo valor fijo practica para el plan para el prestador
		 SELECT  valor into vValor FROM autorizaciones.convenios n
			      WHERE n.cIVR=1
				AND n.tipo_valor='VF'
				AND n.prestadorID = vPrestador
				AND ISNUMERIC(n.desde_practica)>0
				AND ISNUMERIC(n.hasta_practica)>0
				AND CAST(Practica  as decimal) BETWEEN  
				    CAST(n.desde_practica   as decimal)   
				AND CAST(n.hasta_practicaAS  as decimal)
				AND n.institucionID =  intInstitut
				order by n.fultman  desc limit 1 ;




		-- si no obtengo valor, busco valor NN practica para el prestador
		IF (vValor=0 Or vValor IS NULL) then
			SELECT (m.total + m.total * n.valor / 100) into vValor 
			FROM autorizaciones.convenios n, auditoria.nomenclador_nacional m
			WHERE n.cIVR=1
			AND n.tipo_valor='NN'
			AND n.prestadorID = vPrestador
			AND ISNUMERIC(n.desde_practica)>0
			AND ISNUMERIC(n.hasta_practica)>0
			AND ISNUMERIC(m.codigonn)>0
			AND CAST(Practica  as decimal) BETWEEN  
			    CAST(n.desde_practica   as decimal)   
			AND CAST(n.hasta_practicaAS  as decimal)
			AND n.institucionID =  intInstitut
			AND m.institucionID =  n.institucionID
			AND m.codigonn=Practica 
			order by n.valor desc limit 1 ;

                end if;


	--SELECT vValor= vValor*vCantPract




		 -- fin valido practica cantidad


		select  sp_ConviertoCodigosIVR (Practica) into Practica;


		SELECT  sp_InsertarDetalleautorizaciones(
			AutorizaID,
			intInstitut,
			vTitularID,
			vCodFam,
			FechaActual,--fecha_generacion
			Practica,
			vValor, --valor * cantidad
			vCantPract,  -- Cantidad
			'IVR', --cusuario
			FechaActual, -- fultman,
			0 ); --- Liquidacion)


		vCantPracAutorizadas = vCantPracAutorizadas + vCantPract;

	   end if;

	   
        END LOOP;
        
        COMMIT;        


       vNumeroAutoriza =AutorizaID;



END ;



$body$
language plpgsql volatile  
cost 100;





















-- Habilita o no tope de practicas por periodo/afiliado
-- Fecha creaciòn 01/10/2009
-- Devuelve:  
-- TRUE/FALSE si llego al tope
-- Cantidad de practicas disponibles que "quedan o no quedan para el afiliado
-- Cantidad de practicas disponibles que "quedan o no quedan para el afiliado
-- drop PROCEDURE sp_ValidaTopesPorPracticas_IVR 



-- Habilita o no tope de practicas por periodo/afiliado
-- Fecha creaciòn 01/10/2009
-- Devuelve:  
-- TRUE/FALSE si llego al tope
-- Cantidad de practicas disponibles que "quedan o no quedan para el afiliado
-- drop PROCEDURE sp_ValidaTopesPorPracticas_IVR 

CREATE      FUNCTION sp_ValidaTopesPorPracticas_IVR (


pTitularID  DECIMAL(38) ,
pCodFam    SMALLINT ,
pPractica  CHAR(10),
pCantPedida SMALLINT ,
pPlanAfi 	 VARCHAR(10),
OUT pSuperoTopeMensual VARCHAR(5) ,
OUT pSuperoTopeAnual VARCHAR(5) ,
OUT pSuperaTopePMI VARCHAR(5) ,
OUT pCantDisponible SMALLINT,
OUT pCntTopeMensual SMALLINT )  as


$body$


DECLARE pintInstitut SMALLINT ;
DECLARE pCntTopeAnual SMALLINT ; 
DECLARE pPlanTope VARCHAR ;
DECLARE Periodo  VARCHAR ;
DECLARE pHayTop VARCHAR(5) ;
DECLARE pCantTotal SMALLINT ; 
DECLARE pCantUsada SMALLINT  ;
DECLARE pCantTopeTrimestral SMALLINT  ;
DECLARE pCantUsadaPMI  SMALLINT  ;
DECLARE pSQL varchar(500) ;
DECLARE mstrDesdeP CHAR(10) ;
DECLARE mstrHastaP CHAR(10) ;
DECLARE ParmDefinition varchar(500) ;
DECLARE pHayTope varchar;

DECLARE CurPracticas Cursor FOR SELECT planID,tope, topeMensual, topeTrimestral FROM afiliados.coberturas_de_afiliados.planes 
		      WHERE institucionID = pintInstitut     
 			AND ISNUMERIC(desde_practica)>0
 		        AND ISNUMERIC(hasta_practica)>0
                        AND CAST(pPractica as  VARCHAR) BETWEEN  
                            CAST(desde_practica as VARCHAR) AND CAST(hasta_practicaAS as VARCHAR)
			AND (UPPER(planID) ='TODOS' OR UPPER(planID) = left(pPlanAfi,len(planID)))
                        ORDER BY tope;

BEGIN


	pintInstitut = 1 ;
 	pHayTope='false';
	pSuperaTopePMI = 'false';

  
	OPEN CurPracticas ;

	LOOP

	FETCH CurPracticas INTO pPlanTope, pCntTopeAnual, pCntTopeMensual, pCantTopeTrimestral;
	EXIT WHEN NOT FOUND;


           pHayTope='true';


        END LOOP;

       


         -- No esta topeada la practica, por lo tanto no hago nada
        IF  pHayTope='false' THEN
            
	        pSuperoTopeAnual = 'false';
		pCantDisponible =999;
           
        ELSE    --- Esta topeada la practica
            
		  --casos que no son de PMI
		-- busco si la practica tiene topes
		select desde_practica, hasta_practica INTO mstrDesdeP, mstrHastaP
		FROM afiliados.coberturas_de_afiliados.planes 
		Where institucionid= pintInstitut 
		AND rtrim(modulo)<> 'P.M.I.'
		AND	ISNUMERIC(desde_practica)>0 
		AND	ISNUMERIC(hasta_practica)>0 
		and  cast(pPractica  AS DECIMAL) between cast(desde_practica   AS DECIMAL) and   cast(hasta_practica   AS DECIMAL);
		
		
		if mstrDesdeP IS NULL THEN
	            
		        pSuperoTopeAnual = 'false';
			pCantDisponible =999;
			return;
		END IF;

                 --- valido tope mensual



		 pSQL = 'SELECT INTO pCantUsada ISNULL (SUM(cantidad),0) into pCantUsada  '
		  + ' FROM     [detalle de autorizaciones]  '
		  + ' WHERE titularID = ' +  @pTitularID  ;
		  
                   -- caso especial psico terapia codigo 330103 es terapia grup fam y se cuenta por grupo no individual
                 IF @mstrDesdeP <> '330103'  THEN
			pSQL = pSQL +  '   AND codfamID = ' + pCodFam ;
                  END  IF;


	           pSQL = pSQL +  ' AND DATE_PART(''year'', AGE(fechageneracion))=DATE_PART(''year'', AGE(now())) '
	          + '   AND DATE_PART(''month'', AGE(fechageneracion))=DATE_PART(''month'', AGE(now())) '
		  + '   AND ISNUMERIC([codigo practica])>0 '
                  + '   AND CAST([codigo practica] AS DECIMAL) BETWEEN   '
                  + '       CAST(''' + mstrDesdeP + ''' AS DECIMAL)   ' 
		  + '       CAST(''' + mstrHastaP + ''' AS DECIMAL)   ' 
	          + '   AND institucionID = ' + pintInstitut ;

	          execute   pSQL  ;
		

		

                 SELECT pCantTotal = pCantUsada + pCantPedida  ;


                 IF pCantTotal > pCntTopeMensual AND pCntTopeMensual > 0 THEN
	                 
	                     pSuperoTopeMensual = 'true' ;
		  END IF ;

                 --- valido tope anual

		
		pSQL = 'SELECT INTO pCantUsada ISNULL (SUM(cantidad),0) into pCantUsada  '
		  + ' FROM     [detalle de autorizaciones]  '
		  + ' WHERE titularID = ' +  @pTitularID  ;
		  
                   -- caso especial psico terapia codigo 330103 es terapia grup fam y se cuenta por grupo no individual
                 IF @mstrDesdeP <> '330103'  THEN
			pSQL = pSQL +  '   AND codfamID = ' + pCodFam ;
                  END  IF;


	           pSQL = pSQL +  ' AND DATE_PART(''year'', AGE(fechageneracion))=DATE_PART(''year'', AGE(now())) '
		  + '   AND ISNUMERIC([codigo practica])>0 '
                  + '   AND CAST([codigo practica] AS DECIMAL) BETWEEN   '
                  + '       CAST(''' + mstrDesdeP + ''' AS DECIMAL)   ' 
		  + '       CAST(''' + mstrHastaP + ''' AS DECIMAL)   ' 
	          + '   AND institucionID = ' + pintInstitut ;

	          execute   pSQL  ;
		
     

                 SELECT pCantTotal = pCantUsada + pCantPedida  ;

                  IF pCantTotal > pCntTopeAnual  AND pCntTopeAnual > 0 THEN
	                 
	                     pSuperoTopeAnual = 'true' ;
			     pCantDisponible = pCntTopeAnual - pCantUsada ;

                  ELSE
                         
	                     pSuperoTopeAnual = 'false' ;
			     pCantDisponible = pCntTopeAnual-pCantTotal ;
		  END IF;  

                  ---casos especial PMI

                  IF pCntTopeAnual > 0  THEN
                  
                     Periodo=360 ;
                   END IF;
                  
                   IF pCantTopeTrimestral > 0  THEN
                  
                      Periodo=90 ;
                   END IF;
    
	          SELECT pCantUsadaPMI = ISNULL (SUM(d.cantidad),0) 
		  FROM     autorizaciones.detalle_de_autorizaciones d, afiliados.patologiasafiliados p
		  WHERE d.titularID = pTitularID 
		    AND d.codfamID = pCodFam
                    AND dateDiff(day, d.fecha_generacion, getdate()) <= Periodo
		    AND	ISNUMERIC(codigo_practica)>0
                    AND CAST(codigo_practica  AS DECIMAL) BETWEEN  
                        CAST(mstrDesdeP    AS DECIMAL)   
		    AND CAST(mstrHastaP    AS DECIMAL)
	            AND d.institucionID = pintInstitut 
		    AND d.institucionID = p.institucionID 
		    AND d.titularID = p.titularID
		    AND d.codfamID = p.codfamID
                    AND p.auditoria.tipopatologia in  ('PMI','P.M.I.') 
		    AND getdate() between fdesde and fhasta  ;

                  
                  IF pCantUsadaPMI > 0   THEN-- tiene prioridad el PMI
                   
			SELECT pCantTotal = pCantUsadaPMI + pCantPedida ;
						
			IF (pCantTotal > pCantTopeTrimestral AND pCantTopeTrimestral>0) or 
                           (pCantTotal > pCntTopeAnual AND pCntTopeAnual>0) THEN
			 
				pSuperaTopePMI = 'true' ;
				pCantDisponible = pCantTopeTrimestral - pCantUsada ;

			ELSE
			 
				pSuperaTopePMI = 'false' ;
				pCantDisponible = pCantTopeTrimestral - pCantTotal ;
			   END IF;   
                    END IF;
          END IF; 

        IF pCantDisponible < 0 THEN
          pCantDisponible = 0;
        END IF;



end;
$body$
language plpgsql volatile  
cost 100;





 -- drop  procedure afiliados.createTitular(inout _reqnro integer ,  _institut integer ,  _usuario varchar, v_data json) 
create or replace  procedure afiliados.sp_createTitular(inout _titularid integer ,  _institut integer ,  _usuario varchar, v_data json) 
LANGUAGE plpgsql
AS $$
BEGIN

    select  max(titularid)+1   into  _titularid 
	from afiliados.titulares where institucionid=1 ;
 
 
    /* inserto titular */
    INSERT INTO afiliados.titulares(
		titularid, institucionid, cusuario, fultman,
		planid,	empresaid,	apellido, nombre,
		cobradorid,promotorid, razon_social_empleador, cuit_empleador,
		estado,fecha_alta,fecha_carga,fecha_baja,
		miscelanea,	domicilio_fact,	localidad_fact,	cod_postal_fact,
		provincia,	telefono_fact,	interseccion_fact,	whatsup,	fax,
		correo_electronico,	mail_facturacion,	domicilio_adic,	localidad_adic,
		cod_postal_adic,	telefono_adic,	interseccion_domi,	referencia_cobranza,
		tipo_descuento, descuento,	fin_descuento,	valor_cuota,
		tipo_iva, factura_desde, deriva_facturacion,cuit, derivacionID)	
		
	select _titularid, _institut,  _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'titular') as
	 foo(planes varchar, empresas int,	apellido varchar,	nombre varchar,
		cobradores varchar,	promotores varchar,	razon_social_empleador varchar, cuit_empleador varchar, 
		estado integer, fecha_alta date,	fecha_carga  date, fecha_baja  date,
		miscelanea text, domicilio_fact varchar, localidad_fact varchar, cod_postal_fact int,
		provincia varchar,	telefono_fact varchar,	interseccion_fact varchar,
		whatsapp varchar,  fax varchar, correo_electronico varchar, 
		mail_facturacion varchar, domicilio_adic varchar, 
		localidad_adic varchar,  cod_postal_adic int, telefono_adic varchar,
		interseccion_adic varchar, referencia_cobranza varchar,
		tipo_descuento varchar,	descuento numeric,	fin_descuento date , 
		valor_cuota numeric, tipo_iva varchar, factura_desde date, deriva_facturacion varchar,
		cuit varchar,derivacionID varchar);

	 /* inserto grupo familiar */
	 INSERT INTO afiliados.afiliados(
		titularid, institucionid, cusuario, fultman, 
		codfamid, apellido , nombre  ,
        sexo ,  fecha_baja, fecha_alta, fecha_naci , 
		tipo_docu, nume_docu, cuil )
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'afiliados') as
	 foo(codfamid int, apellido varchar, nombre varchar ,
        sexo varchar, fecha_baja date,  
		fecha_alta date, fecha_naci date, tipo_docu varchar, 
		nume_docu integer, cuil varchar);

 /* inserto grupo familiar */
	 INSERT INTO afiliados.historico_os(
		titularid, institucionid, cusuario, fultman, 
		codfamid, fdesde,fhasta, derivacionid)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'historico_os') as
	 foo(codfamid int, fdesde date,  
		 fhasta date , derivacionid varchar);
	
	/* inserto aportes de afiliados */
	 INSERT INTO afiliados.aportes_de_afiliados(
		titularid, institucionid, cusuario, fultman, 
		periodo_anio, periodo_mes,  
		factura_anio, factura_mes,
		observacion, aporte,
		facturado)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'aportesAfi') as
	 foo(periodo_anio int, periodo_mes int,  
		 factura_anio int , factura_mes int,
		 observacion varchar, aporte numeric,
		 facturado varchar);
		 
		 

	/* inserto patologias de afiliados */
	 INSERT INTO afiliados.patologiasafiliados(
		titularid, institucionid, cusuario, fultman, 
		codfamid, tipopatologia,observaciones,
		fdesde,fecha_carga,fhasta,valor)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'patologiasAfi') as
	 foo(codfamid int, tipopatologia varchar ,observaciones varchar,
		fdesde date,fecha_carga date,fhasta date,valor numeric);	
		
		/* inserto recupero sur */
	 INSERT INTO auditoria.afi_con_recupero_sur(
		titularid, institucionid, cusuario, fultman, 
		codfamid, tipopatologia,observaciones,
		fdesde,fecha_carga,fhasta,valor)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'recuperoSur') as
	 foo(codfamid int, tipopatologia varchar ,observaciones varchar,
		fdesde date,fecha_carga date,fhasta date,valor numeric);	
		
		
	/* inserto alertas afiliados */
	INSERT INTO afiliados.Alertasafiliados(
		titularid, institucionid, cusuario, fultman, 
		fecha_carga, observaciones)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'alertas') as
	 foo(fecha_carga date, observaciones varchar);	
		
	/* inserto atencion afiliados */
	INSERT INTO afiliados.AtencionAlCliente(
		titularid, institucionid, cusuario, fultman, 
		fecha_carga, observaciones)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'atencionAfi') as
	 foo(fecha_carga date, observaciones varchar);	
	 
	 
	 	/* inserto atencion afiliados */
	INSERT INTO afiliados.contrato_para_facturar_afiliados(
		titularid, institucionid, 
		claseid, codfamid)
		
	select _titularid, _institut,* from json_to_recordset(v_data::json->'contratoAfi') as
	 foo(claseid int, codfamid int);	
		
	RETURN;
END;
$$;







-- PROCEDURE: afiliados.sp_createtitular(integer, integer, character varying, json)

-- DROP PROCEDURE IF EXISTS afiliados.sp_createtitular(integer, integer, character varying, json);
-- PROCEDURE: afiliados.sp_updatetitular(integer, integer, character varying, json)

-- DROP PROCEDURE IF EXISTS afiliados.sp_updatetitular(integer, integer, character varying, json);

CREATE OR REPLACE PROCEDURE afiliados.sp_updatetitular(
	IN _titularid integer,
	IN _institut integer,
	IN _usuario character varying,
	IN v_data json)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

 
    /* update titular */
    UPDATE afiliados.titulares set 
	   	
		cusuario  = dat.cusuario, 
		fultman  = dat.fultman,
		planid  = dat.planes,	
		empresaid  = dat.empresas,	
		apellido  = dat.apellido, 
		nombre  = dat.nombre,
		cobradorid  = dat.cobradores,
		promotorid  = dat.promotores, 
		razon_social_empleador  = dat.razon_social_empleador, 
		cuit_empleador  = dat.cuit_empleador,
		estado  = dat.estado,
		fecha_alta  = dat.fecha_alta,
		fecha_carga  = dat.fecha_carga,
		fecha_baja  = dat.fecha_baja,
		miscelanea  = dat.miscelanea,
		domicilio_fact  = dat.domicilio_fact,	
		localidad_fact  = dat.localidad_fact,	
		cod_postal_fact  = dat.cod_postal_fact,
		provincia  = dat.provincia,	
		telefono_fact  = dat.telefono_fact,	
		interseccion_fact  = dat.interseccion_fact,	
		whatsup  = dat.whatsapp,	
		fax  = dat.fax,
		correo_electronico  = dat.correo_electronico,	
		mail_facturacion  = dat.mail_facturacion,	
		domicilio_adic  = dat.domicilio_adic,	
		localidad_adic  = dat.localidad_adic,
		cod_postal_adic  = dat.cod_postal_adic,	
		telefono_adic  = dat.telefono_adic,	
		interseccion_domi  = dat.interseccion_adic,	
		referencia_cobranza  = dat.referencia_cobranza,
		tipo_descuento  = dat.tipo_descuento, 
		descuento  = dat.descuento,	
		fin_descuento  = dat.fin_descuento,	
		valor_cuota  = dat.valor_cuota,
		tipo_iva  = dat.tipo_iva, 
		factura_desde  = dat.factura_desde, 
		deriva_facturacion  = dat.deriva_facturacion,
		cuit  = dat.cuit, 
		derivacionID   = dat.derivacionID
		From 
		
	(select _usuario as cusuario, CURRENT_DATE as fultman, * from json_to_recordset(v_data::json->'titular') as
	 foo(planes varchar, empresas int,	apellido varchar,	nombre varchar,
		cobradores varchar,	promotores varchar,	razon_social_empleador varchar, cuit_empleador varchar, 
		estado integer, fecha_alta date,	fecha_carga  date, fecha_baja  date,
		miscelanea text, domicilio_fact varchar, localidad_fact varchar, cod_postal_fact int,
		provincia varchar,	telefono_fact varchar,	interseccion_fact varchar,
		whatsapp varchar,  fax varchar, correo_electronico varchar, 
		mail_facturacion varchar, domicilio_adic varchar, 
		localidad_adic varchar,  cod_postal_adic int, telefono_adic varchar,
		interseccion_adic varchar, referencia_cobranza varchar,
		tipo_descuento varchar,	descuento numeric,	fin_descuento date , 
		valor_cuota numeric, tipo_iva varchar, factura_desde date, deriva_facturacion varchar,
		cuit varchar,derivacionID varchar  )) as dat

	    WHERE afiliados.titulares.titularid = _titularid
	      AND afiliados.titulares.institucionid = _institut;

		
	RETURN;
END;
$BODY$;
ALTER PROCEDURE afiliados.sp_updatetitular(integer, integer, character varying, json)
    OWNER TO postgres;















/*


CREATE FUNCTION sp_listarConsumo (instID int,tituID int)
 AS

select  distinct  
a.autorizacionID,
a.titularid,
a.codfamid,
t.apellido,
t.nombre,
a.fecha_practica as fecha,
e.descripcion,
a.derivado por as derivador,
a.diagnostico as diag,
observaciones as observa 
from autorizaciones.autorizaciones a, autorizaciones.detalle_de_autorizaciones d, auditoria.nomenclador_nacional e, afiliados.afiliados t 
where d.codigo_practica *= e.codigoNN 
   and a.titularid=t.titularid 
   and a.codfamid=t.codfamid 
   and a.autorizacionID = d.autorizacionID
   and a.titularid=tituID 
   and a.institucionid=instid
ORDER BY a.autorizacionID


end
$body$
language plpgsql volatile  
cost 100;


























CREATE FUNCTION sp_saveCurrUseInstID usu varchar(30),institucionID int
 AS
delete from acceso_a_afiliados.empresas where 
usuario=usu
insert into acceso_a_afiliados.empresasvalues(usu,institucionID)



*/


-- PROCEDURE: afiliados.sp_createtitular(integer, integer, character varying, json)

-- DROP PROCEDURE IF EXISTS afiliados.sp_createtitular(integer, integer, character varying, json);

<<<<<<< HEAD
CREATE OR REPLACE PROCEDURE afiliados.sp_createtitular(
	INOUT _titularid integer,
	IN _institut integer,
	IN _usuario character varying,
	IN v_data json)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

    select  max(titularid)+1   into  _titularid 
	from afiliados.titulares where institucionid=1 ;
 
 
    /* inserto titular */
    INSERT INTO afiliados.titulares(
		titularid, institucionid, cusuario, fultman,
		planid,	empresaid,	apellido, nombre,
		cobradorid,promotorid, razon_social_empleador, cuit_empleador,
		estado,fecha_alta,fecha_carga,fecha_baja,
		miscelanea,	domicilio_fact,	localidad_fact,	cod_postal_fact,
		provincia,	telefono_fact,	interseccion_fact,	whatsup,	fax,
		correo_electronico,	mail_facturacion,	domicilio_adic,	localidad_adic,
		cod_postal_adic,	telefono_adic,	interseccion_domi,	referencia_cobranza,
		tipo_descuento, descuento,	fin_descuento,	valor_cuota,
		tipo_iva, factura_desde, deriva_facturacion,cuit, derivacionID)	
		
	select _titularid, _institut,  _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'titular') as
	 foo(planes varchar, empresas int,	apellido varchar,	nombre varchar,
		cobradores varchar,	promotores varchar,	razon_social_empleador varchar, cuit_empleador varchar, 
		estado integer, fecha_alta date,	fecha_carga  date, fecha_baja  date,
		miscelanea text, domicilio_fact varchar, localidad_fact varchar, cod_postal_fact int,
		provincia varchar,	telefono_fact varchar,	interseccion_fact varchar,
		whatsapp varchar,  fax varchar, correo_electronico varchar, 
		mail_facturacion varchar, domicilio_adic varchar, 
		localidad_adic varchar,  cod_postal_adic int, telefono_adic varchar,
		interseccion_adic varchar, referencia_cobranza varchar,
		tipo_descuento varchar,	descuento numeric,	fin_descuento date , 
		valor_cuota numeric, tipo_iva varchar, factura_desde date, deriva_facturacion varchar,
		cuit varchar,derivacionID varchar);

	 /* inserto grupo familiar */
	 INSERT INTO afiliados.afiliados(
		titularid, institucionid, cusuario, fultman, 
		codfamid, apellido , nombre  ,
        sexo ,  fecha_baja, fecha_alta, fecha_naci , 
		tipo_docu, nume_docu, cuil )
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'afiliados') as
	 foo(codfamid int, apellido varchar, nombre varchar ,
        sexo varchar, fecha_baja date,  
		fecha_alta date, fecha_naci date, tipo_docu varchar, 
		nume_docu integer, cuil varchar);

 /* inserto grupo familiar */
	 INSERT INTO afiliados.historico_os(
		titularid, institucionid, cusuario, fultman, 
		codfamid, fdesde,fhasta, derivacionid)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'historico_os') as
	 foo(codfamid int, fdesde date,  
		 fhasta date , derivacionid varchar);
	
	/* inserto aportes de afiliados */
	 INSERT INTO afiliados.aportes_de_afiliados(
		titularid, institucionid, cusuario, fultman, 
		periodo_anio, periodo_mes,  
		factura_anio, factura_mes,
		observacion, aporte,
		facturado)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'aportesAfi') as
	 foo(periodo_anio int, periodo_mes int,  
		 factura_anio int , factura_mes int,
		 observacion varchar, aporte numeric,
		 facturado varchar);
		 
		 
=======
CREATE OR REPLACE FUNCTION sp_update_fbaja_afiliados()
  RETURNS TRIGGER 
  LANGUAGE PLPGSQL
  AS
$$
BEGIN
raise notice 'llego a  sp_update_fbaja_afiliados: fecha vieja %  fecha nueva %',  OLD.fecha_baja, NEW.fecha_baja;

	IF NEW.fecha_baja is not  null AND  OLD.fecha_baja is null THEN
		 UPDATE afiliados.afiliados
		 SET fecha_baja = NEW.fecha_baja 
		 WHERE  fecha_baja is null
		 AND titularid = NEW.titularid 
		 AND institucionid = NEW.institucionid;
		 
	ELSIF NEW.fecha_baja is  null AND  OLD.fecha_baja is not null THEN
		 UPDATE afiliados.afiliados
		 SET fecha_baja = null
		 WHERE  fecha_baja =  OLD.fecha_baja
		 AND titularid = NEW.titularid 
		 AND institucionid = NEW.institucionid;
	END IF;

	RETURN NEW;
END;
$$


create trigger trg_update_fbaja 
after update
on afiliados.titulares
for each row
execute procedure sp_update_fbaja_afiliados();
>>>>>>> 23ac909efdeaa5a76de07b0d4fc98d44609f63e0

	/* inserto patologias de afiliados */
	 INSERT INTO afiliados.patologiasafiliados(
		titularid, institucionid, cusuario, fultman, 
		codfamid, tipopatologia,observaciones,
		fdesde,fecha_carga,fhasta,valor)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'patologiasAfi') as
	 foo(codfamid int, tipopatologia varchar ,observaciones varchar,
		fdesde date,fecha_carga date,fhasta date,valor numeric);	
		
		/* inserto recupero sur */
	 INSERT INTO auditoria.afi_con_recupero_sur(
		titularid, institucionid, cusuario, fultman, 
		codfamid, tipopatologia,observaciones,
		fdesde,fecha_carga,fhasta,valor)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'recuperoSur') as
	 foo(codfamid int, tipopatologia varchar ,observaciones varchar,
		fdesde date,fecha_carga date,fhasta date,valor numeric);	
		
		
	/* inserto alertas afiliados */
	INSERT INTO afiliados.Alertasafiliados(
		titularid, institucionid, cusuario, fultman, 
		fecha_carga, observaciones)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'alertas') as
	 foo(fecha_carga date, observaciones varchar);	
		
	/* inserto atencion afiliados */
	INSERT INTO afiliados.AtencionAlCliente(
		titularid, institucionid, cusuario, fultman, 
		fecha_carga, observaciones)
		
	select _titularid, _institut, _usuario, CURRENT_DATE , * from json_to_recordset(v_data::json->'atencionAfi') as
	 foo(fecha_carga date, observaciones varchar);	
	 
	 
	 	/* inserto atencion afiliados */
	INSERT INTO afiliados.contrato_para_facturar_afiliados(
		titularid, institucionid, 
		claseid, codfamid)
		
	select _titularid, _institut,* from json_to_recordset(v_data::json->'contratoAfi') as
	 foo(claseid int, codfamid int);	
		
	RETURN;
END;
$BODY$;
-- PROCEDURE: afiliados.sp_updatefamiliar(integer, integer, integer, character varying, json)

-- DROP PROCEDURE IF EXISTS afiliados.sp_updatefamiliar(integer, integer, integer, character varying, json);

CREATE OR REPLACE PROCEDURE afiliados.sp_updatefamiliar(
	IN _titularid integer,
	IN _codfamid integer,
	IN _institut integer,
	IN _usuario character varying,
	IN v_data json)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

 
    /* update titular */
    UPDATE afiliados.afiliados set 
	   	
		cusuario  = dat.cusuario, 
		fultman  = dat.fultman,
		apellido  = dat.apellido, 
		nombre  = dat.nombre,
		sexo  = dat.sexo,
		fecha_alta  = dat.fecha_alta,
		fecha_baja  = dat.fecha_baja,
		fecha_naci  = dat.fecha_naci,
		tipo_docu  = dat.tipo_docu,
		nume_docu  = dat.nume_docu,
		cuil	  = dat.cuil
		from 
		
	(select _usuario as cusuario, CURRENT_DATE as fultman, * from json_to_recordset(v_data::json->'familiar') as
	 foo(apellido varchar,
		  nombre varchar,
		  sexo varchar, 
		  fecha_alta date,
		  fecha_baja date,
		  fecha_naci date,
		  tipo_docu varchar ,
		  nume_docu int,
		  cuil varchar)) as dat

	    WHERE afiliados.afiliados.titularid = _titularid
		  AND afiliados.afiliados.codfamid = _codfamid
	      AND afiliados.afiliados.institucionid = _institut;

		
	RETURN;
END;
$BODY$;
ALTER PROCEDURE afiliados.sp_updatefamiliar(integer, integer, integer, character varying, json)
    OWNER TO postgres;


	-- PROCEDURE: afiliados.sp_updatetitular(integer, integer, character varying, json)

-- DROP PROCEDURE IF EXISTS afiliados.sp_updatetitular(integer, integer, character varying, json);

CREATE OR REPLACE PROCEDURE afiliados.sp_updatetitular(
	IN _titularid integer,
	IN _institut integer,
	IN _usuario character varying,
	IN v_data json)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

 
    /* update titular */
    UPDATE afiliados.titulares set 
	   	
		cusuario  = dat.cusuario, 
		fultman  = dat.fultman,
		planid  = dat.planes,	
		empresaid  = dat.empresas,	
		apellido  = dat.apellido, 
		nombre  = dat.nombre,
		cobradorid  = dat.cobradores,
		promotorid  = dat.promotores, 
		razon_social_empleador  = dat.razon_social_empleador, 
		cuit_empleador  = dat.cuit_empleador,
		estado  = dat.estado,
		fecha_alta  = dat.fecha_alta,
		fecha_carga  = dat.fecha_carga,
		fecha_baja  = dat.fecha_baja,
		miscelanea  = dat.miscelanea,
		domicilio_fact  = dat.domicilio_fact,	
		localidad_fact  = dat.localidad_fact,	
		cod_postal_fact  = dat.cod_postal_fact,
		provincia  = dat.provincia,	
		telefono_fact  = dat.telefono_fact,	
		interseccion_fact  = dat.interseccion_fact,	
		whatsup  = dat.whatsapp,	
		fax  = dat.fax,
		correo_electronico  = dat.correo_electronico,	
		mail_facturacion  = dat.mail_facturacion,	
		domicilio_adic  = dat.domicilio_adic,	
		localidad_adic  = dat.localidad_adic,
		cod_postal_adic  = dat.cod_postal_adic,	
		telefono_adic  = dat.telefono_adic,	
		interseccion_domi  = dat.interseccion_adic,	
		referencia_cobranza  = dat.referencia_cobranza,
		tipo_descuento  = dat.tipo_descuento, 
		descuento  = dat.descuento,	
		fin_descuento  = dat.fin_descuento,	
		valor_cuota  = dat.valor_cuota,
		tipo_iva  = dat.tipo_iva, 
		factura_desde  = dat.factura_desde, 
		deriva_facturacion  = dat.deriva_facturacion,
		cuit  = dat.cuit, 
		derivacionID   = dat.derivacionID
		From 
		
	(select _usuario as cusuario, CURRENT_DATE as fultman, * from json_to_recordset(v_data::json->'titular') as
	 foo(planes varchar, empresas int,	apellido varchar,	nombre varchar,
		cobradores varchar,	promotores varchar,	razon_social_empleador varchar, cuit_empleador varchar, 
		estado integer, fecha_alta date,	fecha_carga  date, fecha_baja  date,
		miscelanea text, domicilio_fact varchar, localidad_fact varchar, cod_postal_fact int,
		provincia varchar,	telefono_fact varchar,	interseccion_fact varchar,
		whatsapp varchar,  fax varchar, correo_electronico varchar, 
		mail_facturacion varchar, domicilio_adic varchar, 
		localidad_adic varchar,  cod_postal_adic int, telefono_adic varchar,
		interseccion_adic varchar, referencia_cobranza varchar,
		tipo_descuento varchar,	descuento numeric,	fin_descuento date , 
		valor_cuota numeric, tipo_iva varchar, factura_desde date, deriva_facturacion varchar,
		cuit varchar,derivacionID varchar  )) as dat

	    WHERE afiliados.titulares.titularid = _titularid
	      AND afiliados.titulares.institucionid = _institut;

		
	RETURN;
END;
$BODY$;
ALTER PROCEDURE afiliados.sp_updatetitular(integer, integer, character varying, json)
    OWNER TO postgres;

-- View: contable.v_ctacte_deudores_nueva

-- DROP VIEW contable.v_ctacte_deudores_nueva;
-- View: contable.v_ctacte_deudores_hija

-- DROP VIEW contable.v_ctacte_deudores_hija;

CREATE OR REPLACE VIEW contable.v_ctacte_deudores_hija
 AS
 SELECT x.orden,
    x.col0,
    x.num_docu,
    x.descripcion,
    x.cobrador,
    x.periodo,
    x.fdocumento,
    x.estado,
    x.debe,
    x.haber,
    x.titularid,
    x.empresaid,
    x.institucionid
   FROM ( SELECT 0 AS orden,
            ((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || v.numero AS col0,
            ((((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || v.centro_emisor) || '-'::text) || v.numero AS num_docu,
            v.descripcion,
            ''::text AS cobrador,
            (v.anio_periodo || '  '::text) || v.mes_periodo AS periodo,
            to_char(v.fecha_listado, 'yyyy-mm-dd'::text) AS fdocumento,
            v.estado,
            v.importe AS debe,
            0 AS haber,
            v.titularid,
            v.empresaid,
            v.institucionid
           FROM contable.facturas v
          WHERE v.tipo_documento::text = 'F'::text
        UNION ALL
         SELECT 1 AS orden,
            ((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || v.aplica_factura AS col0,
            ((((('CR'::text || '  '::text) || v.letra::text) || '-'::text) || v.centro_emisor) || '-'::text) || v.numero AS num_docu,
            v.descripcion,
            ''::text AS cobrador,
            ''::text AS periodo,
            ''::text AS fdocumento,
            ''::character varying AS estado,
            0::numeric AS debe,
            v.importe::numeric AS haber,
            v.titularid,
            v.empresaid,
            v.institucionid
           FROM contable.facturas v
          WHERE v.tipo_documento::text = 'C'::text
        UNION ALL
         SELECT 2 AS orden,
            ((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || v.cancela_factura AS col0,
            ''::text AS num_docu,
            (('CANCELA CON RECIBO '::text || v.numero) || ' EL '::text) || v.fecha_cobro AS descripcion,
            v.cobradorid AS cobrador,
            ''::text AS periodo,
            ''::text AS fdocumento,
            NULL::character varying AS estado,
            0::numeric AS debe,
            v.importe::numeric AS haber,
            v.titularid,
            NULL::integer AS empresaid,
            v.institucionid
           FROM contable.recibos_de_cobro v) x
  ORDER BY x.col0, x.orden;

ALTER TABLE contable.v_ctacte_deudores_hija
    OWNER TO postgres;
-- View: contable.v_ctacte_deudores_hija

CREATE OR REPLACE VIEW afiliados.v_ctacte_deudores_hija
 AS
 SELECT x.orden,
    x.col0,
    x.num_docu,
    x.descripcion,
    x.cobrador,
    x.periodo,
    x.fdocumento,
    x.estado,
    x.debe,
    x.haber,
    x.titularid,
    x.empresaid,
    x.institucionid
   FROM ( SELECT 0 AS orden,
            ((('FC'::text || '  '::text) || v.letra::text) || '-'::text)  || LPAD(cast (v.numero as char(8)),8,'00000000')AS col0,
            ((((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || v.centro_emisor) || '-'::text) || v.numero AS num_docu,
            v.descripcion,
            ''::text AS cobrador,
            (v.anio_periodo || '  '::text) || v.mes_periodo AS periodo,
            to_char(v.fecha_listado, 'yyyy-mm-dd'::text) AS fdocumento,
            v.estado,
            v.importe AS debe,
            0 AS haber,
            v.titularid,
            v.empresaid,
            v.institucionid
           FROM contable.facturas v
          WHERE v.tipo_documento::text = 'F'::text
        UNION ALL
         SELECT 1 AS orden,
            ((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || LPAD(cast (v.aplica_factura as char(8)),8,'00000000') AS col0,
            ((((('CR'::text || '  '::text) || v.letra::text) || '-'::text) || v.centro_emisor) || '-'::text) || v.numero AS num_docu,
            v.descripcion,
            ''::text AS cobrador,
            ''::text AS periodo,
            ''::text AS fdocumento,
            ''::character varying AS estado,
            0::numeric AS debe,
            v.importe::numeric AS haber,
            v.titularid,
            v.empresaid,
            v.institucionid
           FROM contable.facturas v
          WHERE v.tipo_documento::text = 'C'::text
        UNION ALL
         SELECT 2 AS orden,
            ((('FC'::text || '  '::text) || v.letra::text) || '-'::text) || LPAD(cast (v.cancela_factura as char(8)),8,'00000000') AS col0,
            ''::text AS num_docu,
            (('CANCELA CON RECIBO '::text || v.numero) || ' EL '::text) || v.fecha_cobro AS descripcion,
            v.cobradorid AS cobrador,
            ''::text AS periodo,
            ''::text AS fdocumento,
            NULL::character varying AS estado,
            0::numeric AS debe,
            v.importe::numeric AS haber,
            v.titularid,
            NULL::integer AS empresaid,
            v.institucionid
           FROM contable.recibos_de_cobro v) x


ALTER TABLE afiliados.v_ctacte_deudores_hija
    OWNER TO postgres;



-- View: afiliados.v_ctacte_deudores_padre

-- DROP VIEW afiliados.v_ctacte_deudores_padre;

CREATE OR REPLACE VIEW afiliados.v_ctacte_deudores_padre
 AS
 SELECT x.orden,
    x.col0,
    x.num_docu,
    x.descripcion,
    x.cobrador,
    x.periodo,
    x.fdocumento,
    x.estado,
    x.debe,
    x.haber,
    x.saldo,
    x.titularid,
    x.empresaid,
    x.institucionid
   FROM ( SELECT v_ctacte_deudores_hija.orden,
            v_ctacte_deudores_hija.col0,
            v_ctacte_deudores_hija.num_docu,
            v_ctacte_deudores_hija.descripcion,
            v_ctacte_deudores_hija.cobrador,
            v_ctacte_deudores_hija.periodo,
            v_ctacte_deudores_hija.fdocumento,
            v_ctacte_deudores_hija.estado,
            v_ctacte_deudores_hija.debe,
            v_ctacte_deudores_hija.haber,
            NULL AS saldo,
            v_ctacte_deudores_hija.titularid,
            v_ctacte_deudores_hija.empresaid,
  
  
  git           v_ctacte_deudores_hija.institucionid
           FROM afiliados.v_ctacte_deudores_hija
        UNION ALL
         SELECT 3 AS orden,
            v_ctacte_deudores_hija.col0,
            ''::text AS num_docu,
            'SALDO'::character varying AS descripcion,
            ''::text AS cobrador,
            ''::text AS periodo,
            ''::text AS fdocumento,
            ''::character varying AS estado,
            sum(v_ctacte_deudores_hija.debe) AS debe,
            sum(v_ctacte_deudores_hija.haber) AS haber,
            sum(v_ctacte_deudores_hija.debe) - sum(v_ctacte_deudores_hija.haber) AS saldo,
            v_ctacte_deudores_hija.titularid,
            NULL::integer AS empresaid,
            v_ctacte_deudores_hija.institucionid
           FROM afiliados.v_ctacte_deudores_hija
          GROUP BY v_ctacte_deudores_hija.col0, v_ctacte_deudores_hija.institucionid, v_ctacte_deudores_hija.titularid
        UNION ALL
         SELECT 4 AS orden,
            'TOTAL '::text AS col0,
            ''::text AS num_docu,
            'SALDO FINAL'::character varying AS descripcion,
            ''::text AS cobrador,
            ''::text AS periodo,
            ''::text AS fdocumento,
            ''::character varying AS estado,
            sum(v_ctacte_deudores_hija.debe) AS debe,
            sum(v_ctacte_deudores_hija.haber) AS haber,
            sum(v_ctacte_deudores_hija.debe) - sum(v_ctacte_deudores_hija.haber) AS saldo,
            v_ctacte_deudores_hija.titularid,
            NULL::integer AS empresaid,
            v_ctacte_deudores_hija.institucionid
           FROM afiliados.v_ctacte_deudores_hija
          GROUP BY v_ctacte_deudores_hija.institucionid, v_ctacte_deudores_hija.titularid) x
  

-- PROCEDURE: contable.sp_createfactura(integer, character varying, character varying, character varying, character varying, numeric, numeric, numeric, numeric, character varying, numeric, character varying, boolean, boolean, boolean, date, date, date, integer, integer, numeric, boolean, character varying)

-- DROP PROCEDURE IF EXISTS contable.sp_createfactura(integer, character varying, character varying, character varying, character varying, numeric, numeric, numeric, numeric, character varying, numeric, character varying, boolean, boolean, boolean, date, date, date, integer, integer, numeric, boolean, character varying);
-- PROCEDURE: contable.sp_createfactura(integer, character varying, character varying, character varying, character varying, numeric, numeric, numeric, numeric, character varying, numeric, character varying, boolean, boolean, boolean, date, date, date, integer, integer, numeric, boolean, character varying)

-- DROP PROCEDURE IF EXISTS contable.sp_createfactura(integer, character varying, character varying, character varying, character varying, numeric, numeric, numeric, numeric, character varying, numeric, character varying, boolean, boolean, boolean, date, date, date, integer, integer, numeric, boolean, character varying);

CREATE OR REPLACE PROCEDURE contable.sp_createfactura(
	IN _institut integer,
	IN _origen character varying,
	IN _tipfac character varying,
	IN _tipmov character varying,
	IN _letra character varying,
	IN _cemisor numeric,
	IN _desde_titular numeric,
	IN _hasta_titular numeric,
	IN _empresaid numeric,
	IN _desc character varying,
	IN _impo numeric,
	IN _zona_cob character varying,
	IN _desregulados boolean,
	IN _con_aportes boolean,
	IN _act_aportes boolean,
	IN _fgeneracion date,
	IN _fimpresion date,
	IN _fvencimiento date,
	IN _periodo_anio integer,
	IN _periodo_mes integer,
	IN _aplica_factura numeric,
	IN _sin_iva boolean,
	OUT _desde_facta numeric,
	OUT _desde_factb numeric,
	OUT _hasta_facta numeric,
	OUT _hasta_factb numeric,
	IN _usuario character varying)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
   curDataTitu refcursor;
   recData record;
   pTitular numeric;
   pStr varchar;
   pStr2 varchar;   
   pStrDescrip varchar;
   pValorCuota numeric;
   pStrMsgFDescuento varchar;
   aporte_es_estimado varchar;
   aporte_tiene_aportes boolean;
   aporte_detalle varchar;
   aporte_total_aportes numeric;
   aporte_importe_neto numeric;
   aporte_saldo_anterior numeric;
   TotFac integer;
   pPeriodoAporAnt integer;
   pAportes  numeric;
   pObserva  varchar;
   pSaldoAnterior   numeric;
   descrip  varchar;
   cuota numeric;
   iva numeric;
   ali_iva numeric;
   mConstMINIMO_FACTURABLE numeric=40;
   nume_fact numeric;
   mlngNume_A numeric;
   mlngNume_B numeric;
   letra varchar;
   p_dataFact record;
   p_tipo_iva varchar;
   
					
BEGIN

 --creando script para cursor Principal

 pStr := 'select t.*, a.cuil from afiliados.titulares t, afiliados.afiliados a ';
 pStr := pStr || ' where  1=1  ';
 If _zona_cob != '' Then
 	pStr := pStr || ' and t.cobradorid =''' || _zona_cob || '''';
 End if;
 pStr := pStr || '  and t.valor_cuota>0 ';
 If _tipmov = 'F' Then
     pStr := pStr || ' and t.fecha_baja is null ';
     pStr := pStr || ' and t.estado=0 ';
 End If;

 
 
pStr := pStr || ' and t.institucionID=' || _institut;
pStr := pStr || ' and t.institucionID=a.institucionID ';
pStr := pStr || ' and t.titularid=a.titularid ';
pStr := pStr || ' and a.codfamid=0 ';
pStr := pStr || ' and (t.factura_desde is null or ';
pStr := pStr || _periodo_anio * 100 + _periodo_mes || ' >= extract(year from t.factura_desde) *100 + extract(month from t.factura_desde ))';

-- esta validacion la cambia Jose el 27/08/12
-- para los directos     el periodo de alta debe ser 'MENOR' al periodo de facturacion
-- para los desregulados el periodo de alta debe ser 'MENOR IGUAL' al periodo de facturacion
If _desregulados = false Then
    pStr := pStr || ' and extract(year from t.fecha_alta) *100 + extract(month from t.fecha_alta) < ' || _periodo_anio * 100 + _periodo_mes;
Else
    pStr := pStr || ' and extract(year from t.fecha_alta) *100 + extract(month from t.fecha_alta) <= ' || _periodo_anio * 100 + _periodo_mes;
End If;
pStr := pStr || ' and t.titularid between ';
pStr := pStr || _desde_titular || ' And ' ||  _hasta_titular ;

--*** NUEVO FACTURACION ELECTRONICA *****
--*** SI EL PUNTO DE VENTA ELEGIDO = 1 NO TOMO EN CUENTA
--*** LOS RESPONSABLES INSCRIPTOS

If _letra = 'A' Then
      pStr := pStr || ' and t.tipo_iva IN (''RESPONSABLE INSCRIPTO'', ''MONOTRIBUTISTA'')';
Else
      pStr := pStr || ' and t.tipo_iva NOT IN (''RESPONSABLE INSCRIPTO'', ''MONOTRIBUTISTA'')';
End If;

If _tipmov = 'F' And _tipfac = 'CUOTA' Then
    pStr := pStr || ' and t.titularid not in ';
    pStr := pStr || ' ( select f.titularid from contable.facturas f ';
    pStr := pStr || ' where f.titularid=t.titularid ';
    pStr := pStr || ' and f.institucionid=t.institucionid ';
    pStr := pStr || ' and f.anio_periodo= ' || _periodo_anio;
    pStr := pStr || ' and f.mes_periodo= ' || _periodo_mes;
    pStr := pStr || ' and tipo_factura=''' || _tipfac || '''';
	pStr := pStr || ' and estado<> ''A'')';
    pStr := pStr || ' order by t.cobradorid,t.titularid ';
 
 End If;

raise notice 'xxxxxxxxxxxxxxxxxx query %', pStr;
-- seteo nmeros de factura

select max(numero)+1 into _desde_facta from contable.facturas
  where contable.facturas.letra= 'A'
  and contable.facturas.centro_emisor= _cemisor
  and contable.facturas.institucionID=  _institut
  and contable.facturas.tipo_documento= _tipmov;
 
select max(numero)+1 into _desde_factb from contable.facturas
  where contable.facturas.letra= 'B'
  and contable.facturas.centro_emisor= _cemisor
  and contable.facturas.institucionID=  _institut
  and contable.facturas.tipo_documento= _tipmov;
  
  
  
 mlngNume_A=_desde_facta;
 mlngNume_B=_desde_factb;

-- iva

select valor into ali_iva from  contable.alicuota_iva 
where institucionid=_institut;

 --creando script para cursor contrato plan
If _origen = 'MASIVO' Then

 OPEN curDataTitu for execute pStr;

 FETCH NEXT FROM curDataTitu into recData;
 WHILE FOUND
  LOOP

	pTitular := recData.titularID;
	--raise notice '_origen %, pTitular %', _origen , pTitular ; 

	 call contable.sp_getLeyendaContratoFactura(1,pTitular,recData.empresaid, _periodo_anio,_periodo_mes,pStrDescrip);
	 cuota = recData.valor_cuota;

	/*************************
	' ****  PROCESO APORTES
	' *************************/

	 If _desregulados Then
				  call contable.sp_getaportesparafacturar(_institut,
														  pTitular,
														  cuota,
														  _periodo_anio,
														  _periodo_mes,
														  _con_aportes,
														  _act_aportes,
														   aporte_es_estimado,
														   aporte_tiene_aportes,
														   aporte_detalle,
														   aporte_total_aportes,
														   aporte_importe_neto,
														   aporte_saldo_anterior);
		            cuota = aporte_importe_neto;
                    pStrDescrip = pStrDescrip || aporte_detalle;
                  
                    
                    If cuota < 0 Then
                      cuota = 0;
                    End If;
   	 End If;

	 if _desregulados And cuota > 0 Then

			   -- pregunta si la factura es a una empresa
			  If recData.deriva_facturacion is null And recData.tipo_iva <> 'MONOTRIBUTISTA' Then
				 -- cuotas con aportes (calcular IVA)
				 nume_fact = mlngNume_B;
				 mlngNume_B = mlngNume_B + 1;
				 Iva = 0;
				 cuota = cuota + Iva ;
				 letra = 'B';
			  Else
				-- sale a empresa una factura "A" sin iva (arreglo 13/05/2004)
				 nume_fact = mlngNume_A;
				 mlngNume_A = mlngNume_A + 1;
				 letra = 'A';
				 Iva = 0;
			  End If;
			  
		

		  Else

						-- tipo iva
				  If recData.tipo_iva = 'RESPONSABLE INSCRIPTO' Then
							nume_fact = mlngNume_A;
							mlngNume_A = mlngNume_A + 1;
							letra = 'A';
							Iva = Round(cuota - cuota / (1 + (ali_iva / 100)), 2);
				   ElseIf recData.tipo_iva = 'MONOTRIBUTISTA' Then
							nume_fact = mlngNume_A;
							mlngNume_A = mlngNume_A + 1;
							letra = 'A';
							Iva = 0;
				  ElseIf recData.tipo_iva = 'EXENTO' Then
							nume_fact = mlngNume_B;
							mlngNume_B = mlngNume_B + 1;
							Iva = 0;
							letra = 'B';
				  Else
				  			nume_fact = mlngNume_B;
							mlngNume_B = mlngNume_B + 1;
							Iva = Round(cuota - cuota / (1 + (ali_iva / 100)), 2);
							letra = 'B';
				End If;
		  End If;
			  
		  IF _tipmov <>'F'THEN
		  		cuota = _impo;
				pStrDescrip = _desc;
		  END IF;
		  
 		  CALL contable.sp_insertfacturabdd(
					_institut::integer,
					_cemisor::integer,
					letra::varchar,
					nume_fact::integer,
					_tipmov::varchar,
					_fgeneracion::timestamp,
					_fimpresion::timestamp,
					pTitular::integer,
					_empresaid::integer,
					_periodo_anio::integer,
					_periodo_mes::integer,
					pStrDescrip::varchar,
					_tipfac::varchar,
					'P'::varchar, -- estado=Pendiente
					cuota::numeric,
					iva::numeric,
					_usuario::varchar,
					now()::timestamp,
					_aplica_factura::integer,
					_fvencimiento::timestamp); 

	  --   raise notice 'No masivo ? leyenda % , titular  %',pStrDescrip, pTitular; 
	
    FETCH NEXT FROM curDataTitu into recData;
    END LOOP;
    CLOSE curDataTitu;
	
END IF;

If _origen = 'EMPRESAS' Then
	-- 'EMPRESAS' 
	
		   /* aca va la logica si es una factura de empresas
		      y llamar una a procedure contable.sp_insertarFacturas()
		  */

	select t.* into p_dataFact from afiliados.empresas t
	where  t.fecha_baja is null 
	and t.estado=0 
	and t.empresaid = _empresaid
	and t.institucionid = _institut;

		
  	 cuota = _impo;

	 If p_dataFact.tipo_iva = 'RESPONSABLE INSCRIPTO' Then
			nume_fact = mlngNume_A;
			mlngNume_A = mlngNume_A + 1;
			letra = 'A';
			 -- grasada  a pedido de gonza
			If _institut = 2 Then --medispeed
			 iva = 0; -- esta linea se reemplaza por la de abajo (ex grasada de dani a pedido de gonza)
			 iva = Round(cuota * ali_iva / 100, 2);
			ElseIf _sin_iva Then
			 iva = 0; -- esta linea se reemplaza por la de abajo (ex grasada de dani a pedido de gonza)
			Else
				iva = Round(cuota * ali_iva / 100, 2);
				cuota = cuota + iva;
			End If;

	  ElseIf p_dataFact.tipo_iva = 'EXENTO' Then
			nume_fact = mlngNume_B;
			mlngNume_B = mlngNume_B + 1;
			Iva = 0;
			letra = 'B';
	  ElseIf p_dataFact.tipo_iva = 'MONOTRIBUTISTA' Then
			 nume_fact = mlngNume_A;
			 mlngNume_A = mlngNume_A + 1;
			 letra = 'A';
			 -- grasada  a pedido de gonza
			If _sin_iva Then
			 iva = 0 ; -- esta linea se reemplaza por la de abajo (ex grasada de dani a pedido de gonza)
			Else
				iva = Round(cuota * ali_iva / 100, 2);
			End If;
	  Else
			 nume_fact = mlngNume_B;
			 mlngNume_B = mlngNume_B + 1;
			 iva = Round(cuota * ali_iva / 100, 2);
			 letra = 'B';
	  End If;

 	  CALL contable.sp_insertfacturabdd(
					_institut::integer,
					_cemisor::integer,
					letra::varchar,
					nume_fact::integer,
					_tipmov::varchar,
					_fgeneracion::timestamp,
					_fimpresion::timestamp,
					0::integer, --titularid
					_empresaid::integer,
					_periodo_anio::integer,
					_periodo_mes::integer,
					_desc::varchar,
					_tipfac::varchar,
					'P'::varchar, -- estado=Pendiente
					cuota::numeric,
					iva::numeric,
					_usuario::varchar,
					now()::timestamp,
					_aplica_factura::integer,
					_fvencimiento::timestamp); 
  
  
END IF;
	
	
If _origen = 'PARCIAL' Then
	-- 'PARCIAL afiliados puede ser x la cuota o alguna practica a facturar etc' 
	
   
		
	 cuota = _impo;
	 pStrDescrip = _desc;


     SELECT INTO p_tipo_iva tipo_iva  FROM afiliados.titulares 
	 WHERE institucionid = _institut
	 AND    titularid = ptitular;
	 
	 
	 If p_tipo_iva = 'RESPONSABLE INSCRIPTO' Then
			nume_fact = mlngNume_A;
			mlngNume_A = mlngNume_A + 1;
			letra = 'A';
	 ElseIf p_tipo_iva = 'EXENTO' Then
			nume_fact = mlngNume_B;
			mlngNume_B = mlngNume_B + 1;
			Iva = 0;
			letra = 'B';
	  ElseIf p_tipo_iva = 'MONOTRIBUTISTA' Then
			 nume_fact = mlngNume_A;
			 mlngNume_A = mlngNume_A + 1;
			 letra = 'A';
	  Else
			 nume_fact = mlngNume_B;
			 mlngNume_B = mlngNume_B + 1;
			 iva = Round(cuota * ali_iva / 100, 2);
			 letra = 'B';
	  End If;

				
	  
 	  CALL contable.sp_insertfacturabdd(
					_institut::integer,
					_cemisor::integer,
					letra::varchar,
					nume_fact::integer,
					_tipmov::varchar,
					_fgeneracion::timestamp,
					_fimpresion::timestamp,
					0::integer, --titularid
					_empresaid::integer,
					_periodo_anio::integer,
					_periodo_mes::integer,
					_desc::varchar,
					_tipfac::varchar,
					'P'::varchar, -- estado=Pendiente
					cuota::numeric,
					iva::numeric,
					_usuario::varchar,
					now()::timestamp,
					_aplica_factura::integer,
					_fvencimiento::timestamp); 
  
  
	END IF;

		  
		  
    -- retorno numeros de factura
	_hasta_factA = mlngNume_A;
	_hasta_factB = mlngNume_B;
	
    RETURN;
END;
$BODY$;
ALTER PROCEDURE contable.sp_createfactura(integer, character varying, character varying, character varying, character varying, numeric, numeric, numeric, numeric, character varying, numeric, character varying, boolean, boolean, boolean, date, date, date, integer, integer, numeric, boolean, character varying)
    OWNER TO postgres;





CREATE OR REPLACE PROCEDURE contable.sp_insertfacturabdd(
	IN _institucionid integer,
	IN _centro_emisor integer,
	IN _letra character varying,
	IN _numero integer,
	IN _tipo_documento character varying,
	IN _fecha_gene timestamp without time zone,
	IN _fecha_listado timestamp without time zone,
	IN _titularid integer,
	IN _empresaid integer,
	IN _anio_periodo integer,
	IN _mes_periodo integer,
	IN _descripcion character varying,
	IN _tipo_factura character varying,
	IN _estado character varying,
	IN _importe numeric,
	IN _iva numeric,
	IN _cusuario character varying,
	IN _fultman timestamp without time zone,
	IN _aplica_factura integer,
	IN _fecha_venc timestamp without time zone)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

	
			/* inserto registro */

		INSERT INTO contable.facturas(
					institucionid, 
					centro_emisor, 
					letra, 
			        numero, 
					tipo_documento, 
					fecha_gene,
					fecha_listado, 
					titularid, 
					empresaid, 
					anio_periodo,
					mes_periodo, 
					descripcion, 
					tipo_factura, 
					estado, 
					importe, 
					iva, 
					cusuario, 
					fultman, 
					aplica_factura, 
					fecha_venc, 
					cae, 
					fvenccae, 
					fanulacion, 
					sbase64qr)

			VALUES (
					_institucionid, 
					_centro_emisor, 
					_letra, 
				    _numero, 
					_tipo_documento, 
					_fecha_gene,
					_fecha_listado, 
					_titularid, 
					_empresaid, 
					_anio_periodo, 
					_mes_periodo, 
					_descripcion, 
					_tipo_factura, 
					_estado, 
					_importe, 
					_iva, 
					_cusuario, 
					_fultman, 
					_aplica_factura, 
					_fecha_venc, 
					null, 
					null, 
					null, 
					null);
	
					
			RETURN;
	
END;
$BODY$;
ALTER PROCEDURE contable.sp_insertfacturabdd(integer, integer, character varying, integer, character varying, timestamp without time zone, timestamp without time zone, integer, integer, integer, integer, character varying, character varying, character varying, numeric, numeric, character varying, timestamp without time zone, integer, timestamp without time zone)
    OWNER TO postgres;

-- PROCEDURE: contable.sp_getleyendacontratofactura(integer, numeric, numeric, integer, integer)

-- DROP PROCEDURE IF EXISTS contable.sp_getleyendacontratofactura(integer, numeric, numeric, integer, integer);

CREATE OR REPLACE PROCEDURE contable.sp_getleyendacontratofactura(
	IN _institut integer,
	IN _titular numeric,
	IN _empresa numeric,
	IN _periodo_anio integer,
	IN _periodo_mes integer,
	OUT _leyenda character varying)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
   curDataContrato cursor for 
	select c.claseID,c.descripcion,s.precio, t.valor_cuota, t.descuento, t.fin_descuento as fdescuento
		from afiliados.clases c,
		afiliados.contrato_para_facturar_afiliados f, 
		afiliados.precio_de_planes_para_empresas s, 
		afiliados.titulares t 
		where f.claseID = c.claseID 
		and f.claseID = s.claseID
		and s.empresaid= t.empresaid
		and f.titularID = t.titularID
		and f.institucionID = c.institucionID
		and f.institucionID = s.institucionID
		and f.institucionID = t.institucionID
		and c.institucionID= _institut
		and f.titularID = _titular
		and s.planID = t.planID
		order by c.claseID ;
		
   recDataContrato record; 
   pStrFDescuento date;
   pleyenda_contrato varchar;
   pStrLeyenda varchar;
   pcurContrato numeric;
   pcurSuma numeric;
   pValorCuota  numeric;
   pSngDescuento  numeric;	
   pStrMsgFDescuento varchar;
BEGIN

  
             /* cambio 02/2019 */
             If _empresa = 1 Or _empresa  = 10 Then
                   pStrLeyenda :=  chr(10) || ' CUOTA MENSUAL ';
             Else
                   pStrLeyenda :=  chr(10) || ' CUOTA MENSUAL ADICIONAL ';
             End If;
		
           
			/* cursor que obtiene datos del contrato del afiliado */
			
			 pcurContrato := 0;
			 open  curDataContrato;
    		 FETCH NEXT FROM curDataContrato into recDataContrato;
			 WHILE FOUND
			  LOOP
			  

				  pcurSuma :=  recDataContrato.precio;
				  pcurContrato := pcurContrato + pcurSuma;
				  pValorCuota := recDataContrato.valor_cuota;
				  pSngDescuento := recDataContrato.descuento;
				  
				  If recDataContrato.fdescuento is not null Then
					pStrFDescuento := recDataContrato.fdescuento;
				  Else
					pStrFDescuento = null;
				  End If;
			     
			      FETCH NEXT FROM curDataContrato into recDataContrato;
  			  END LOOP;
   			  CLOSE curDataContrato;

			  pStrMsgFDescuento := '';
raise notice 'entre 1 %  % %' , pStrFDescuento ,pcurContrato , pValorCuota;
			 If pcurContrato > pValorCuota Then

				  If  length(cast(pStrFDescuento as text)) > 0 And pStrFDescuento <> '31/12/2099' Then
						 If pStrFDescuento >  now() Then
							pStrMsgFDescuento := ' que vence el ' || pStrFDescuento;
						 End If;
				  End If;

				   pleyenda_contrato = ' VALOR PLAN = ' || pcurContrato || chr(10) ;
				   pleyenda_contrato = pleyenda_contrato || ' Cuota c/bonificación ';
				   IF pSngDescuento>0 then
				     pleyenda_contrato = pleyenda_contrato || ' de ' || pSngDescuento ||  '%';
                   end if;
				   pleyenda_contrato = pleyenda_contrato || pStrMsgFDescuento || ' = ' || pValorCuota;

		   Else
				   pleyenda_contrato = ' VALOR PLAN = ' || coalesce(pValorCuota,0)  || chr(10);
		   End If;
				 

		   _leyenda := pleyenda_contrato || chr(10) ||
						pStrLeyenda || ' ' || _periodo_mes  || '/' ||  _periodo_anio || chr(10);

	  raise notice ' _leyenda % , titular   % ',_leyenda, _titular;   
     

	
    RETURN;
END;
$BODY$;
ALTER PROCEDURE contable.sp_getleyendacontratofactura(integer, numeric, numeric, integer, integer)
    OWNER TO postgres;


CREATE OR REPLACE PROCEDURE contable.sp_getaportesparafacturar(
	IN _institut integer,
	IN _titular numeric,
	IN _valorcuota numeric,
	IN _periodo_anio integer,
	IN _periodo_mes integer,
	IN _con_aportes boolean,
	IN _act_aportes boolean,
	OUT aporte_es_estimado character varying,
	OUT aporte_tiene_aportes boolean,
	OUT aporte_detalle character varying,
	OUT aporte_total_aportes numeric,
	OUT aporte_importe_neto numeric,
	OUT aporte_saldo_anterior numeric)
LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
   curDataTitu refcursor;
   recData record;

     
   curDataAportes cursor for
            select  factura_anio * 100 + factura_mes as PeriodoFact,
            periodo_anio * 100 + periodo_mes as PeriodoApo,
            observacion, 
            aporte 
            from  afiliados.aportes_de_afiliados 
            where titularid= _titular
            and institucionid =_institut
            and facturado= 'N'
            and factura_anio *100 + factura_mes <=  _periodo_anio * 100 + _periodo_mes
            order by factura_anio * 100 + factura_mes;
   recDataAportes record; 	
   curDataSinAportes cursor for
            select  facturado, aporte 
            from  afiliados.aportes_de_afiliados 
            where titularid= _titular
            and institucionid =_institut
            and factura_anio *100 + factura_mes =  _periodo_anio * 100 + _periodo_mes;

   recDataSinAportes record; 	   
   pStr varchar;
   pStr2 varchar;   
   pStrDescrip varchar;
   pStrMsgFDescuento varchar;
   pCant  numeric;
   pPeriodoFactAnt numeric;
   pAporteMensual numeric;
 
   TotFac integer=0;
   pPeriodoAporAnt integer=0;
   pAportes  numeric=0;
   pObserva  varchar='';

   pSaldoAnterior  numeric=0;
   descrip  varchar;
   cuota numeric=0;
   mConstMINIMO_FACTURABLE numeric=40;

   
   
					
BEGIN

	/*************************
	' ****  PROCESO APORTES
	' *************************/
    if _con_aportes then    -- entra al if  si se tildo con aportes

					pCant = 0;
					pPeriodoFactAnt = 0;
					pAporteMensual = 0;
					aporte_es_estimado = '';
					aporte_tiene_aportes = false;
					aporte_detalle = '';

					OPEN curDataAportes;
					FETCH NEXT FROM curDataAportes into recDataAportes;
			 		WHILE FOUND
			  			LOOP
			
						-- esto puede ser una fumada, pero como estaba la dejo
						-- verifica aportes YA facturados
						select count(*)  into TotFac
						from  afiliados.aportes_de_afiliados
						where titularid= _titular
						and institucionid = _institut
						and facturado = 'S'
						and factura_anio *100 + factura_mes = pPeriodoFactAnt ;

	 
                       -- verificar periodoo YA FACTURADO
					   If recDataAportes.PeriodoFact > pPeriodoFactAnt And pPeriodoFactAnt > 0 And TotFac = 0  Then
              
							  If pAporteMensual > 0 And pAporteMensual < _valorCuota Then
								aporte_detalle = aporte_detalle || _valorCuota || ' menos Aporte ' || Left(cast(pPeriodoAporAnt as varchar), 4) || '/' ||  substring(Cast(pPeriodoAporAnt as varchar), 5, 2) || ' '   || pAporteMensual || ' = ' || _valorCuota - pAporteMensual || ' ' || pObserva || chr(10);
							  End If;

							  pAporteMensual = 0;
							  pCant = pCant + 1;

					  End If;

					  aporte_tiene_aportes = true;
					  pPeriodoFactAnt = recDataAportes.PeriodoFact;
					  pPeriodoAporAnt = recDataAportes.PeriodoApo;

					  pAporteMensual = pAporteMensual + recDataAportes.aporte;
					  pAportes = pAportes + recDataAportes.aporte;
					  pObserva = trim(recDataAportes.observacion);

					  If pObserva = 'APORTE ESTIMADO' Then
						aporte_es_estimado = 'S';
					  End If;
              

				  	FETCH NEXT FROM curDataAportes into recDataAportes;
	 			  END LOOP;
				  CLOSE curDataAportes;

				  aporte_detalle = aporte_detalle || _valorcuota || ' menos Aporte ' || Left(cast(pPeriodoAporAnt as varchar), 4) || '/' || substring(cast(pPeriodoAporAnt as varchar), 5, 2)  || ' ' ||  pAporteMensual  || ' = ' ||  _valorcuota - pAporteMensual || ' ' ||  Trim(pObserva) || chr(10);
				
				  aporte_total_aportes = pAporteMensual;

				  pCant = pCant + 1;
				  
				
				  aporte_importe_neto = _valorcuota * pCant;
				  aporte_importe_neto = aporte_importe_neto - pAportes;
			
       
			  
			  else      -- pasa x el else si se tildo Sin aportes
	
					aporte_importe_neto = _valorCuota;
					aporte_Saldo_anterior = 0;
					aporte_total_aportes = 0;
					pCant = 0;
					pPeriodoFactAnt = 0;
					pAporteMensual = 0;
					aporte_es_estimado = '';
			
					OPEN curDataSinAportes;
					FETCH NEXT FROM curDataSinAportes into recDataSinAportes;
			 		WHILE FOUND
			  			LOOP

						If recDataSinAportes.facturado = 'S' Then
						  aporte_importe_neto = 0;
						  aporte_Saldo_anterior = 0;
						  aporte_total_aportes = 0;
						ElseIf recDataSinAportes.aporte = 0 Then
						  aporte_importe_neto = _valorCuota;
						  aporte_Saldo_anterior = 0;
						  aporte_total_aportes = 0;
						Else
						  aporte_importe_neto = 0;
						--  exit;
						End If;

				  		FETCH NEXT FROM curDataSinAportes into recDataSinAportes;
				  END LOOP;
				  CLOSE curDataSinAportes;
			  
			  
  end if; --fin bloque proceso aportes 
   -- 13/04/2018 Condicion para NO facturar -> Si se eligio la opcion "ConAportes" -> y si no llegaron aportes o sea pvar(aporte.tiene_aportes)=false
  If pAportes = 0 And _con_aportes = true And aporte_tiene_aportes = false Then
			aporte_importe_neto = 0;
			aporte_detalle = '';
			aporte_Saldo_anterior = 0;
			aporte_total_aportes = 0;

	  else

		 -- obtengo saldo anterior pendiente del asosciado

		select  saldo into pSaldoAnterior from  afiliados.ctacte_apo
		where titularid= _titular
		and institucionid =_institut
		order by factura_anio *100 +  factura_mes desc
		limit 1;

		 --definicion nueva (jose 02/08/2015), si no tiene aportes para el periodo
		 -- y se chequea el option de "SinAportes" no se tiene en cuenta el saldo anterior
		 If pAportes = 0 And _con_aportes = false Then
			pSaldoAnterior = 0;
		 End If;

		 -- mayor a 0 quiere decir que tiene saldo a favor y lo guardo par el mes que viene + saldo anterior.
		 If pSaldoAnterior > 0 Then
			aporte_detalle = aporte_etalle || aporte_importe_neto || ' menos saldo anterior de aportes' || ' ' || pSaldoAnterior || ' = ' || aporte_importe_neto - pSaldoAnterior || ' ' || chr(10);
			--cotejo  el saldo de periodos anteriores
			aporte_importe_neto = aporte_importe_neto - pSaldoAnterior;
			aporte_Saldo_anterior = pSaldoAnterior;
		 Elseif pSaldoAnterior < 0 Then  -- saldo < 0 quiere decir que tiene saldo en contra a facturar e.g. mes anterior importe < a minimo no facturable
			aporte_detalle = aporte_detalle || aporte_importe_neto || ' mas saldo anterior de aportes' || ' ' || pSaldoAnterior * -1 ||  ' = ' || aporte_importe_neto - pSaldoAnterior || ' ' || chr(10);
			--cotejo  el saldo de periodos anteriores
			aporte_importe_neto =aporte_importe_neto + pSaldoAnterior * -1;
			aporte_Saldo_anterior = pSaldoAnterior;
		 End If;

	end if;		

	If aporte_importe_neto > 0 Then

		descrip = descrip || ' ' || chr(10) || aporte_detalle;
		cuota = aporte_importe_neto;

		 If cuota < 0 Then
			cuota = 0;
		 End If;

	Else
	  /* si el importe = 0 y Me.optSinAportes es true , me fuiiiiiiiiiii
		 por aporte = 0 no se factura*/
	  If _con_aportes =false Then
	   --exit;
	  End If;

	  If _act_aportes And aporte_es_estimado = 'S' Then
		update afiliados.aportes_de_afiliados
		set facturado='S'
		Where titularID =_titular
		and institucionid =  _institut
		and facturado= 'N'
		and factura_anio*100+factura_mes <=_periodo_anio * 100 + _periodo_mes;

	  End If;
	End If;

	 If cuota > 0 And cuota < mConstMINIMO_FACTURABLE Or aporte_importe_neto < 0 Then

				If _act_aportes Then
					If aporte_es_estimado <> 'S' Or (aporte_es_estimado = 'S' And cuota > 0) Then
						delete from afiliados.ctacte_apo
						where institucionid = _institut
						and titularid = _titular
						and factura_anio = _periodo_anio
						and factura_mes = _periodo_mes;

						insert into ctacte_apo(
						institucionID,
						titularid,
						factura_anio,
						factura_mes,
						valor_cuota,
						aporte ,
						saldo,
						facturado_por,
						fultman,
						cusuario ) values (
						 vInstitut,
						 vTitular,
						 vAnio_fact,
						 vMes_fact,
						 vValorCuota,
						 vAporte,
						 vSaldo,
						 vValorFactura,
						 now(),
						_usuario);

					End If;
				 End If;

   End If;
   -- esta linea se comenta 05/06/2017, aunque el aporte sea = 0 se factura igual
   If aporte_tiene_aportes = False And _con_aportes Then
		--exit; 
   End If;

    RETURN;
END;
$BODY$;




CREATE OR REPLACE FUNCTION fu_numero_letras(numero numeric) RETURNS text AS
$body$
DECLARE
     lnEntero INTEGER;
     lcRetorno TEXT;
     lnTerna INTEGER;
     lcMiles TEXT;
     lcCadena TEXT;
     lnUnidades INTEGER;
     lnDecenas INTEGER;
     lnCentenas INTEGER;
     lnFraccion INTEGER;
     lnSw INTEGER;
BEGIN
     lnEntero := FLOOR(numero)::INTEGER;--Obtenemos la parte Entera
     lnFraccion := FLOOR(((numero - lnEntero) * 100))::INTEGER;--Obtenemos la Fraccion del Monto
     lcRetorno := '';
     lnTerna := 1;
     IF lnEntero > 0 THEN

     lnSw := LENGTH(lnEntero::varchar);
     WHILE lnTerna <= lnSw LOOP
        -- Recorro terna por terna
        lcCadena = '';
        lnUnidades = lnEntero % 10;
        lnEntero = CAST(lnEntero/10 AS INTEGER);
        lnDecenas = lnEntero % 10;
        lnEntero = CAST(lnEntero/10 AS INTEGER);
        lnCentenas = lnEntero % 10;
        lnEntero = CAST(lnEntero/10 AS INTEGER);
    -- Analizo las unidades
       SELECT
         CASE /* UNIDADES */
           WHEN lnUnidades = 1 AND lnTerna = 1 THEN 'UNO ' || lcCadena
           WHEN lnUnidades = 1 AND lnTerna <> 1 THEN 'UN ' || lcCadena
           WHEN lnUnidades = 2 THEN 'DOS ' || lcCadena
           WHEN lnUnidades = 3 THEN 'TRES ' || lcCadena
           WHEN lnUnidades = 4 THEN 'CUATRO ' || lcCadena
           WHEN lnUnidades = 5 THEN 'CINCO ' || lcCadena
           WHEN lnUnidades = 6 THEN 'SEIS ' || lcCadena
           WHEN lnUnidades = 7 THEN 'SIETE ' || lcCadena
           WHEN lnUnidades = 8 THEN 'OCHO ' || lcCadena
           WHEN lnUnidades = 9 THEN 'NUEVE ' || lcCadena
           ELSE lcCadena
          END INTO lcCadena;
          /* UNIDADES */
    -- Analizo las decenas
    SELECT
    CASE /* DECENAS */
      WHEN lnDecenas = 1 THEN
        CASE lnUnidades
          WHEN 0 THEN 'DIEZ '
          WHEN 1 THEN 'ONCE '
          WHEN 2 THEN 'DOCE '
          WHEN 3 THEN 'TRECE '
          WHEN 4 THEN 'CATORCE '
          WHEN 5 THEN 'QUINCE '
          ELSE 'DIECI' || lcCadena
        END
      WHEN lnDecenas = 2 AND lnUnidades = 0 THEN 'VEINTE ' || lcCadena
      WHEN lnDecenas = 2 AND lnUnidades <> 0 THEN 'VEINTI' || lcCadena
      WHEN lnDecenas = 3 AND lnUnidades = 0 THEN 'TREINTA ' || lcCadena
      WHEN lnDecenas = 3 AND lnUnidades <> 0 THEN 'TREINTA Y ' || lcCadena
      WHEN lnDecenas = 4 AND lnUnidades = 0 THEN 'CUARENTA ' || lcCadena
      WHEN lnDecenas = 4 AND lnUnidades <> 0 THEN 'CUARENTA Y ' || lcCadena
      WHEN lnDecenas = 5 AND lnUnidades = 0 THEN 'CINCUENTA ' || lcCadena
      WHEN lnDecenas = 5 AND lnUnidades <> 0 THEN 'CINCUENTA Y ' || lcCadena
      WHEN lnDecenas = 6 AND lnUnidades = 0 THEN 'SESENTA ' || lcCadena
      WHEN lnDecenas = 6 AND lnUnidades <> 0 THEN 'SESENTA Y ' || lcCadena
      WHEN lnDecenas = 7 AND lnUnidades = 0 THEN 'SETENTA ' || lcCadena
      WHEN lnDecenas = 7 AND lnUnidades <> 0 THEN 'SETENTA Y ' || lcCadena
      WHEN lnDecenas = 8 AND lnUnidades = 0 THEN 'OCHENTA ' || lcCadena
      WHEN lnDecenas = 8 AND lnUnidades <> 0 THEN 'OCHENTA Y ' || lcCadena
      WHEN lnDecenas = 9 AND lnUnidades = 0 THEN 'NOVENTA ' || lcCadena
      WHEN lnDecenas = 9 AND lnUnidades <> 0 THEN 'NOVENTA Y ' || lcCadena
      ELSE lcCadena
    END INTO lcCadena; /* DECENAS */
    -- Analizo las centenas
    SELECT
    CASE /* CENTENAS */
      WHEN lnCentenas = 1 AND lnUnidades = 0 AND lnDecenas = 0 THEN 'CIEN ' || lcCadena
      WHEN lnCentenas = 1 AND NOT(lnUnidades = 0 AND lnDecenas = 0) THEN 'CIENTO ' || lcCadena
      WHEN lnCentenas = 2 THEN 'DOSCIENTOS ' || lcCadena
      WHEN lnCentenas = 3 THEN 'TRESCIENTOS ' || lcCadena
      WHEN lnCentenas = 4 THEN 'CUATROCIENTOS ' || lcCadena
      WHEN lnCentenas = 5 THEN 'QUINIENTOS ' || lcCadena
      WHEN lnCentenas = 6 THEN 'SEISCIENTOS ' || lcCadena
      WHEN lnCentenas = 7 THEN 'SETECIENTOS ' || lcCadena
      WHEN lnCentenas = 8 THEN 'OCHOCIENTOS ' || lcCadena
      WHEN lnCentenas = 9 THEN 'NOVECIENTOS ' || lcCadena
      ELSE lcCadena
    END INTO lcCadena;/* CENTENAS */
    -- Analizo la terna
    SELECT
    CASE /* TERNA */
      WHEN lnTerna = 1 THEN lcCadena
      WHEN lnTerna = 2 AND (lnUnidades + lnDecenas + lnCentenas <> 0) THEN lcCadena || ' MIL '
      WHEN lnTerna = 3 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND
        lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0 THEN lcCadena || ' MILLON '
      WHEN lnTerna = 3 AND (lnUnidades + lnDecenas + lnCentenas <> 0) AND
        NOT (lnUnidades = 1 AND lnDecenas = 0 AND lnCentenas = 0) THEN lcCadena || ' MILLONES '
      WHEN lnTerna = 4 AND (lnUnidades + lnDecenas + lnCentenas <> 0) THEN lcCadena || ' MIL MILLONES '
      ELSE ''
    END INTO lcCadena;/* TERNA */

    --Retornamos los Valores Obtenidos
    lcRetorno = lcCadena  || lcRetorno;
    lnTerna = lnTerna + 1;
    END LOOP;
  END IF;
  IF lnTerna = 1 THEN
    lcRetorno := 'CERO';
  END IF;
  lcRetorno := RTRIM(lcRetorno) || ' CON ' || LTRIM(lnFraccion::varchar) || ' CENTAVOS';
RETURN lcRetorno;
END;
$body$
LANGUAGE 'plpgsql' VOLATILE CALLED ON NULL INPUT SECURITY INVOKER;

-- View: contable.v_facturas_impresion

-- DROP VIEW contable.v_facturas_impresion;

-- View: contable.v_facturas_impresion

-- DROP VIEW contable.v_facturas_impresion;
-- View: contable.v_facturas_impresion

-- DROP VIEW contable.v_facturas_impresion;

CREATE OR REPLACE VIEW contable.v_facturas_impresion
 AS
 SELECT f.institucionid,
    f.tipo_documento,
    f.fecha_listado,
    f.titularid,
    f.empresaid,
        CASE
            WHEN length(TRIM(BOTH FROM t.deriva_facturacion)) > 1 AND f.titularid > 0 THEN ( SELECT (((((((((((((((d.codigoid::text || '|'::text) || d.cuit::text) || '|'::text) || d.empresa::text) || '|'::text) || d.domicilio_fact::text) || '|'::text) || d.cod_postal_fact) || '|'::text) || d.localidad_fact::text) || '|'::text) || d.telefono_fact::text) || '|'::text) || t_1.tipo_iva::text) || '|'::text) || t_1.cobradorid::text
               FROM afiliados.titulares t_1,
                afiliados.facturacion_derivada d
              WHERE t_1.titularid = f.titularid AND t_1.institucionid = f.institucionid AND t_1.deriva_facturacion::text = d.codigoid::text AND t_1.institucionid = d.institucionid)
            WHEN f.titularid > 0 THEN (((((((((((((((((a.titularid || '|'::text) || a.cuil::text) || '|'::text) || a.apellido::text) || ' '::text) || a.nombre::text) || '|'::text) || t.domicilio_fact::text) || '|'::text) || t.cod_postal_fact) || '|'::text) || t.localidad_fact::text) || '|'::text) || t.telefono_fact::text) || '|'::text) || t.tipo_iva::text) || '|'::text) || t.cobradorid::text
            WHEN f.empresaid > 0 THEN ( SELECT (((((((((((((((e.empresaid || '|'::text) || e.cuit::text) || '|'::text) || e.razon_social::text) || '|'::text) || e.domicilio::text) || '|'::text) || e.codigopostal) || '|'::text) || e.localidadid::text) || '|'::text) || e.telefono1::text) || '|'::text) || t.tipo_iva::text) || '|'::text) || t.cobradorid::text
               FROM afiliados.empresas e
              WHERE t.empresaid = f.empresaid AND t.institucionid = f.institucionid)
            ELSE NULL::text
        END AS cabecera_fact,
    f.descripcion,
    f.mes_periodo,
    f.anio_periodo,
    f.letra,
    f.centro_emisor,
    f.numero,
    f.importe,
    f.iva,
    f.tipo_factura,
    f.cae,
    COALESCE(f.fvenccae::timestamp with time zone, f.fvenccae::timestamp with time zone, now()) AS fvenccae,
    f.sbase64qr,
    fu_numero_letras(f.importe) AS num_a_letras,
    fn_encrypt_for_barcode((((('989'::text || lpad(t.titularid::character varying::text, 11, '0'::text)) || lpad(f.numero::character varying::text, 6, '0'::text)) || lpad((f.importe * 100::numeric)::integer::character varying::text, 8, '0'::text)) ||
        CASE
            WHEN f.fecha_venc IS NULL THEN '365'::text || (EXTRACT(year FROM now()) - 2000::numeric)::integer::character varying::text
            ELSE date_part('day'::text, f.fecha_venc - ((EXTRACT(year FROM f.fecha_venc)::character varying::text || '-01-01'::text)::date)::timestamp without time zone)::character varying::text || (((EXTRACT(year FROM f.fecha_venc)::integer - 2000)::character varying)::text)
        END)::character varying) AS cod_barras,
    n.ndesden,
    n.nhastan,
    n.fimpr,
        CASE
            WHEN f.titularid > 0 THEN ( SELECT string_agg((((a2.codfamid::character varying::text || ' '::text) || a2.apellido::text) || ' '::text) || a2.nombre::text, ','::text) AS string_agg
               FROM afiliados.afiliados a2
              WHERE f.institucionid = a2.institucionid AND f.titularid = a2.titularid AND a2.fecha_baja IS NULL)
            ELSE NULL::text
        END AS grupfam
   FROM contable.facturas f
     LEFT JOIN afiliados.titulares t ON f.institucionid = t.institucionid AND f.titularid = t.titularid
     LEFT JOIN afiliados.afiliados a ON f.institucionid = a.institucionid AND f.titularid = a.titularid AND a.codfamid = 0
     LEFT JOIN contable.imprentafactnumeracion n ON f.institucionid = n.institucionid AND f.numero::numeric >= n.ndesden::numeric AND f.numero::numeric <= n.nhastan::numeric
  WHERE f.estado::text <> 'A'::text
  GROUP BY f.institucionid, f.tipo_documento, f.fecha_listado, f.titularid, f.empresaid, (
        CASE
            WHEN length(TRIM(BOTH FROM t.deriva_facturacion)) > 1 AND f.titularid > 0 THEN ( SELECT (((((((((((((((d.codigoid::text || '|'::text) || d.cuit::text) || '|'::text) || d.empresa::text) || '|'::text) || d.domicilio_fact::text) || '|'::text) || d.cod_postal_fact) || '|'::text) || d.localidad_fact::text) || '|'::text) || d.telefono_fact::text) || '|'::text) || t_1.tipo_iva::text) || '|'::text) || t_1.cobradorid::text
               FROM afiliados.titulares t_1,
                afiliados.facturacion_derivada d
              WHERE t_1.titularid = f.titularid AND t_1.institucionid = f.institucionid AND t_1.deriva_facturacion::text = d.codigoid::text AND t_1.institucionid = d.institucionid)
            WHEN f.titularid > 0 THEN (((((((((((((((((a.titularid || '|'::text) || a.cuil::text) || '|'::text) || a.apellido::text) || ' '::text) || a.nombre::text) || '|'::text) || t.domicilio_fact::text) || '|'::text) || t.cod_postal_fact) || '|'::text) || t.localidad_fact::text) || '|'::text) || t.telefono_fact::text) || '|'::text) || t.tipo_iva::text) || '|'::text) || t.cobradorid::text
            WHEN f.empresaid > 0 THEN ( SELECT (((((((((((((((e.empresaid || '|'::text) || e.cuit::text) || '|'::text) || e.razon_social::text) || '|'::text) || e.domicilio::text) || '|'::text) || e.codigopostal) || '|'::text) || e.localidadid::text) || '|'::text) || e.telefono1::text) || '|'::text) || t.tipo_iva::text) || '|'::text) || t.cobradorid::text
               FROM afiliados.empresas e
              WHERE t.empresaid = f.empresaid AND t.institucionid = f.institucionid)
            ELSE NULL::text
        END), f.descripcion, f.mes_periodo, f.anio_periodo, f.letra, f.centro_emisor, f.numero, f.importe, f.iva, f.tipo_factura, f.cae, f.fvenccae, f.sbase64qr, (fu_numero_letras(f.importe)), (((('989'::text || lpad(t.titularid::character varying::text, 11, '0'::text)) || lpad(f.numero::character varying::text, 6, '0'::text)) || lpad((f.importe * 100::numeric)::integer::character varying::text, 8, '0'::text)) ||
        CASE
            WHEN f.fecha_venc IS NULL THEN '365'::text || (EXTRACT(year FROM now()) - 2000::numeric)::integer::character varying::text
            ELSE date_part('day'::text, f.fecha_venc - ((EXTRACT(year FROM f.fecha_venc)::character varying::text || '-01-01'::text)::date)::timestamp without time zone)::character varying::text || (((EXTRACT(year FROM f.fecha_venc)::integer - 2000)::character varying)::text)
        END), n.ndesden, n.nhastan, n.fimpr
  ORDER BY f.numero DESC;





ALTER TABLE contable.v_facturas_impresion
    OWNER TO postgres;

-- FUNCTION: public.fn_encrypt_for_barcode(character varying)

-- DROP FUNCTION IF EXISTS public.fn_encrypt_for_barcode(character varying);

CREATE OR REPLACE FUNCTION public.fn_encrypt_for_barcode(
	vparam_fact character varying)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE
    	 
	 parrDig INTEGER Array  = '{1,3,5,7,9,3,5,7,9,3,5,7,9,3,5,7,9,3,5,7,9,3,5,7,9,3,5,7,9,3,5,7,9,3}';
	 XCodBarra VARCHAR= vParam_fact;
  
     pintResto INTEGER = 0;
     pintDigi INTEGER = 0;
     pintTotveo INTEGER = 0;
	 pintJJ INTEGER = 1;
	 nLen INTEGER = 0;
	 i INTEGER = 1;
	 cBarraAux VARCHAR;
	 cAux VARCHAR ='';
	 dummy INTEGER=0;
	 getCodBarra VARCHAR;
	  
BEGIN

  
      WHILE pintJJ<=length(XCodBarra)
	    LOOP 

          pintTotveo = pintTotveo + CAST (substring(XCodBarra,pintJJ,1) AS INTEGER) * parrDig[pintJJ];
		  pintJJ = pintJJ + 1;
		  
		 END LOOP;  
      

      pintDigi = right(cast(pintTotveo / 2 as VARCHAR), 1);
	  

      XCodBarra = XCodBarra || cast(pintDigi as varchar);
  
      nLen = length(XCodBarra );
  
      if (mod(nLen,2)!=0) THEN
          cBarraAux = '0' || XCodBarra ;
      else
          cBarraAux = XCodBarra ;
	  end if;	 
	  
     
  

      
	  WHILE i <= length(XCodBarra)
	    LOOP 
		
              dummy = substring(cBarraAux, i, 2);
			  
			   if dummy::integer  <= 49 then
			         dummy = dummy + 48;
               else 
  				   dummy = dummy + 142 ; 
                end if;
			

             	 cAux = cAux || chr(dummy);
		
		      i = i + 2;	  
  
          END LOOP;
		  
        getCodBarra = chr(40) || cAux || chr(41);
  
      
  
      return  getCodBarra ;
	  
	
END;
$BODY$;

ALTER FUNCTION public.fn_encrypt_for_barcode(character varying)
    OWNER TO postgres;

create table contable.auxPedidoCae (
		institucionid smallint, 
	    tipo_documento varchar(1) not null, 
	    letra varchar(1)  not null, 
	    centro_emisor smallint not null, 
	     numero numeric not null,
  constraint auxPedidoCae_pkey  primary key (institucionid ,  tipo_documento,   letra, centro_emisor,   numero )
)


CREATE OR REPLACE PROCEDURE contable.sp_createPedidoCae(
	IN _institut integer,
	IN v_data json)
LANGUAGE 'plpgsql'
AS $BODY$
BEGIN

    delete from contable.auxPedidoCae;

    INSERT INTO contable.auxPedidoCae (
		institucionid, tipo_documento, letra, centro_emisor, numero)	
		
	select  _institut, * from json_to_recordset(v_data::json->'pedidocae') as
	 foo(tipo_documento varchar, 
		 letra varchar,
		 centro_emisor integer,
		 numero numeric);

		
	RETURN;
END;
$BODY$;


CREATE OR REPLACE FUNCTION contable.BuscarDatosDelCliente(vInst integer, vTitularID integer, vEmpresaID integer, vLetraFac varchar)
    RETURNS  text
  language plpgsql
AS $$

declare
pCodDocumento varchar='';
codigo varchar='';
nombre varchar='';
tipoResp varchar;
pStrParam varchar;

begin
  
  
  
   --** busco  documento , o cuit nombre  del afiliado
  
  If vEmpresaID = 0 then
  
    If vLetraFac = 'A' Then
         pCodDocumento = '80'; -- cuit
         select t.cuit as codigo, left(a.empresa,30) as nombre, 'RESPONSABLE INSCRIPTO' as tipoResp into
		 codigo ,nombre,tipoResp 
		  from afiliados.facturacion_derivada  a, afiliados.titulares t
          where tipo_iva ='RESPONSABLE INSCRIPTO'
          and  t.deriva_facturacion = a.codigoid
          and  t.titularID =  vTitularID
          union all
          select a.cuil as codigo,     trim(t.apellido) || ' ' || trim(t.nombre) as nombre, 'MONOTRIBUTISTA'  as tipoResp from afiliados.afiliados  a, afiliados.titulares t
          where t.tipo_iva ='MONOTRIBUTISTA'
           and  t.titularID = a.titularID 
          and  a.codfamID = 0
          and  t.titularID =   vTitularID;
    Else


        pCodDocumento ='86'; -- cuil
        select
         case
         when a.fecha_baja is null then     a.cuil
         else (select  x.cuil from afiliados.afiliados x
         Where x.institucionid = t.institucionid
         and x.titularID = t.titularID
         and x.codfamid<>0
         and x.fecha_baja is null
         and length(trim(x.cuil))=11
         order by x.codfamid limit 1)
         end as codigo,
         trim(t.apellido) || ' ' || trim(t.nombre) as nombre,
         t.tipo_iva  as tipoResp  into  codigo ,nombre,tipoResp 
         from afiliados.titulares t, afiliados.afiliados a
         Where t.titularID =   vTitularID
         and t.titularID = a.titularID
         and t.institucionID =   vInst
         and t.institucionID = a.institucionId
         and a.codfamID = 0;


     End If;
     
  End If;
  
 --** busco  cuit razon social de empresa
 
  If vEmpresaID > 0 Then
  
  
	pCodDocumento ='80'; -- cuil
    
    select t.cuit as codigo, left(t.razon_social,30) as nombre, t.tipo_iva  as tipoResp  into
		 codigo ,nombre,tipoResp 
     from afiliados.empresas t
     where t.empresaID =  vEmpresaID
     and t.institucionID =   vInst;
    
  End If;
  


 pStrParam = 'Afil/Emp|En|Baja|';

 if codigo is not null then
	 pStrParam = pCodDocumento ||	codigo ||rpad(left(nombre,30), 30);
 end if;
 

 	
return pStrParam;

end;	  

$$
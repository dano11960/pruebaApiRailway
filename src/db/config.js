const PORT = process.env.PORT || 4000;

const DB_HOST = process.env.DB_HOST ||'localhost';
const DB_DATABASE = process.env.DB_DATABASE ||'prepaga';
const DB_USER = process.env.DB_USER ||'postgres';
const DB_PWD = process.env.DB_PWD ||'mundial06';
const DB_PORT = process.env.DB_PORT ||'5432';


const {Pool}= require('pg');

const pool = new Pool (
             {'host':DB_HOST, 
             'database':DB_DATABASE,
             'user':DB_USER,
             'password': DB_PWD,
             'port': DB_PORT,
             'institucionid':'1',
             'secret':'Abeftoprp_4',
             'JsonKey':'Abeftoprp_456'
            });

module.exports = {pool, PORT}
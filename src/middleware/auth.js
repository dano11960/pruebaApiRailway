const {pool}= require('../db/config');
const jwt = require("jsonwebtoken");




module.exports = (req, res, next) => {

const auth_token = req.header("x-auth-token");

    if (!auth_token)
        return res.status(401).send({
        status: "unauthorized",
        code: 401,
        error: "No auth token provided"
    });

    try {
        const JsonKey  = (pool['options']['JsonKey']);
        
        const decoded = jwt.verify(auth_token, JsonKey);
      
        req.user = decoded;

        console.log(decoded);
    } catch (error) {
        return res.status(401).send({
        status: "unauthorized",
        code: 401,
        error: "Token expired"
    });
    
}

next();
};
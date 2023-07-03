const msg = "Access denied";
const forbidden = "forbidden";
const s_code = 403;

function afiliados(req, res, next) {
    if (!req.user.roles.includes("afiliados"))
        return res.status(403).send({
            status: forbidden,
            code: s_code,
            error: msg
    });

    next();
}

function planes(req, res, next) {
   
    if (!req.user.roles.includes("planes"))
        return res.status(403).send({
            status: forbidden,
            code: s_code,
            error: msg
    });

    next();
}

function auditoria(req, res, next) {
    if (!req.user.roles.includes("auditoria"))
        return res.status(403).send({
            status: forbidden,
            code: s_code,
            error: msg
    });

    next();
}
function empleados(req, res, next) {
    if (!req.user.roles.includes("empleados"))
        return res.status(403).send({
            status: forbidden,
            code: s_code,
            error: msg
    });

    next();
}

// export router
module.exports = { empleados, afiliados, planes, auditoria };
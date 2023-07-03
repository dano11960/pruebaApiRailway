const express = require("express");
const auth = require("../middleware/auth");
const router = express.Router();
const {empleados } = require("../middleware/roles");
const { getEmpleados, loginEmpleado } = require('../controllers/empleados.controller');





router.get("/", [auth], getEmpleados);

// http://localhost:4000/empleados/login con body {'userid':'pochin@gprivamedsa,com','password';'sarasa'}

router.post("/login", loginEmpleado);




router.post("/", [auth, empleados], async (req, res) => {
    empleados.push({ id: empleados.length + 1, name: req.body.name });
    res.status(201).send({
        status: "created",
        code: 201
    });
});
  
// http delete - http://localhost:3005/api/empleados?key=1
router.delete("/", [auth, empleados], async (req, res) => {
    const idToRemove = req.query.key;
    empleados = empleados.filter(function (item) {
        return item.id != idToRemove;
    });
  
    res.status(202).send({
        status: "accepted",
        code: 202
    });
});
  
// Todo - implement put
  
// export router
module.exports = router;
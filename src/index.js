const express = require ('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const helmet = require('helmet');
const morgan = require('morgan');

const token = require("./routes/token");
const afiliados = require("./routes/afiliados");
const autorizaciones = require("./routes/autorizaciones");
const auditoria = require("./routes/auditoria");
const contable = require("./routes/contable");
const empleados = require("./routes/empleados");
const config = require("./db/config");

// defining the Express app
const app = express();
// adding Helmet to enhance your Rest API's security
app.use(helmet());
// using bodyParser to parse JSON bodies into JS objects
app.use(bodyParser.json());
// enabling CORS for all requests
app.use(cors());
// adding morgan to log HTTP requests
app.use(morgan('combined'));

app.use(cors());



// application routes
app.use("/token", token);
app.use("/afiliados", afiliados);
app.use("/empleados", empleados);
app.use("/autorizaciones", autorizaciones);
app.use("/auditoria", auditoria);
app.use("/contable", contable);
app.listen(config.PORT);
console.log('server en puerto ' + config.PORT);

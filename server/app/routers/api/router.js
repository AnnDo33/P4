const express = require("express");

const router = express.Router();

/* ************************************************************************* */
// Import And Use Routers Here
/* ************************************************************************* */

const itemsRouter = require("./items/router");

router.use("/items", itemsRouter);

const servicesActions = require("../../controllers/servicesActions");

router.get("/services", servicesActions.browse);

/* ************************************************************************* */

module.exports = router;

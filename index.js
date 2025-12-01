const express = require ('express');
const app = express();
app.use(express.json());

const userRoute =require('./routes/user.services')
app.use('/api',userRoute);

const productRoutes = require("./routes/products.services");
app.use("/api", productRoutes);

const orderRoutes = require("./routes/orders.services");
app.use("/api", orderRoutes);

const order_itemsRoutes = require("./routes/order_items.services");
app.use("/api", order_itemsRoutes);

const paymentsRoutes = require("./routes/payments.services");
app.use("/api", paymentsRoutes);

const shippingRoutes = require("./routes/shipping.services");
app.use("/api", shippingRoutes);

const suppliersRoutes = require("./routes/suppliers.services");
app.use("/api", suppliersRoutes);

const contact_usRoutes = require("./routes/contact_us.services");
app.use("/api", contact_usRoutes);

const product_suppliersRoutes = require("./routes/product_suppliers.services");
app.use("/api", product_suppliersRoutes);



const PORT = 8080
app.listen(PORT,
()=> console.log (`your server is up and run on http://localhost:${PORT}`)
);
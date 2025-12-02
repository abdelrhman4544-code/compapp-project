const express = require('express');
const cors = require('cors'); // Ensure you have installed this: npm install cors
const app = express();

// 1. ALLOW REACT TO TALK TO BACKEND
app.use(cors());
app.use(express.json());



// 4. START SERVER
app.listen(8080, () => {
    console.log('Backend is running on Port 8080');
    console.log('Register Route: http://localhost:8080/api/user');
    console.log('Login Route:    http://localhost:8080/api/login');
});
const userRoute =require('./routes/user.services')
app.use('/api',userRoute);

const productsRoutes = require("./routes/products.services");
app.use("/api", productsRoutes);

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

const cartRoutes = require("./routes/cart.services");
app.use("/api", cartRoutes);

const cart_itemsRoutes = require("./routes/cart_items.services");
app.use("/api", cart_itemsRoutes);




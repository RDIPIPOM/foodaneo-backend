import express from 'express';
import cors from 'cors'
import dishesRoutes from './routes/dishes'

const app = express();

app.use(cors({
    origin: 'http://localhost:8080'
}))

app.use(dishesRoutes)

export default app;
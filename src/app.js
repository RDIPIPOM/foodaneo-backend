import express from 'express';
import cors from 'cors'
import UsersRoutes from './routes/users'
import dishesRoutes from './routes/dishes'

const app = express();

app.use(cors({
    origin: 'http://localhost:8080'
}))

app.use(express.json())

app.use(UsersRoutes)
app.use(dishesRoutes)

export default app;
import { Router } from "express";
import { signup, signin } from "../controllers/users";

const router = Router();

router.post('/users/signup', signup)

router.get('/users/signin', signin)

export default router
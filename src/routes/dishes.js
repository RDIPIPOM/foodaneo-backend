import { Router } from "express";
import { getDishes } from "../controllers/dishes";

const router = Router();

router.get('/dishes', getDishes)

export default router
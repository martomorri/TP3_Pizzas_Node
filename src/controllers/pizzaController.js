import { Router } from "express";
import PizzaService from "../services/pizza-services.js";
const router = Router();
const pizzaService = new PizzaService();

router.get('', async (req, res) => {
    const pizzas = await PizzaService.getAll();
    return res.status(200).json(pizzas);
});

router.get('/:id', async (req, res) => {
    const pizza = await pizzaService.getById(req.params.id);
    return res.status(200).json(pizza);
});

router.post('', async (req, res) => {
    const pizza = await pizzaService.insert(req.body);
    return res.status(201).json(pizza);
});

router.put('', async (req, res) => {
    const pizza = await pizzaService.update(req.body);
    return res.status(202).json(pizza);
});

router.delete('/:id', async (req, res) => {
    const pizza = await pizzaService.deleteById(req.params.id);
    return res.status(200).json(pizza);
})

export default router;
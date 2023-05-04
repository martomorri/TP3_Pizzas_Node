import { Router } from "express";
import PizzaService from "../services/pizza-services.js";
const router = Router();
// const pizzaService = new PizzaService();

console.log(router);

router.get('', async (req, res) => {
    const pizzas = await PizzaService.getAll();
    // res.send("GetAll");
    return res.status(200).json(pizzas);
});

router.get('/:id', async (req, res) => {
    const pizza = await PizzaService.getById(req.params.id);
    return res.status(200).json(pizza);
});

router.post('', async (req, res) => {
    const pizza = await PizzaService.insert(req.body);
    return res.status(201).json(pizza);
});

router.put('', async (req, res) => {
    const pizza = await PizzaService.update(req.body);
    return res.status(202).json(pizza);
});

router.delete('/:id', async (req, res) => {
    const rowsAffected = await PizzaService.deleteById(req.params.id);
    // res.status(200).send("Rows affected:", rowsAffected)
    return res.status(200).json(rowsAffected);
})

export default router;
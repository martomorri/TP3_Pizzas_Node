import { Router } from "express";
import PizzaService from "../services/pizza-services.js";
const router = Router();
// const pizzaService = new PizzaService();

// console.log(router);

router.get('', async (req, res) => {
    const pizzas = await PizzaService.getAll();
    // res.send("GetAll");
    if (pizzas) {
        return res.status(200).json({"Pizzas":pizzas});
    } else {
        return res.status(500).send("Error del servidor");
    }
});

router.get('/:id', async (req, res) => {
    const pizza = await PizzaService.getById(req.params.id);
    if (pizza) {
        return res.status(200).json(pizza);
    } else {
        return res.status(404).send("La pizza no fue encontrada");
    }
});

router.post('', async (req, res) => {
    const pizza = await PizzaService.insert(req.body);
    if (pizza) {
        return res.status(201).json(pizza); 
    } else {
        return res.status(400).send("Ocurrio un error, la pizza no pudo ser insertada");
    }
});

router.put('', async (req, res) => {
    const pizza = await PizzaService.update(req.body);
    if (pizza) {
        return res.status(202).json(pizza);
    } else {
        return res.status(404).send("La pizza que se intento actualizar no existe");
    }
});

router.delete('/:id', async (req, res) => {
    const rowsAffected = await PizzaService.deleteById(req.params.id);
    // res.status(200).send("Rows affected:", rowsAffected)
    if (rowsAffected > 0) {
        return res.status(200).json(rowsAffected);
    } else if (rowsAffected == 0) {
        return res.status(404).send("La pizza que intento borrar no existe");
    }
    else {
        return res.status(500).send("Error del sistema");
    }
})

export default router;
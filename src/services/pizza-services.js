import config from "../../dbconfig.js";
import sql from 'mssql';

let pool = await sql.connect(config);

class PizzaService {
    static getAll = async () => {
        let result = await pool.request().query("SELECT * FROM Pizza");
        return result;
    }

    static getById = async id => {

    }

    static insert = async pizza => {

    }

    static update = async pizza => {

    }

    static deleteById = async id => {

    }
}

export default PizzaService;
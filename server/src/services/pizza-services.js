import config from "../../dbconfig.js";
import sql from 'mssql';

let pool = await sql.connect(config);

class PizzaService {
    static getAll = async () => {
        console.log("getAll()");
        let result = await pool.request().execute("ListarPizzas");
        // console.log(result);
        return result.recordsets[0];
    }

    static getById = async id => {
        let returnEntity = null;
        console.log("getById(id)");
        try {
            let result = await pool.request()
                                .input("Id", sql.Int, id)
                                .execute("ListarPizzaXID");
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }

    static insert = async pizza => {
        const { Nombre, LibreGluten, Importe, Descripcion } = pizza;
        console.log("Pizza:", Nombre);
        const request = new sql.Request(pool);
        request
        .input("nombre", sql.NVarChar(150), Nombre)
        .input("libreGluten", sql.Bit, LibreGluten)
        .input("importe", sql.Float, Importe)
        .input("descripcion", sql.NVarChar(200), Descripcion)
        .execute("CrearPizza");
        return pizza;
    }

    static update = async pizza => {
        const { Id, Nombre, LibreGluten, Importe, Descripcion } = pizza;
        console.log("Pizza a actualizar:", Id, Nombre);
        const request = new sql.Request(pool);
        request
        .input("id", sql.Int, Id)
        .input("nombre", sql.NVarChar(150), Nombre)
        .input("libreGluten", sql.Bit, LibreGluten)
        .input("importe", sql.Float, Importe)
        .input("descripcion", sql.NVarChar(200), Descripcion)
        .execute("ActualizarPizza");
        return pizza;
    }

    static deleteById = async id => {
        let rowsAffected = null;
        console.log("deleteById(id)");
        try {
            let result = await pool.request().input("Id", sql.Int, id).execute("EliminarPizza");
            console.log(result);
            rowsAffected = result.recordset;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
}

export default PizzaService;
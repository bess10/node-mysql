//aquí va la logica de nuestra aplicación
import {pool} from '../db_config.js';

export const selectPeople =  async(req, res) => {
    try{
        const [rows] = await pool.query("SELECT * FROM people");
        res.send(rows)
    }catch(err){
        res.status(500).send('Ha habido un error...\nintentelo màs tarde');
    }
};

export const getPerson = async (req, res) =>{
    //console.log(req.params.id);
    const [result] = await pool.query("SELECT * FROM people WHERE id_people = ?", [req.params.id]);
    if(result.length == 0) return res.send('persona no encontrada');
    res.json(result);
}

export const updatePerson = async (req, res) => {
    const {id} = req.params;
    const {nombre, apellido, profesion, genero, oscars, fecha_nacimiento} = req.body;
    try{
        const [result] = await pool.query("UPDATE people SET nombre = ?, apellido = ?, profesion = ?, genero = ?, oscars = ?, fecha_nacimiento = ?  WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id]);
        //res.send(result);
        if(result.affectedRows == 0) return res.send('no se ha podido actualizar');
        res.send('Registro actualizado');
        
    }catch(err){
        res.send('No se ha podido actualizar. Registro no encontrado');
    } 
}

export const insertPeople = async (req, res) => {
    // console.log(req.body);
    const {nombre, apellido, profesion, genero, oscars, fecha_nacimiento} = req.body;
    try {
        const [resultado] = await pool.query('INSERT INTO people(nombre, apellido, profesion, genero, oscars, fecha_nacimiento) VALUES (?, ?, ?, ?, ?, ?)', [nombre, apellido, profesion, genero, oscars, fecha_nacimiento])
        res.send('registro añadido');   
    } catch (err) {
        return res.status(404).send('Ha habido un error...\nintentelo màs tarde');
    }
    // res.send(req.body);
}
export const deletePeople = async (req, res) => {
    const {id} = req.params;
    try {
        const [result] = await pool.query("DELETE FROM people WHERE id_people = ?", [id]);
        if(result.affectedRows == 0) return res.send(`No se ha podido eliminar el registro ${id}`);
        res.send('se ha eliminado el registro');
    } catch (err) {
        return res.status(404).send('Ha habido un error...\nintentelo màs tarde');
    }
}

export const patchPeople = async (req, res) => {
    const {id} = req.params;
    const {nombre, apellido, profesion, genero, oscars, fecha_nacimiento} = req.body;
    try{
        const [result] = await pool.query("UPDATE people SET nombre = IFNULL(?, nombre), apellido = IFNULL(?, apellido), profesion = IFNULL(?, profesion), genero = IFNULL(?, genero), oscars = IFNULL(?, oscars), fecha_nacimiento = IFNULL(?, fecha_nacimiento)  WHERE id_people = ?", [nombre, apellido, profesion, genero, oscars, fecha_nacimiento, id]);
        //res.send(result);
        if(result.affectedRows == 0) return res.send('no se ha podido actualizar');
        res.send('Registro actualizado');
        
    }catch(err){
        res.send('No se ha podido actualizar. Registro no encontrado');
    } 
}
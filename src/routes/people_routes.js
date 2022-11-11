import {Router} from 'express';
import {deletePeople, getPerson, insertPeople, patchPeople, selectPeople, updatePerson} from '../controllers/people_controllers.js'


const router = Router();

//router.get("/test", getTest)

// Para mostrar
router.get("/api/people", selectPeople)

router.get("/api/people/:id", getPerson);

// Para modificar el registro entero
router.put("/api/people/:id", updatePerson);

// Para añadir
router.post("/api/people/", insertPeople);

// Para modificar un valor de un registro
router.patch("/api/people/:id", patchPeople)

// Para eliminar un registro
router.delete("/api/people/:id", deletePeople)



export default router;
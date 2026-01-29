import express from 'express';
const router = express.Router();
import employeeController from '../controllers/employeeController';

router.post('/create', employeeController.createEmployee);
router.get('/', employeeController.getAllEmployees);

module.exports = router;

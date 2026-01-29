const employeeService = require('../services/employeeService');

exports.createEmployee = async (req, res) => {
    try {
        const result = await employeeService.createEmployee(req.body);
        res.status(201).json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

exports.getAllEmployees = async (req, res) => {
    try {
        const data = await employeeService.getAllEmployees();
        res.json(data);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
};

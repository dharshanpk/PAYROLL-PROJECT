const employeeModel = require('../models/employeeModel');

exports.createEmployee = (data) => {
    // business logic goes here
    return employeeModel.createEmployee(data);
};

exports.getAllEmployees = () => {
    return employeeModel.getAllEmployees();
};


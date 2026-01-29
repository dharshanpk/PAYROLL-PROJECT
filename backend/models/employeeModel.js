const db = require('../config/db');

exports.createEmployee = (data) => {
    return new Promise((resolve, reject) => {
        const sql = `INSERT INTO employees SET ?`;
        db.query(sql, data, (err, result) => {
            if (err) reject(err);
            resolve(result);
        });
    });
};

exports.getAllEmployees = () => {
    return new Promise((resolve, reject) => {
        const sql = `SELECT * FROM employees`;
        db.query(sql, (err, results) => {
            if (err) reject(err);
            resolve(results);
        });
    });
};

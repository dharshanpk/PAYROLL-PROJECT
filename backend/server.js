import express from "express";

import employeeRoutes from './routes/employeeRoutes';
import departmentRoutes from './routes/employeeRoutes';
import clientRoutes from './routes/clientRoutes';
import attendanceRoutes from './routes/attendanceRoutes';
import payrollRoutes from './routes/payrollRoutes';


const app=express();
app.use(express.json());
app.use('/api/employees',employeeRoutes);
app.use('/api/departments',departmentRoutes);
app.use('/api/clients',clientRoutes);
app.use('/api/attendance',attendanceRoutes);
app.use('/api/payroll',payrollRoutes);

app.listen(5000, () => {
    console.log("Server running on port 5000");
});





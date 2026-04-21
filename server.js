// =============================================================
// server.js  – Entry point for the Express application
// =============================================================
require('dotenv').config();         // load .env variables first
const express      = require('express');
const cors         = require('cors');
const path         = require('path');
const errorHandler = require('./middleware/errorHandler');

// Route imports
const authRoutes     = require('./routes/authRoutes');
const employeeRoutes = require('./routes/employeeRoutes');
const managerRoutes  = require('./routes/managerRoutes');

const app  = express();
const PORT = process.env.PORT || 5000;

// =============================================================
// MIDDLEWARE
// =============================================================

// CORS – allow requests from the frontend origin
app.use(cors({
  origin: process.env.FRONTEND_URL || '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization'],
}));

// Parse JSON request bodies
app.use(express.json());

// Parse URL-encoded form data
app.use(express.urlencoded({ extended: true }));

// Serve static frontend files from the ../frontend folder
// So you can open http://localhost:5000 directly
app.use(express.static(path.join(__dirname, '..', 'frontend')));

// =============================================================
// API ROUTES
// =============================================================
app.use('/api/auth',     authRoutes);
app.use('/api/employee', employeeRoutes);
app.use('/api/manager',  managerRoutes);

// Health check endpoint
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'Employee Portal API is running 🚀' });
});

// Catch-all: serve frontend for any non-API route (SPA support)
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, '..', 'frontend', 'index.html'));
});

// =============================================================
// ERROR HANDLER (must be last!)
// =============================================================
app.use(errorHandler);

// =============================================================
// START SERVER
// =============================================================
app.listen(PORT, () => {
  console.log(`\n🚀  Server running at http://localhost:${PORT}`);
  console.log(`📁  Frontend served at  http://localhost:${PORT}`);
  console.log(`🔗  API base URL:        http://localhost:${PORT}/api\n`);
});

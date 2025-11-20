import dotenv from 'dotenv';
dotenv.config();

import app from './app.js';
import connectDB from './config/db.js';
import { connectToRedis } from './services/redis.js';
import { PORT } from './config/utils.js';

console.log('🚀 Starting server...');

let server: any;

// Add health check endpoint
app.get('/health', (req, res) => {
  res.status(200).json({ 
    status: 'OK', 
    message: 'Wanderlust backend is running',
    timestamp: new Date().toISOString(),
    service: 'backend'
  });
});

// Add root endpoint for basic check
app.get('/', (req, res) => {
  res.status(200).json({ 
    message: 'Wanderlust API Server',
    version: '1.0.0',
    timestamp: new Date().toISOString()
  });
});

async function startServer() {
  try {
    console.log('📡 Connecting to databases...');
    await connectToRedis();
    await connectDB();

    const port = PORT || 3000;

    server = app.listen(port, '0.0.0.0', () => {
      console.log(`✅ Server running on port ${port}`);
      console.log(`🔗 Backend URL: http://localhost:${port}`);
      console.log(`🌐 Network URL: http://0.0.0.0:${port}`);
      console.log(`❤️  Health check: http://localhost:${port}/health`);
    });

    return server;
  } catch (error) {
    console.error('❌ Failed to start server:', error);
    process.exit(1);
  }
}

// Graceful shutdown
process.on('SIGTERM', () => {
  console.log('🛑 SIGTERM received, shutting down gracefully');
  if (server) {
    server.close(() => {
      console.log('✅ Process terminated');
      process.exit(0);
    });
  }
});

process.on('SIGINT', () => {
  console.log('🛑 SIGINT received, shutting down gracefully');
  if (server) {
    server.close(() => {
      console.log('✅ Process terminated');
      process.exit(0);
    });
  }
});

startServer();

export default server;

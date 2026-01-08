module.exports = {
  apps: [
    {
      name: "wanderlust-backend",
      script: "./backend/dist/server.js",   // ✅ compiled JS entry point
      cwd: "/home/ubuntu/wanderlust",       // working directory on EC2
      instances: 1,
      autorestart: true,
      watch: false,
      env: {
        NODE_ENV: "production",
        PORT: 8080,
        // ✅ provide actual values or load from .env
        MONGO_URI: "mongodb+srv://<user>:<pass>@cluster/db",
        REDIS_URL: "redis://localhost:6379",
        JWT_SECRET: "your-secret-key",
        FRONTEND_URL: "http://yourdomain.com",
        BACKEND_URL: "http://yourdomain.com/api"
      }
    },
    {
      name: "wanderlust-frontend",
      script: "serve",
      args: "-s frontend/dist -l 3000",
      cwd: "/home/ubuntu/wanderlust",
      instances: 1,
      autorestart: true,
      watch: false,
      env: {
        NODE_ENV: "production"
      }
    }
  ]
};

module.exports = {
  apps: [
    {
      name: "wanderlust-backend",
      script: "./backend/server.js",   // entry point for backend
      cwd: "/home/ubuntu/wanderlust",  // working directory on EC2
      instances: 1,
      autorestart: true,
      watch: false,
      env: {
        NODE_ENV: "production",
        PORT: 8080,
        MONGO_URI: process.env.MONGO_URI,
        REDIS_URL: process.env.REDIS_URL,
        JWT_SECRET: process.env.JWT_SECRET,
        FRONTEND_URL: process.env.FRONTEND_URL,
        BACKEND_URL: process.env.BACKEND_URL
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

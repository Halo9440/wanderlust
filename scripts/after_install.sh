#!/bin/bash
set -e
cd /home/ubuntu/wanderlust

# Install root dependencies if needed
npm ci || true

# Backend dependencies
cd backend
npm ci
cd ..

# Frontend dependencies and build
cd frontend
npm ci
npm run build
cd ..

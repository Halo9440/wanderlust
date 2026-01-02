#!/bin/bash
set -e

# Check backend health
if curl -sSf http://127.0.0.1:8080/health > /dev/null; then
  echo "Backend healthy"
else
  echo "Backend health check failed"
  exit 1
fi

# Check frontend
if curl -sSf http://127.0.0.1:3000 > /dev/null; then
  echo "Frontend healthy"
else
  echo "Frontend health check failed"
  exit 1
fi

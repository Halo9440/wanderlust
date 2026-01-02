#!/bin/bash
set -e

cd /home/ubuntu/wanderlust

# Make sure all lifecycle scripts are executable
chmod +x scripts/*.sh

# Run lifecycle steps manually (same as CodeDeploy would)
echo "Running BeforeInstall..."
./scripts/before_install.sh

echo "Running AfterInstall..."
./scripts/after_install.sh

echo "Running ApplicationStart..."
./scripts/application_start.sh

echo "Running ValidateService..."
./scripts/validate_service.sh

echo "Deployment complete."

# Use the official lightweight Node.js LTS image.
# https://hub.docker.com/_/node
FROM node:22.14.0-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install system dependencies (curl needed for health checks/tools).
RUN apt-get update && apt-get install -y --no-install-recommends curl \
  && rm -rf /var/lib/apt/lists/*

# Install Node dependencies.
RUN npm i

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD ["node", "express.js"]

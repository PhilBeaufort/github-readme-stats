# Use the official lightweight Node.js LTS image.
# https://hub.docker.com/_/node
FROM node:22.14.0-alpine

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install dependencies.
ENV NODE_ENV=production
RUN npm ci --omit=dev

# Copy local code to the container image.
COPY . ./

# Run the web service on container startup.
CMD ["node", "express.js"]

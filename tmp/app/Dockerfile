# myfrontend/Dockerfile
FROM node:21.7.3-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build

# Expose port 8080
EXPOSE 8080


CMD ["npm", "run", "serve"]

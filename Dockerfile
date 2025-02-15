# Use Node.js LTS version
FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Bundle app source
COPY . .

# Create .env file at build time from environment variables
RUN echo "MONGODB_URI=$MONGODB_URI" > .env

# Expose port
EXPOSE 3000

# Start the application
CMD [ "node", "server.js" ]

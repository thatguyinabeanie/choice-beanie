# Use the latest LTS version of Node.js as the base image
FROM node:lts

# Set the working directory inside the container
WORKDIR /frontend

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose a port if your application needs it
EXPOSE 5173

# Define the command to run your application
CMD [ "npm", "run", "dev", "--host"]

# First stage: Node.js build environment
FROM node:19-alpine AS build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps


# Copy the rest of the application code
COPY . .

# Build the application
RUN npm run build




# Define the stage for the Nginx server
FROM nginx:1.21.0-alpine

COPY nginx.conf /usr/local/etc/nginx/nginx.conf

# Create a directory if it doesn't exist (usually not necessary for /usr/share/nginx/html)
RUN mkdir -p /var/www/html

# Copy built files from the 'build' stage
COPY --from=build /app/build /var/www/html

# Expose port 8080 and define the command to start Nginx
EXPOSE 8080
EXPOSE 3000
EXPOSE 3000/tcp
CMD ["nginx", "-g", "daemon off;"]



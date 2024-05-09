# First stage: Node.js build environment
FROM node:19-alpine AS build
WORKDIR /usr/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


# Define the stage for the Nginx server
FROM nginx:1.21.0-alpine
COPY nginx.conf /etc/nginx/nginx.conf

# Copy built files from the 'build' stage
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 8080 and define the command to start Nginx
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

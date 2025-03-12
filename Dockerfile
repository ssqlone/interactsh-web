# Use the official Node.js image to build the application
FROM node:16-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies using yarn
RUN yarn install

# Copy the rest of the application code
COPY . .

# Build the application using yarn
RUN yarn build

# Use the official Nginx image to serve the application
FROM nginx:alpine

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy the built application from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

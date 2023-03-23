# Use the official Node.js 16 base image
FROM node:16-alpine

# Update package list and install Nginx
RUN apk update && apk add nginx

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the outside world
EXPOSE 80

CMD nginx -g "daemon off;" & npm run start

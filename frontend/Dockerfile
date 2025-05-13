# Stage 1: Build the Angular application
FROM node:18 AS builder

# Set working directory for the build
WORKDIR /usr/src/app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the frontend code and build the static assets
COPY . .
RUN npm run build -- --configuration production

# Stage 2: Serve the static assets with Nginx
FROM nginx:alpine

# Set working directory for the release
WORKDIR /app

# Create a non-root user for security
RUN addgroup --system nginxuser \
    && adduser -S -s /bin/false -G nginxuser nginxuser -D -H \
    && mkdir -p /logs \
    && chown -R nginxuser:nginxuser /logs

# Copy the built static files from the build stage
COPY --chown=nginxuser:nginxuser --from=builder /usr/src/app/dist /usr/share/nginx/html

# Copy the custom Nginx configuration template
COPY --chown=nginxuser:nginxuser nginx.tmpl /etc/nginx/templates/default.conf.template

# Expose port 80
EXPOSE 80

# Run as non-root user
USER nginxuser

# Start Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
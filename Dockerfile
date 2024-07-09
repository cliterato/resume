# # Stage 1: Use nginx image to serve the Angular app
# FROM nginx:alpine

# # Copy the built Angular app into the nginx html directory
# COPY --chown=nginx:nginx src/browser /usr/share/nginx/html

# # Expose port 80
# EXPOSE 80

# # Start nginx
# CMD ["nginx", "-g", "daemon off;"]

# Use the official Nginx image as base
FROM nginx:latest

# Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy the built Angular app into the nginx image
COPY src /usr/share/nginx/html

# Copy nginx configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]


# 1. Use lightweight Nginx base image
FROM nginx:alpine

# 2. Remove default Nginx web content
RUN rm -rf /usr/share/nginx/html/*

# 3. Copy application HTML into Nginx web directory
COPY index.html /usr/share/nginx/html/index.html

# 4. Expose application port
EXPOSE 80

# 5. Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]

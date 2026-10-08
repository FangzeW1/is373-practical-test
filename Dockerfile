FROM nginxinc/nginx-unprivileged:stable-alpine
COPY --chown=101:101 index.html /usr/share/nginx/html/index.html
EXPOSE 8080

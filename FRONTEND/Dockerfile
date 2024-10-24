    FROM nginx AS builder
    RUN rm -rf /usr/share/nginx/html/*
    COPY code /usr/share/nginx/html
    # RUN addgroup -S expense && adduser -S expense -G expense
    # RUN chown -R expense:expense /usr/share/nginx/html /etc/nginx/conf.d
    COPY expense.conf /etc/nginx/conf.d/default.conf


    FROM nginx:alpine
    EXPOSE 80
    RUN addgroup -S expense && adduser -S expense -G expense
    RUN mkdir -p /var/cache/nginx && \
        chown -R expense:expense /var/cache/nginx /usr/share/nginx/html /etc/nginx/conf.d
    COPY --from=builder /usr/share/nginx/html /usr/share/nginx/html 
    COPY --from=builder /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
    RUN chown -R expense:expense /usr/share/nginx/html /etc/nginx/conf.d
    RUN sed -i '/user/d' /etc/nginx/nginx.conf
    USER expense
    CMD ["nginx", "-g", "daemon off;"]


    # before size optimization
    # FROM nginx 
    # EXPOSE 80
    # RUN rm -rf /usr/share/nginx/html/*
    # COPY code /usr/share/nginx/html
    # # COPY code /etc/nginx/html
    # COPY expense.conf /etc/nginx/conf.d/default.conf
    # CMD ["nginx", "-g", "daemon off;"]
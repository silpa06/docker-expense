# after size optimization
FROM node:20 AS builder
# RUN mkdir /app
WORKDIR /app
COPY package.json .
COPY *.js . 
RUN npm install 

FROM node:20-alpine 
EXPOSE 8080 
WORKDIR /app
COPY --from=builder /app /app
RUN addgroup -S expense && adduser -S expense -G expense \
    chown -R expense:expense /app
ENV DB_HOST="mysql"
USER expense
CMD ["node", "index.js"] 



# Before size optimization

# FROM node:20
# EXPOSE 8080
# RUN mkdir /app 
# WORKDIR /app
# COPY package.json .
# RUN npm install
# COPY *.js .
# ENV DB_HOST="mysql" 
# CMD ["node", "index.js"]



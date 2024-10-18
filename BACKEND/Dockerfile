FROM node:20
EXPOSE 8080
RUN mkdir /app 
WORKDIR /app
COPY package.json .
RUN npm install
COPY *.js .
ENV DB_HOST="localhost" 
CMD ["/app", "index.js"]



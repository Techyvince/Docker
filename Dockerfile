FROM node:18-alpine

ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PASSWORD=adminpassword 

RUN mkdir -p /home/app

COPY . /mnt/c/Users/ifezu/OneDrive/Desktop/Docker

CMD ["node", "/mnt/c/Users/ifezu/OneDrive/Desktop/Docker/server.js"]
FROM node:12.11.1-alpine
WORKDIR /usr/src/app
RUN apk upgrade libcrypto1.1 --no-cache
RUN apk upgrade libssl1.1 --no-cache
COPY package*.json ./
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY server.js ./
RUN npm install
RUN npm install express
COPY . .
EXPOSE 8080
CMD [ "node", "server.js" ]
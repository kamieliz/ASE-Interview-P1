# define the image you want to build
FROM node:latest

RUN mkdir -p /usr/src/app

# Create an app directory
WORKDIR /usr/src/app

# install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

EXPOSE 3000
CMD ["npm", "start"]
# specify base image
# ex, FROM node:6.14

FROM node:alpine

# Any following cmd will be executed in this path in the container

WORKDIR /app

# install dependencies
# and copy dependency files into the container as well, like json
# and copy build files
# copy them seperately to minimize the cache, line 17 copy everything else

COPY ./package.json ./
RUN npm install
COPY ./ ./ 


# default cmd

CMD ["npm", "start"]
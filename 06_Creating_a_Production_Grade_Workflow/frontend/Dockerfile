# Production Docker file
# base image 1, build phase
# When we deploy to AWS in section 7, this currently will fail if you attempt to use a named builder as shown
FROM node:alpine

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# base image 2, run phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
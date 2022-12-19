FROM node:16.16.0-alpine3.16 as build-stage

WORKDIR /app

COPY . .

RUN npm install && npm run build

FROM nginx:1.23.1-alpine

COPY --from=build-stage /app/build/ /usr/share/nginx/html
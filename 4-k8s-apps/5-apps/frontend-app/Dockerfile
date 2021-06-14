FROM node:10.15-jessie as builder

WORKDIR /build

COPY package*.json ./
RUN npm i

COPY ./ ./
RUN npm run build

FROM node:10.15-jessie

WORKDIR /usr/src/app

COPY --from=builder build/package*.json ./
COPY --from=builder build/node_modules /usr/src/app/node_modules
COPY --from=builder build/dist/fe-app /usr/src/app/www
COPY --from=builder build/server.js /usr/src/app/server.js

EXPOSE 8080

ENTRYPOINT [ "sh", "-c", "node server.js"]

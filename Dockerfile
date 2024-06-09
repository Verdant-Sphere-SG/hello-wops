FROM node:20.14.0-alpine as build

WORKDIR /app

COPY . .

RUN npm install

FROM node:20.14.0-alpine

WORKDIR /app

USER node

COPY --chown=node:node --from=build /app/node_modules /app/node_modules

COPY --chown=node:node --from=build /app/public /app/public

COPY --chown=node:node --from=build /app/src /app/src

COPY --chown=node:node --from=build /app/package.json /app

COPY --chown=node:node --from=build /app/logs /app/logs

CMD [ "npm", "start" ]




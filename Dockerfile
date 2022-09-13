FROM node:14-alpine
COPY cypress-realworld-app /app
WORKDIR /app
RUN yarn install \
    && yarn cache clean --all
EXPOSE 3000/tcp
EXPOSE 3001/tcp
ENTRYPOINT ["yarn", "dev"]

FROM node:14
COPY cypress-realworld-app /app
WORKDIR /app
RUN yarn install
EXPOSE 3000/tcp
EXPOSE 3001/tcp
ENTRYPOINT ["yarn", "dev"]

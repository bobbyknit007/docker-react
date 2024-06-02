#Base image Stage -1 named as builder
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build will have all the stuff required to run app

# stage 2 run
FROM nginx
# copy content of /app/build folder from prev stage builder to folder /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html


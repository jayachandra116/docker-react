FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# all the stuff we need from this phase will be in /app/build/.

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
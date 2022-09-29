FROM node:16.17.1-alpine
WORKDIR /app
COPY build .
RUN npm install -g serve
EXPOSE 3000
CMD ["serve","-s","."]

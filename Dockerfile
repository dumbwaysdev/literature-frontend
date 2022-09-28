FROM node:10.24.1-alpine
WORKDIR /app
COPY . .
RUN npm install -g serve
EXPOSE 3000
CMD ["serve","-s","."]

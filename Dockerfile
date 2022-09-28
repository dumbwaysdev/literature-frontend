FROM node:10.24.1-alpine
WORKDIR /app
COPY . .
RUN npm install
#RUN npm install pm2 -g
EXPOSE 3002
CMD ["npm","start"]

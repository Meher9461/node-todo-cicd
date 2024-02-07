FROM node:14-alpine
WORKDIR /app
COPY package*.json/app/
RUN npm install
EXPOSE 8000
CMD ["node","app.js"]

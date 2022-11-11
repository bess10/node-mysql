#imagen base del sistema operativo
FROM  node:19-slim

#Directorio de trabajo de la aplicación
WORKDIR /app

COPY package*.json ./

RUN npm install

#COPY /src /app/
COPY . .

EXPOSE 4000

CMD [ "npm", "start" ]
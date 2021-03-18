FROM node:alpine
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"] 

# PREVIOUS BLOCK ALL COMPLETE - FROM TERMINATES SUCCESFUL BLOCK
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html 
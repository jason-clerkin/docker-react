FROM node:alpine
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"] 

# PREVIOUS BLOCK ALL COMPLETE - FROM TERMINATES SUCCESFUL BLOCK
FROM nginx
# EXPOSE instruction - meant to be communication to developers
# this does nothing automactically - EB is different
# gonna look for the expost instruction. Whatever port is there
# EB is going to map automatically - map for incoming traffic
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html 
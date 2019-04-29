# use an existing image as a base 
FROM node:alpine as builder

##COPY the build files
WORKDIR /app

COPY package.json .

# Download and install a dependency
RUN npm install
COPY . .



#Tell the image what to do when it starts as a container
#CMD ["npm","run","start"]
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

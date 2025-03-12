FROM nginx:alpine
 
 WORKDIR /usr/share/nginx/html
 
 RUN apk update && \
     apk add --no-cache curl unzip
 
 RUN curl -L https://github.com/ssqlone/interactsh-web/releases/download/1.0.1/1.0.1.zip -o interactsh.zip && \
     unzip -o interactsh.zip && \
     rm interactsh.zip
     
 EXPOSE 80
 CMD ["nginx", "-g", "daemon off;"]

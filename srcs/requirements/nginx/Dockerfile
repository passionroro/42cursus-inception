FROM    alpine:3.14

RUN     apk update && \
        apk upgrade && \
        apk add --no-cache openssl nginx

RUN     mkdir /etc/nginx/ssl

RUN     openssl req -nodes -x509 \
        -subj "/C=CH/ST=VD/L=Renens/O=42lausanne/CN=rohoarau.42.fr" \
        -keyout /etc/nginx/ssl/rohoarau.42.fr.key \
        -out /etc/nginx/ssl/rohoarau.42.fr.crt

COPY    mydefault.conf /etc/nginx/conf.d/default.conf

EXPOSE  443

CMD     ["nginx", "-g", "daemon off;"]
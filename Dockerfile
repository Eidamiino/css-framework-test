# ====== RUN CADDY =======
FROM caddy:latest
COPY Caddyfile /etc/caddy/Caddyfile
COPY ./poc /srv
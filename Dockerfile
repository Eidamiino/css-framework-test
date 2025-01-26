ARG NPM_SCRIPT="build"
ARG NODE_ENV="production"

#
# ███████╗██████╗  ██████╗ ███╗   ██╗████████╗███████╗███╗   ██╗██████╗ 
# ██╔════╝██╔══██╗██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝████╗  ██║██╔══██╗
# █████╗  ██████╔╝██║   ██║██╔██╗ ██║   ██║   █████╗  ██╔██╗ ██║██║  ██║
# ██╔══╝  ██╔══██╗██║   ██║██║╚██╗██║   ██║   ██╔══╝  ██║╚██╗██║██║  ██║
# ██║     ██║  ██║╚██████╔╝██║ ╚████║   ██║   ███████╗██║ ╚████║██████╔╝
# ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═══╝╚═════╝ 
#

FROM node:lts-alpine AS build-frontend
ARG NPM_SCRIPT
ARG NODE_ENV

ENV NODE_ENV=${NODE_ENV}

WORKDIR /build
COPY ./poc/package.json ./poc/package-lock.json ./
RUN npm ci

COPY ./poc/jsconfig.json ./poc/svelte.config.js ./poc/vite.config.js ./
COPY ./poc/index.html ./
COPY ./poc/public ./public

COPY ./poc/src ./src

RUN npm run ${NPM_SCRIPT}

#  ███████╗██╗███╗   ██╗ █████╗ ██╗     
#  ██╔════╝██║████╗  ██║██╔══██╗██║     
#  █████╗  ██║██╔██╗ ██║███████║██║     
#  ██╔══╝  ██║██║╚██╗██║██╔══██║██║     
#  ██║     ██║██║ ╚████║██║  ██║███████╗
#  ╚═╝     ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝
#                                       

FROM caddy:latest
COPY ./Caddyfile /etc/caddy/Caddyfile
COPY --from=build-frontend /build/dist /srv
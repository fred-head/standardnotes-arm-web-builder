FROM node:22-alpine AS builder

WORKDIR /build

COPY standardnotes/ .

# Platzhalter statt fest verdrahteter API URL
RUN sed -i \
    's|https://api.standardnotes.com|__DEFAULT_SYNC_SERVER__|g' \
    packages/web/src/index.html

RUN corepack enable

RUN yarn install --immutable

RUN yarn build:web

FROM nginx:stable-alpine

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

COPY --from=builder \
    /build/packages/web/dist \
    /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]

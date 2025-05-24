FROM oven/bun:1

WORKDIR /app

COPY ./apps/websocket ./apps/websocket
COPY ./packages ./packages
COPY ./bun.lock ./bun.lock
COPY ./package.json ./package.json
COPY ./turbo.json ./turbo.json

RUN bun install
RUN bun run db:generate

EXPOSE 8080

CMD ["bun","run", "start:websocket"]
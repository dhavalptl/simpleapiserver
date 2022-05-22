# 1. Install dependencies only when needed
FROM node:16-alpine AS deps
ENV NODE_ENV=production
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci

# 2. Rebuild the source code only when needed
FROM node:16-alpine
WORKDIR /app
ENV NODE_ENV=production
ENV PORT 4000
COPY --from=deps --chown=node:node /app/node_modules ./node_modules
COPY --chown=node:node . .
USER node
EXPOSE 4000
CMD ["node", "src/index.mjs"]
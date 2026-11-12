FROM node:22-bookworm-slim
WORKDIR /app
COPY package*.json ./
# All dependencies: @remix-run/dev is a devDependency and the build below needs it.
RUN npm install
COPY . .
RUN npm run build:remix
ENV NODE_ENV=production
# PORT is the box's, injected at run.
CMD ["npx", "remix-serve", "build/index.js"]

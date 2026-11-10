# The repo is a workshop monorepo with no app at its root, so this builds one exercise app.
FROM node:22-bookworm-slim
WORKDIR /app
COPY exercises/01.styling/01.problem.public-links/package.json ./
# All dependencies: @remix-run/dev is a devDependency and the build below needs it.
RUN npm install
COPY exercises/01.styling/01.problem.public-links/ ./
RUN npm run build:remix
ENV NODE_ENV=production
# PORT is the box's, injected at run. The build is ESM, so remix-serve needs the file.
CMD ["npx", "remix-serve", "build/index.js"]


# Stage 1: Build the Angular application
FROM node:20.13.1-alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine
COPY --from=build /app/dist/angular-zero-day/browser /usr/share/nginx/html
EXPOSE 80

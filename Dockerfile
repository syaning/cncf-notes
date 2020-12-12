# build stage
FROM squidfunk/mkdocs-material as build-stage
WORKDIR /docs
COPY . .
RUN mkdocs build

# deploy stage
FROM nginx:1.17-alpine
COPY --from=build-stage /docs/site /usr/share/nginx/html/
EXPOSE 80

  goapp:
    container_name: goapp
    image: goapp:1.0.0
    build:
      context: ./backend
      dockerfile: go.dockerfile
    environment:
      DATABASE_URL: 'postgres://postgres:postgres@db:5432/postgres?sslmode=disable'
    ports:
      - '8000:8000'
    depends_on:
      - db

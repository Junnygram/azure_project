
FROM golang:1.21-alpine

WORKDIR /app

COPY . .

# Download and install the dependencies
RUN go mod tidy

# Build the Go app
RUN go build -o api .

EXPOSE 8000

CMD ["./api"]

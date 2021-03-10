FROM golang:1.16 as builder
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -o /server main.go

FROM alpine:3
RUN apk --no-cache add ca-certificates
COPY --from=builder /server /usr/bin/server
WORKDIR /var/contact
COPY static static
EXPOSE 3000
CMD ["/usr/bin/server", "/var/contact/static"]

FROM golang AS builder

WORKDIR /go/src/test-wait2
COPY . .
# disable cgo
ENV CGO_ENABLED=0
# build steps
RUN echo ">>> 1: go version" && go version
RUN echo ">>> 2: go get" && go get -v -d
RUN echo ">>> 3: go install" && go install

FROM alpine
WORKDIR /go/bin/
COPY --from=builder /go/bin/test-wait2 ./
EXPOSE 8080

## Add the wait script to the image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.5.0/wait ./wait
RUN chmod +x ./wait

CMD ./wait && ./test-wait2
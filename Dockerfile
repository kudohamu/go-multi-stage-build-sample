FROM golang:1.11 as build

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

RUN mkdir -p /go/src/github.com/kudohamu/go-multi-stage-build-sample
WORKDIR /go/src/github.com/kudohamu/go-multi-stage-build-sample
COPY . /go/src/github.com/kudohamu/go-multi-stage-build-sample

RUN go build -o msbs

FROM alpine

COPY --from=build /go/src/github.com/kudohamu/go-multi-stage-build-sample/msbs /msbs
CMD /msbs

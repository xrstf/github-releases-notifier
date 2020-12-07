FROM golang:1.15 as builder

ADD . /go/src/go.xrstf.de/github-releases-notifier
WORKDIR /go/src/go.xrstf.de/github-releases-notifier

RUN make build

FROM alpine:3.12
RUN apk --no-cache add ca-certificates

COPY --from=builder /go/src/go.xrstf.de/github-releases-notifier /bin/
ENTRYPOINT [ "/bin/github-releases-notifier" ]

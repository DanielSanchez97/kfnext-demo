FROM golang:1.13.0-alpine

ENV SRC_DIR=/go/src/github.com/DanielSanchez97/kfnext-demo/

ENV PORT=5000

RUN adduser -D dev

USER dev

ADD . ${SRC_DIR}

RUN cd ${SRC_DIR}

CMD PORT=${PORT} go run ${SRC_DIR}/server.go





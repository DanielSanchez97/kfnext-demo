FROM golang:1.13.0-alpine

ENV SRC_DIR=/go/src/github.com/DanielSanchez97/kfnext-demo/

ENV PORT_demo=5000

ENV HOST_demo=0.0.0.0

RUN adduser -D dev

USER dev

ADD . ${SRC_DIR}

RUN cd ${SRC_DIR}

CMD PORT_demo=${PORT_demo} HOST_demo=${HOST_demo} go run ${SRC_DIR}/server.go





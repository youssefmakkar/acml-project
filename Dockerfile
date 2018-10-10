
FROM golang:1.8-alpine

RUN apk --no-cache -U add git

RUN go get -u github.com/kardianos/govendor

WORKDIR /go/src/app

COPY . .

RUN govendor sync

RUN govendor build -o /go/src/app/myapp

CMD [ "/go/src/app/myapp" ]
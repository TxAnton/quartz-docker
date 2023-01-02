FROM golang:alpine
WORKDIR /go
RUN apk update
RUN apk add hugo
RUN apk add git
RUN apk add make
#COPY quartz ./quartz
RUN mkdir quartz
RUN go install github.com/jackyzha0/hugo-obsidian@latest
WORKDIR /go/quartz
EXPOSE 1313
RUN git config --global --add safe.directory /go/quartz
CMD [ "/usr/bin/make","serve","-f","/go/quartz/Makefile" ]


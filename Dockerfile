FROM golang:1.6

ENV APP_HOME /app
ENV GLIDE_VERSION 0.10.2

RUN cd /tmp && \
	curl -L https://github.com/Masterminds/glide/releases/download/$GLIDE_VERSION/glide-$GLIDE_VERSION-linux-amd64.tar.gz -o glide.tar.gz && \
	tar -xzf glide.tar.gz && \
	cp /tmp/linux-amd64/glide /usr/local/bin

COPY . $APP_HOME
WORKDIR $APP_HOME

RUN glide install

RUN ["go", "build", "servers/keyserver/main.go"]
CMD ["./main"]


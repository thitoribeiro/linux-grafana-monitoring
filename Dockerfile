
FROM alpine:3.19 AS git-clone
RUN apk add --no-cache git
RUN git clone https://github.com/thitoribeiro/devpro-test.git /k6-tests

FROM grafana/k6:latest

COPY --from=git-clone /k6-tests /k6-tests

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /k6-tests

ENTRYPOINT ["entrypoint.sh"]





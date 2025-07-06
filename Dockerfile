
FROM alpine:3.19 AS git-clone
RUN apk add --no-cache git
RUN git clone https://github.com/thitoribeiro/devpro-test.git /k6-tests

FROM grafana/k6:latest

COPY --from=git-clone /k6-tests /k6-tests

WORKDIR /k6-tests

CMD ["run", "scenarios/getListUsersLoadTest-script.js"]


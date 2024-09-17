FROM node:21.7.0-alpine

ARG ACTUAL_PLAID_COMMIT="0f18ffde845933f52eede5f45e4035e371bdc9f8"

RUN apk add git

WORKDIR /app
RUN git clone https://github.com/bony2023/actualplaid.git

WORKDIR /app/actualplaid
RUN git reset --hard "$ACTUAL_PLAID_COMMIT"
RUN npm ci

ENTRYPOINT ["tail", "-f", "/dev/null"]

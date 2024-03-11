FROM node:21.7.0-alpine

ARG ACTUAL_PLAID_COMMIT="e35751b7ea48fba489339df88f4be59ed32ca771"

RUN apk add git

WORKDIR /app
RUN git clone https://github.com/bony2023/actualplaid.git

WORKDIR /app/actualplaid
RUN git reset --hard "$ACTUAL_PLAID_COMMIT"
RUN npm ci

ENTRYPOINT ["tail", "-f", "/dev/null"]
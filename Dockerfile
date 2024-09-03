FROM node:21.7.0-alpine

ARG ACTUAL_PLAID_COMMIT="3a42b22ff9c3de56e587da0ba805a8380ba91f8b"

RUN apk add git

WORKDIR /app
RUN git clone https://github.com/bony2023/actualplaid.git

WORKDIR /app/actualplaid
RUN git reset --hard "$ACTUAL_PLAID_COMMIT"
RUN npm ci

ENTRYPOINT ["tail", "-f", "/dev/null"]

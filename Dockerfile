FROM node:21.7.0-alpine

ARG ACTUAL_PLAID_COMMIT="ec06b23d40f30f274c0f1938bf74d2751a487ee2"

RUN apk add git

WORKDIR /app
RUN git clone https://github.com/bony2023/actualplaid.git

WORKDIR /app/actualplaid
RUN git reset --hard "$ACTUAL_PLAID_COMMIT"
RUN npm ci

ENTRYPOINT ["tail", "-f", "/dev/null"]

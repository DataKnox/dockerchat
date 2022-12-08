FROM node:18.10.0-alpine

WORKDIR /usr

COPY . .

RUN npm install

RUN --mount=type=secret,id=ERISKEY \
    --mount=type=secret,id=AZUREPAT \
    --mount=type=secret,id=ORGNAME \
    export ERISKEY=$(cat /run/secrets/ERISKEY) && \
    export AZUREPAT=$(cat /run/secrets/AZUREPAT) && \
    export ORGNAME=$(cat /run/secrets/ORGNAME) && \
    echo $ORGNAME

CMD ["npx","ts-node","bot.ts"]
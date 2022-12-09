FROM node:16.17.1-alpine
COPY . .
RUN --mount=type=secret,id=ERISKEY,required \
    --mount=type=secret,id=AZUREPAT,required \
    --mount=type=secret,id=ORGNAME,required \
    export ERISKEY=$(cat /run/secrets/ERISKEY) && \
    export AZUREPAT=$(cat /run/secrets/AZUREPAT) && \
    export ORGNAME=$(cat /run/secrets/ORGNAME)  && \
    echo $ERISKEY && \
    echo $ORGNAME && \
    echo AZUREPAT=$AZUREPAT >> .env && \
    echo ERISKEY=$ERISKEY >> .env && \
    echo ORGNAME=$ORGNAME >> .env && \
    npm install
CMD ["npx","ts-node","bot.ts"]
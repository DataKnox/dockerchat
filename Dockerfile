FROM node:16.17.1-alpine
COPY . .
RUN npm install
RUN --mount=type=secret,id=ERISKEY,required \
    --mount=type=secret,id=AZUREPAT,required \
    --mount=type=secret,id=ORGNAME,required \
    export ERISKEY=$(cat /run/secrets/ERISKEY) && \
    export AZUREPAT=$(cat /run/secrets/AZUREPAT) && \
    export ORGNAME=$(cat /run/secrets/ORGNAME)  && \
    cat /run/secrets/ERISKEY && \ 
    echo $ERISKEY && \
    echo $ORGNAME
CMD ["npx","ts-node","bot.ts"]
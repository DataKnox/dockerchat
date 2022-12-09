FROM node:16.17.1-alpine
RUN --mount=type=secret,id=ERISKEY,required \
    --mount=type=secret,id=AZUREPAT,required \
    --mount=type=secret,id=ORGNAME,required \
    cat /run/secrets/ERISKEY && \ 
    export ERISKEY=$(cat /run/secrets/ERISKEY) && \
    export AZUREPAT=$(cat /run/secrets/AZUREPAT) && \
    export ORGNAME=$(cat /run/secrets/ORGNAME)  && \
    echo $ERISKEY && \
    echo $ORGNAME
WORKDIR /usr
COPY . .
RUN npm install
CMD ["npx","ts-node","bot.ts"]
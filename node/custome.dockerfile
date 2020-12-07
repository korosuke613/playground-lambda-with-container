FROM public.ecr.aws/bitnami/node:14.15.1-debian-10-r8
RUN apt-get update

RUN apt-get install -y cmake autoconf libtool

RUN npm config set prefix '~/.npm-global'
ENV PATH=~/.npm-global/bin:$PATH

COPY package*.json ./
RUN npm install aws-lambda-ric
RUN npm install

COPY entry.sh app.js ./

#ENTRYPOINT ["/opt/bitnami/node/bin/npx", "aws-lambda-ric"]
ENTRYPOINT ["/app/entry.sh"]
CMD ["app.lambdaHandler"]

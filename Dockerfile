FROM postgres:11-alpine

RUN apk add --no-cache py3-pip && pip3 install awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=eu-north-1

COPY backup.sh /usr/local/bin/backup

VOLUME /backup

CMD /usr/local/bin/backup

FROM postgres:11-alpine

RUN apk add --no-cache py3-pip jq && pip3 install awscli && mkdir /backup

ENV AWS_DEFAULT_REGION=eu-north-1

COPY backup check_backup restore /usr/local/bin/

CMD /usr/local/bin/backup

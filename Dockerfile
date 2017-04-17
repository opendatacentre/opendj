FROM java:8
MAINTAINER des@drury-family.com

ENV OPENDJ_URL=https://github.com/OpenRock/OpenDJ/releases/download/3.0.0/OpenDJ-3.0.0.zip

WORKDIR /opt

RUN curl -L $OPENDJ_URL -o opendj.zip; \
    unzip opendj.zip; \
    rm opendj.zip

ADD opendc.ldif /tmp/opendc/opendc.ldif
ADD run.sh /opt/opendj/run.sh

EXPOSE 389 636 4444

CMD  ["/opt/opendj/run.sh"]


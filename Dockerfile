FROM alpine:3.12

LABEL maintainer="avitalique.gmail.com"

ARG JMETER_VERSION=5.3
ARG JMETER_ARCHIVE_URL=https://archive.apache.org/dist/jmeter/binaries

ENV JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN ${JMETER_HOME}/bin
ENV PATH ${JMETER_BIN}:${PATH}

RUN apk add --no-cache \
	openjdk8-jre \
	wget \
	unzip \
 && cd /tmp \
 && wget ${JMETER_ARCHIVE_URL}/apache-jmeter-${JMETER_VERSION}.tgz \
 && wget ${JMETER_ARCHIVE_URL}/apache-jmeter-${JMETER_VERSION}.tgz.sha512 \
 && sha512sum -c apache-jmeter-${JMETER_VERSION}.tgz.sha512 \
 && tar -xzf apache-jmeter-${JMETER_VERSION}.tgz -C /opt \
 && jmeter --version \
 && rm -fr /tmp/*

COPY entrypoint.sh /

WORKDIR /jmeter
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--?"]
FROM alpine

RUN apk update
RUN apk add openjdk8
RUN apk add curl unzip
RUN curl https://downloads.gradle.org/distributions/gradle-6.7-bin.zip > gradle.zip
RUN unzip gradle.zip
ENV PATH "$PATH:/gradle-6.7/bin"

WORKDIR /java-gradle-http-hw
COPY build.gradle .
COPY src/ src/

RUN gradle build

CMD ["gradle", "run"]

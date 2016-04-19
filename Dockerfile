FROM misfit/cloud_scala
MAINTAINER johnny@misfit.com

# create folders
RUN mkdir -p /src/logs/
RUN mkdir -p /src/newrelic

# add dist package
ADD target/universal/TestTravis /src
ADD entrypoint.sh /src/
ADD newrelic /src/newrelic
ADD newrelic.yml /src/newrelic/

# set work directory
WORKDIR /src

# expose port
EXPOSE 9000

ENTRYPOINT  ["./entrypoint.sh"]

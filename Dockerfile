FROM healthcatalyst/fabric.machinelearning.r:latest
LABEL maintainer="Health Catalyst"
LABEL version="1.0"

ENV R_HOME /usr/lib64/R

ADD install-rserve.R /
RUN Rscript install-rserve.R


ADD docker-entrypoint.sh ./docker-entrypoint.sh

RUN dos2unix ./docker-entrypoint.sh \
	&& chmod a+x ./docker-entrypoint.sh

EXPOSE 6311

ENTRYPOINT ["./docker-entrypoint.sh"]


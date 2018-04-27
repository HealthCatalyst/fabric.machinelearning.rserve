FROM healthcatalyst/fabric.machinelearning.r:latest
LABEL maintainer="Health Catalyst"
LABEL version="1.0"

ADD install-rserve.R /
RUN Rscript install-rserve.R

RUN Rscript -e "install.packages(c('RODBC', 'healthcareai'))"

ADD docker-entrypoint.sh ./docker-entrypoint.sh

RUN dos2unix ./docker-entrypoint.sh &>/dev/null \
	&& chmod a+x ./docker-entrypoint.sh

EXPOSE 6311

ENTRYPOINT ["./docker-entrypoint.sh"]


FROM healthcatalyst/fabric.machinelearning.r:latest
LABEL maintainer="Health Catalyst"
LABEL version="1.0"

RUN yum -y install libcurl libcurl-devel

ADD install-rserve.R /
ADD Rserv.conf /etc/Rserv.conf
ADD docker-entrypoint.sh ./docker-entrypoint.sh

RUN Rscript install-rserve.R

RUN Rscript -e "install.packages(c('RODBC', 'healthcareai', 'jsonlite'))"

RUN dos2unix ./docker-entrypoint.sh &>/dev/null \
	&& chmod a+x ./docker-entrypoint.sh \
	&& mkdir -p /opt/healthcatalyst/models

EXPOSE 6311

ENTRYPOINT ["./docker-entrypoint.sh"]


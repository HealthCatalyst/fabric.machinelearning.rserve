FROM healthcatalyst/fabric.baseos:latest
LABEL maintainer="Health Catalyst"
LABEL version="1.0"

RUN yum -y update; yum clean all
RUN yum -y install epel-release; yum clean all

RUN mkdir -p /usr/lib64/R/library \
    && chown docker:docker /usr/lib64/R/library \
    && mkdir -p /usr/share/doc/R-3.3.3/html \
    && chown docker:docker /usr/lib64/R/library 

RUN yum -y install R; yum clean all

ADD install-rserve.R /
# RUN Rscript install-rserve.R

ADD run.sh /
RUN chmod +x /run.sh
EXPOSE 6311
ENV R_HOME /usr/lib/R
CMD /run.sh

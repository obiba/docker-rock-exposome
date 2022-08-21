#
# Rock R Server Dockerfile with DataSHIELD Exposome
#
# https://github.com/obiba/docker-rock-exposome
#

FROM datashield/rock-base:latest

ENV DSEXPOSOME_VERSION 2.0.4

ENV ROCK_LIB /var/lib/rock/R/library

# Install new R packages
# dsExposome
RUN Rscript -e "BiocManager::install(c('bumphunter', 'missMethyl', 'rexposome'), update = FALSE, ask = FALSE, lib = '$ROCK_LIB')"
RUN Rscript -e "remotes::install_github('isglobal-brge/dsExposome', ref = '$DSEXPOSOME_VERSION', repos = c('https://cloud.r-project.org', 'https://cran.datashield.org'), upgrade = FALSE, lib = '$ROCK_LIB')"


RUN chown -R rock $ROCK_LIB

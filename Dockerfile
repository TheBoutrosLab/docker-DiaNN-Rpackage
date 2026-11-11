# Rocker r-ver contains R without RStudio and fixes the CRAN package snapshot
# for non-current R versions.
ARG R_VERSION=4.5.2
FROM rocker/r-ver:${R_VERSION}

ARG DIANN_COMMIT=af538f6e2cd5ab715e1381632e17cb8f234ebf53

RUN apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl && \
    rm -rf /var/lib/apt/lists/* && \
    install2.r --error --skipinstalled data.table Rcpp RcppEigen && \
    mkdir /tmp/diann-rpackage && \
    curl --fail --location --show-error --silent \
        "https://github.com/vdemichev/diann-rpackage/archive/${DIANN_COMMIT}.tar.gz" \
        --output /tmp/diann-rpackage.tar.gz && \
    tar -xzf /tmp/diann-rpackage.tar.gz --strip-components=1 \
        -C /tmp/diann-rpackage && \
    find /tmp/diann-rpackage/src -maxdepth 1 -type f \
        \( -name '*.o' -o -name '*.dll' -o -name '*.so' -o -name '*.a' \) \
        -delete && \
    R CMD INSTALL --preclean /tmp/diann-rpackage && \
    Rscript -e 'library(diann); stopifnot(as.character(packageVersion("diann")) == "1.0.1", is.function(diann_maxlfq))' && \
    rm -rf /tmp/diann-rpackage /tmp/diann-rpackage.tar.gz

RUN groupadd -g 500001 bldocker && \
    useradd -r -u 500001 -g bldocker bldocker

USER bldocker

LABEL maintainer="Chenghao Zhu <czhu@sbpdiscovery.org>" \
      org.opencontainers.image.source="https://github.com/TheBoutrosLab/docker-DiaNN-Rpackage" \
      org.opencontainers.image.description="R runtime with the DIA-NN R package for report quantitation"

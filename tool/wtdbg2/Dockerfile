FROM biocontainers/biocontainers:latest
USER root
RUN conda install -y \
    tool_1 \
    tool_2
WORKDIR /workdir
COPY wtdbg2.sh /workdir/

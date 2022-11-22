FROM amazonlinux:2022 AS git-build
ARG JQ_VERSION
RUN yum install -q -y git automake autoconf flex bison libtool which diffutils glibc-static
RUN cd / && \
    git clone https://github.com/stedolan/jq.git && \
    cd /jq && \
    git checkout jq-${JQ_VERSION}
RUN cd /jq && \
    git submodule update --init && \
    autoreconf -fi && \
    ./configure --enable-all-static --prefix=/usr/local --with-oniguruma=builtin && \
    sed -i 's/--dirty//g' scripts/version && \
    make LDFLAGS=-all-static -j8 && \
    make check && \
    strip jq && \
    rm -rf /usr/local/* && \
    mkdir -p /usr/local/bin && \
    mv jq /usr/local/bin/jq

FROM scratch
COPY --from=git-build /usr/local/ /usr/local/

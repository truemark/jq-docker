FROM amazonlinux:2022 AS git-build
ARG JQ_VERSION
RUN yum install -q -y git automake autoconf flex bison libtool which diffutils
RUN cd / && git clone -c advice.detachedHead=false --single-branch --depth 1 --branch jq-${JQ_VERSION} https://github.com/stedolan/jq.git
RUN rm -rf /usr/local/* && \
    cd /jq && \
    git submodule update --init && \
    autoreconf -fi && \
    ./configure --enable-all-static --prefix=/usr/local --with-oniguruma=builtin && \
    make -j8 && \
    make check && \
    make install && \
    strip /usr/local/bin/jq

FROM scratch
COPY --from=git-build /usr/local/ /usr/local/

FROM kozo2/iruby-notebook

MAINTAINER Kozo Nishida <knishida@riken.jp>

ADD . /workdir
WORKDIR /workdir

USER root

RUN cd /workdir && wget ftp://ftp.gnu.org/gnu/gsl/gsl-2.1.tar.gz && tar xf gsl-2.1.tar.gz && cd gsl-2.1 && \
    ./configure && make && make install && cd .. && rm -rf gsl-2.1 && \
    gem install bundler && \
    rake build && gem install pkg/numo-gsl-*.gem &&\
    ldconfig && chown -R jovyan:users /workdir

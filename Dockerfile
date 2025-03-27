FROM ruby:3

WORKDIR /usr/src/app

COPY Gemfile ./
RUN bundle install

COPY . .

# add miniprot
RUN cd /opt && \
    git clone --depth=1 --branch=v0.14 https://github.com/lh3/miniprot && \
    cd miniprot && \
    make

ENV PATH "$PATH:/opt/miniprot"
ENTRYPOINT ["/usr/src/app/MicroFinder.v0.2.sh"]

FROM ruby:3

WORKDIR /usr/src/app

COPY Gemfile ./
RUN bundle install

COPY . .

# add miniprot
RUN cd /opt && \
    git clone --depth=1 https://github.com/lh3/miniprot && \
    cd miniprot && \
    make

ENTRYPOINT ["/usr/src/app/MicroFinder.v0.2.sh"]

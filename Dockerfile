FROM ruby:3-slim

WORKDIR /usr/src/app

COPY Gemfile ./
RUN bundle install

COPY . .

ENTRYPOINT ["/usr/src/app/sort_fasta.rb"]

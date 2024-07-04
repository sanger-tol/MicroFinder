FROM ruby:3

WORKDIR /usr/src/app

COPY Gemfile ./
RUN bundle install

COPY . .

ENTRYPOINT ["/usr/src/app/sort_fasta.rb"]

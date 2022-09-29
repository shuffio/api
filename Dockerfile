FROM ruby:3.1.2

# stes some Environment variables
ENV NODE_ENV='development'
ENV RACK_ENV='development'

EXPOSE 9292/tcp

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec thin start -p 9292 -e $RACK_ENV --tag shuffio-api --threaded

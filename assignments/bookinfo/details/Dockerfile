FROM ruby:2.7-slim-buster

WORKDIR /usr/src/app/

COPY src/ /usr/src/app/

RUN bundle config --global frozen 1

RUN bundle install

EXPOSE 8081

CMD ["ruby", "details.rb", "8081"]
FROM ruby:2.7-alpine

RUN gem install bundler -v '2.1.4'

RUN mkdir -p app && chown 1000:1000 app

RUN apk add --no-cache --update git

USER 1000
ENV HOME=/app
WORKDIR /app

COPY --chown=1000:1000 Gemfile* *.gemspec .git /app/
COPY --chown=1000:1000 lib/automation_extensions/version.rb /app/lib/automation_extensions/

RUN bundle config path /app/vendor && bundle install && bundle clean --force

COPY --chown=1000:1000 . /app/

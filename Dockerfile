FROM ruby:2.4.6-alpine3.9

# Install packages necessary to build gems with C extensions
RUN apk add --no-cache \
        build-base \
        ruby-dev \
        sqlite-dev

# Install packages required to run the application
RUN apk add --no-cache \
        bash \
        nodejs \
        sqlite-libs \
        tzdata

# Prepare application directory
ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Only copy the Gemfiles before running bundler
COPY Gemfile Gemfile.lock $APP_HOME/

RUN bundle config --global silence_root_warning 1

# Install all gems
RUN bundle install --system

COPY . $APP_HOME

# For Pry, this will replace the `less` command with `more`. `less` in BusyBox
# cannot handle the -R option that Pry adds to its call, and thus fails.
ENV PAGER more

RUN bin/rails db:setup

CMD bin/service

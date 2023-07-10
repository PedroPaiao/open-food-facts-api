FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y curl \
                                             build-essential \
                                             libssl-dev

LABEL Name=open-fact-foods-api Version=0.0.1
ENV BUNDLER_VERSION=2.3.7
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
ENV app /app

RUN mkdir $app
WORKDIR $app
ADD . $app

RUN gem install bundler -v 2.3.7

COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install

COPY . ./
EXPOSE 3000
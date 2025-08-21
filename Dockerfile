FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y \
    nodejs \
    yarn \
    build-essential \
    libpq-dev \
    libsass1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /myapp

# Gemfile と Gemfile.lock をコピーして bundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3

# アプリ全体をコピー
COPY . .

# キャッシュ削除 & assets precompile
RUN rm -rf tmp/cache \
 && bundle exec rails assets:precompile

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

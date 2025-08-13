FROM ruby:3.2.2

# nodejs と postgresql-client をインストール
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /myapp

# ホストのGemfileをコピーしてbundle install
COPY Gemfile Gemfile.lock ./
RUN bundle install

# アプリコードをコピー
COPY . .

# assetsプリコンパイル
RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["sh", "-c", "bundle exec rails server -b 0.0.0.0 -p $PORT"]

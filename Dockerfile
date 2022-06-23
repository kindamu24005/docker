#rubyの2.7を使うよ
FROM ruby:2.7 

ENV RAILS_ENV=production

#必要なライブラリのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn

#ディレクトリを作る。
WORKDIR /app

#./src(アプリケーションコードは全部srcの中にある)をappの下にコピー
COPY ./src /app

#ルビー関連のライブラリのインストール
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install


COPY start.sh /start.sh
RUN chmod 744 /start.sh
CMD [ "sh", "/start.sh" ]


#rubyの2.7を使うよ
FROM ruby:2.7 

#ディレクトリを作る。
WORKDIR /var/www

#./src(アプリケーションコードは全部srcの中にある)をwwwの下にコピー
COPY ./src /var/www

RUN bundle config --local set path 'vendor/bundle'
RUN bundle install

#COM([]の中身を実行するの意味)　bashを起動する
CMD ["bundle", "exec", "ruby", "app.rb"]


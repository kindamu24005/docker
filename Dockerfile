#rubyの2.7を使うよ
FROM ruby:2.7 

#ディレクトリを作る。というコマンドを実行(RUN)
RUN mkdir /var/www
#main.rbをwwwの下にコピー
COPY main.rb /var/www

#COM([]の中身を実行するの意味)　ここではmain.rbを起動するの意味　
CMD ["ruby", "/var/www/main.rb"]


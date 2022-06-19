require 'webrick' #rubyに標準でついているライブラリ

#ウェブサーバーを作る
server = WEBrick::HTTPServer.new(
    DocumentRoot: './', #同じディレクトリを参照
    BindAddres: '0.0.0.0', #任意のアドレスを全て受け止める
    Port: 8000
)

#トップページにアクセスされたらレスポンスとしてhelloを返す
server.mount_proc('/') do |req, res|
    res.body = 'hello'
end

#サーバーを起動
server.start
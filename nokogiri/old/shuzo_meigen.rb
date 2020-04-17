require 'open-uri' #URLにアクセスする為のライブラリを読み込みます。
require 'nokogiri' #Nokogiriライブラリを読み込みます。

url = 'http://curazy.com/archives/6493' #切り出すURLを指定します。

charset = nil
html = open(url) do |f|
  charset = f.charset #文字種別を取得します。
  f.read #htmlを読み込み変数htmlに渡します。
end

page = Nokogiri::HTML.parse(html, nil, charset) #htmlを解析し、オブジェクト化

#shuzo_meigen = page.search('pre')　#名言は<pre>タグに囲まれているので、<pre>タグを指定します。

#p shuzo_meigen.text　#shuzo_meigenで取得したデータをテキストに変換
p page.title

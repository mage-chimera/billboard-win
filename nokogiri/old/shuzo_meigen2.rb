require 'nokogiri'
require 'open-uri'

url = 'http://curazy.com/archives/6493'

charset = nil
# webページにアクセス

#HTMLを取得
html = open(url) do |f|
 charset = f.charset
 f.read
end

# nokogiriで変換、サイトタイトル出力
doc = Nokogiri::HTML.parse(html, nil, charset)
p doc.title

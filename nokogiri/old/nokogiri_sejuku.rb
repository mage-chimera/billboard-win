#gemの読み込み
require 'nokogiri'

#今回はHTMLをファイルから持ってくる
html = File.open('test.html'){|f| f.read }

#HTMLをDOMに変換
#doc = Nokogiri::HTML.parse(html, 'test.html', 'utf-8', XML::ParseOptions::DEFAULT_HTML)
#これでもOK
doc = Nokogiri::HTML.parse(html)

puts doc

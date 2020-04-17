#gemの読み込み
require 'nokogiri'
require 'open-uri'


#今回はHTMLをファイルから持ってくる
html = File.open('girigiri.html'){|f| f.read }

#HTMLをDOMに変換
doc = Nokogiri::HTML.parse(html)
puts "--parse---------------"
puts doc.css("p").inner_text
puts "--parse---------------"

ff = File.open("girigiri.html")
charset = ff.chars

doc1 = Nokogiri::HTML.parse(open(f), nil, charset)
puts "--------------------------------------------------"
puts doc1.css("p").inner_text
puts doc1.css("p:nth-child(1)").inner_text
puts doc1.css("p:nth-child(3n)").inner_text
puts "--------------------------------------------------"
ff.close()

puts "-O-O-O-O-O-"
p doc.css("p:nth-child(odd)").text
puts "----"
puts doc.css("p:nth-of-type(1)").inner_text
puts "----"
puts doc.css("p:eq(3)").inner_text

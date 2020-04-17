require 'nokogiri'

f = File.open("2014.html")
doc = Nokogiri::HTML(f)
f.close()

doc.css("table.wikitable.sortable tbody tr").each_with_index do |node, index|
  puts "-- 1 ------------"
  puts node.css("td:eq(1)").inner_text
  puts "-- 2 -----------"
  puts node.css("td:eq(2)").inner_text
  puts "-- 3 ------------"
  puts node.css("td:eq(3)").inner_text
  puts "-- 4 ------------"
  puts node.css("td:eq(4)").inner_text
end

f = File.open("2014.html")
doc = Nokogiri::HTML.parse(open("2014.html"), nil, "UTF-8")
f.close()

nodesets = doc.at_css("tr")
  puts "-- 1 -----------"
  puts nodesets.text
  puts "-- 2 ------------"
  puts nodesets.inner_text
  puts "-- 3 ------------"

  puts "-- 4 ------------"
#  nodesets.each do |nodeset|
#    puts nodeset.text
#    puts nodeset.inner_text
#    puts nodeset.first_element_child
#  end

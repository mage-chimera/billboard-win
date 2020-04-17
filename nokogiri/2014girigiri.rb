require 'nokogiri'
require 'csv'

array = []

CSV.open("seed_songartists.csv", "w") do |csv|
  (1990..2014).each do |year|
    html = File.open("#{year}.html"){|f| f.read }
    doc = Nokogiri::HTML.parse(html)

    doc.css("table.wikitable tr").each_with_index do |node, index|
      next if index == 0
      ranking = node.css("th").inner_text.to_i
      title   = node.css("td:eq(1)").inner_text.gsub(/^"/,"").gsub(/"$/,"")
      artists = node.css("td:eq(2)").css("a")
      artists.each do |artist|
        a = artist.inner_text
        array.push(a) #array は1990年～2014年のアーティストを蓄積したリストを作成するため
        csv << [title, a, ranking, year]
      puts "======================"
      puts "#{index} | #{a}"
      puts "======================"
      end
    end
  end
end

puts "XXXXXXXXXXXXXXXXXXXXX"
puts array                    # 蓄積したリスト
puts "XXXXXXXXXXXXXXXXXXXXX"

lists = array.sort_by{|element| element.upcase}.uniq #arrayは重複しているので、重複を取り除いている。
CSV.open("seed_artists.csv", "w") do |csv|
  lists.each do |list|
    csv << [list]
  puts "++++++++++++++++++++++"
  puts "#{list}"
  puts "++++++++++++++++++++++"
  end
end

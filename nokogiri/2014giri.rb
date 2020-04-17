require 'nokogiri'
require 'csv'

CSV.open("seed_songs.csv", "w") do |csv|
  (1990..2014).each do |year|
    html = File.open("#{year}.html"){|f| f.read }
    doc = Nokogiri::HTML.parse(html)

    doc.css("table.wikitable tr").each_with_index do |node, index|
      next if index == 0
      ranking = node.css("th").inner_text.to_i
      title   = node.css("td:eq(1)").inner_text.gsub(/^"/, "").gsub(/"$/, "")
      artist  = node.css("td:eq(2)").inner_text.chomp
      csv << [title, artist, ranking , year]
    end
  end
end

require 'nokogiri'
require 'csv'

array = []

CSV.open("seed_songartists.csv", "w") do |csv|
  (1990..1990).each do |year|
    html = File.open("#{year}.html"){|f| f.read }
    doc = Nokogiri::HTML.parse(html)

    doc.css("table.wikitable tr").each_with_index do |node, index|
      next if index == 0
      artists  = node.css("td:eq(2)").inner_text.chomp
      anchor  = node.css("td:eq(2)").css("a")
      if anchor.size == 2 then
        anchor.each do |anc|
          puts "#{index} | #{anc.inner_text}"
        end
      end
      #puts "#{index} | #{artists.size} | #{text}"
    end
  end
end

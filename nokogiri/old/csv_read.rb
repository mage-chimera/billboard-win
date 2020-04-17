require "csv"

loop = 5

test = CSV.open('CSV/test.csv','w')
loop.times do
    test.puts ["A","B","C"]
    test.puts ["milk","coffee","water"]
end
test.close

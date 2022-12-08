def input_file(input)
    forest = Array.new
    i = 0
    File.foreach(input) do |row|
        row = row.gsub("\n", "")
        forest.push(row.split(//).map{|char| char.to_i})
        i += 1
    end
    return forest
end

test = input_file('testi.txt')

p test
p test[2][3]

x, y = 1
p x
p y

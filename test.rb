test = Array.new(2){Array.new}
test[0] = ['A', 'B', 'C']
test[1] = ['D', 'E', 'F']


def make_move(stacks, number, from, to)

    stacks[to].push(stacks[from].pop(number)).flatten!

end

test.each do |item|
    p item
end

make_move(test, 2, 1, 0)

test.each do |item|
    p item
end
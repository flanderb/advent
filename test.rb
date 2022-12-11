
rope = Array.new(9) { |i| [i,i] }

head = rope.first

# p rope
# p head

rope_size = 2
rope = Array.new(rope_size){[0,0]}
# rope = [[0,0],[0,0]]

rope.each_index do |index|
    p index
    if index == 0
        p "index is zero"
        rope[index][0] = 5
        p rope[index]
        p rope
    else
        p rope[index]
    end

end
p rope


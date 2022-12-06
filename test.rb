test = "move 7 from 3 to 7\nmove 19 from 7 to 9"


def make_moves(input)
    stacks = Array.new(9){Array.new}
    i = 0

    input.each_line do |line|
        
        if line[0] == "m"
            puts line
            number = /^move (\d+)/.match(line).to_s.delete("move ")
            from_stack = /from (\d+)/.match(line).to_s.delete("from ")
            to_stack = /to (\d+)/.match(line).to_s.delete("to ")
            puts number
            puts from_stack
            puts to_stack
        end
        i += 1

    end
end

make_moves(test)
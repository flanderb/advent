class Ship
    def initialize(input)
        @stacks = initialize_stacks(input)
        @stacks = make_moves(input, @stacks)
        @top_containers = tops(@stacks)
    end

    attr_reader :top_containers, :stacks

    def initialize_stacks(input)
        stacks = Array.new(9){Array.new}
        i = 0

        File.foreach(input) do |line|

            if line[0] == "["
                puts "#{i}-------"
                puts line
                #Still in the initializing phase
                stacks[0][i] = line[1]
                stacks[1][i] = line[5]
                stacks[2][i] = line[9]
                stacks[3][i] = line[13]
                stacks[4][i] = line[17]
                stacks[5][i] = line[21]
                stacks[6][i] = line[25]
                stacks[7][i] = line[29]
                stacks[8][i] = line[33]
            end
            i += 1
        end

        #delete empty slots
        stacks.each do |stack|
            stack.delete(' ')
        end

        # reverse stack
        stacks.each do |stack|
            stack.replace(stack.reverse)
        end

        return stacks.clone
    end

    def make_moves(input, stacks)


        File.foreach(input) do |line|

            if line[0] == "m"
                # puts line
                move_number = /^move (\d+)/.match(line).to_s.delete("move ").to_i
                from_stack = /from (\d+)/.match(line).to_s.delete("from ").to_i
                to_stack = /to (\d+)/.match(line).to_s.delete("to ").to_i
                from_stack -= 1
                to_stack -= 1
                puts "move #{move_number}"
                puts "from #{from_stack}"
                puts "to #{to_stack}"
                make_move(stacks, move_number, from_stack, to_stack)
            end
        end
        return stacks.clone
    end


    def make_move(stacks, number, from, to)

        stacks[to].push(stacks[from].pop(number)).flatten!

    end

    def tops(stacks)
        top = ""
        stacks.each do |stack|
            top << stack.last
        end
        return top
    end



end


ship  = Ship.new("day5i.txt")
ship.stacks.each do |stack|
    p stack
    puts "---_--_--_--_-__-_"
end
puts "+++++++++++++++++++++++++"
ship.stacks.each do |stack|
    p stack.pop
    puts "---_--_--_--_-__-_"
end

puts ship.top_containers


class Ship
    def initialize(input)
        @stacks = initialize_stacks(input)
        @stacks = make_moves(input, @stacks)
        # @top_containers = get_top_containers(@stacks)
    end

    attr_reader :stacks

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
                move_number = /^move (\d+)/.match(line).to_s.delete("move ")
                from_stack = /from (\d+)/.match(line).to_s.delete("from ")
                to_stack = /to (\d+)/.match(line).to_s.delete("to ")
                # puts number
                # puts from_stack
                # puts to_stack
                make_move(stacks, move_number, from_stack, to_stack)
            end
        end
        return stacks.clone
    end


    def make_move(stacks, number, from, to)
        
    end


end


ship  = Ship.new("day5i.txt")
ship.stacks.each do |stack|
    puts stack
    puts "---_--_--_--_-__-_"
end
class Rope
    def initialize(input)
        @visited_positions = input_file(input)
        @num_tail_visited = @visited_positions.uniq.length

        input_file(input)
    end

    attr_reader :visited_positions, :num_tail_visited

    def input_file(input)
        visited_positions = Array.new
        rope_size = 10
        rope = Array.new(rope_size){[0,0]}

        File.foreach(input) do |line|
            p "--_--_--_--_--__-__--_--_--_--__-__-__-__--_--_-__--__--_--__--_--__--_--__--_---_--__-_-__--_--_--__"
            direction, distance = line.split
            distance = distance.to_i
            # p "#{direction} - #{distance}"
            distance.times do |iteration|
                p "==+==+==+==+==+==++==+==+===++"
                p "Distance = #{distance}, iteration = #{iteration} direction = #{direction}"
                rope = move_rope(rope, direction)
                # p "~~~~~~~~~~~~~~~~~~~~~~~"
                p rope
                # p "~~~~~~~~~~~~~~~~~~~~~~~"
                visited_positions.push(rope.last.join(","))
            end
        end
        return visited_positions
    end

    def move_rope(rope, dir)
        # p "dir = #{dir}"
        rope.each_index do |index|
            # p "******************"
            # p "knot = #{index}"
            # p "rope_b = #{rope}"
            # p "rope[#{index}] = #{rope[index]} "
            # p "rope[#{index - 1}] = #{rope[index - 1]} "
            if index == 0
                case dir
                when "U"
                    rope[index][1] += 1
                when "D"
                    rope[index][1] -= 1
                when "L"
                    rope[index][0] -= 1
                when "R"
                    rope[index][0] += 1
                end
            else
                # p "leader = #{rope[index - 1]}"
                leader = rope[index - 1]
                # p "follower = #{rope[index]}"
                follower = rope[index]

                x_diff = leader[0] - follower[0]
                y_diff = leader[1] - follower[1]
                p "leader = #{leader}; follower = #{follower}"
            
                if x_diff.abs == 2 && y_diff.abs == 1
                    follower[0] += x_diff/2
                    follower[1] += y_diff 
                elsif y_diff.abs == 2 && x_diff.abs == 1
                    follower[0] += x_diff 
                    follower[1] += y_diff/2                
                elsif y_diff.abs == 2 && x_diff.abs == 2
                    follower[0] += x_diff/2
                    follower[1] += y_diff/2
                elsif x_diff.abs == 2 && y_diff == 0
                    follower[0] += x_diff/2
                elsif y_diff.abs == 2 && x_diff == 0
                    follower[1] += y_diff/2
                end
            end
        end
    end
end
# 

# today = Rope.new("day9i.txt")
today = Rope.new("day9i.txt")

p today.visited_positions
p today.visited_positions.uniq

puts today.num_tail_visited

#The 1,2 is wrong
# "Distance = 8, iteration = 2 direction = U"
#   24   │ [[5, 3], [5, 2], [4, 1], [3, 1], [2, 1], [1, 1], [0, 0], [0, 0], [0, 0], [0, 0]]
#   25   │ "==+==+==+==+==+==++==+==+==+"
#   26   │ "Distance = 8, iteration = 3 direction = U"
#   27   │ [[5, 4], [5, 3], [5, 2], [4, 2], [3, 2], [2, 2], [1, 2], [1, 1], [0, 0], [0, 0]]

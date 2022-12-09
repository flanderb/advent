class string
    def initialize(input)
        @visited_positions = Array.new

        input_file(input)
    end

    attr_reader :visited_positions

    def input_file(input)
        visited_positions = Array.new
        head = [0,0]
        tail = [0,0]

        File.foreach(input) do |line|
            direction, distance = line.split
            distance.times do |direction|
                head = move_head(head, direction)
                tail = move_tail(head, tail)
                visited_positions.push(tail.join)
            end
        end
    end

    def move_head(head, dir)
        case dir
        when "U"
            head[1] += 1
        when "D"
            head[1] -= 1
        when "L"
            head[0] -= 1
        when "R"
            head[0] += 1
        end
        return head
    end

    def move_tail(head, tail)
        if !is_tail_next_to_head(head, tail)
            case dir
            when "U"
                tail[1] += 1
            when "D"
                tail[1] -= 1
            when "L"
                tail[0] -= 1
            when "R"
                tail[0] += 1
            end
            return tail
        end
    end

    def is_tail_next_to_head(head, tail)
        x_diff = head[0] - tail[0]
        y_diff = head[1] - tail[1]
        return x_diff <= 1 && y_diff <= 1
    end


end


today = Jobs.new("testi.txt")
puts today.visited_positions
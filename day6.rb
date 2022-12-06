class Datastream
    def initialize(input)
        @data_stream = input_file(input)
        @marker_size = 14
        @first_marker = find_first_marker(@data_stream)

    end

    attr_reader :data_stream, :first_marker

    def input_file(input)
        File.open(input).read
    end

    def find_first_marker(stream)
        x = @marker_size +1
        stream.each_char.with_index(x) do |char, i|
            p i
            # p "stream[#{i}..#{i + 4}]"
            temp_array = stream[i-x..i].chars.uniq
            p temp_array
            p temp_array.size
            if temp_array.size == x
                x = i
                break
            end
        end
        return x+1
    end






end


today = Datastream.new("day6i.txt")
p today.first_marker
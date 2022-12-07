class Datastream
    def initialize(input, marker_size)
        @data_stream = input_file(input)
        @first_marker = find_first_marker(@data_stream, marker_size)

    end

    attr_reader :data_stream

    def input_file(input)
        File.open(input).read
    end

    def find_first_marker(stream, marker_size)
        z = marker_size - 1 # because of zero based arrays
        stream.each_char.with_index(z) do |char, i|
            # p "i = #{i}; z=#{z} "
            # p "stream[#{i-z}..#{i}]"
            temp_array = stream[i-z..i].chars
            # p temp_array
            temp_array = temp_array.uniq
            # p temp_array
            if temp_array.size == marker_size
                z = i + 1 # because of zero based arrays
                break
            end
        end
        return z 
    end
end


today = Datastream.new("day6i.txt", 14)
p today.first_marker
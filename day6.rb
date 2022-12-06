class Datastream
    def initialize(input)
        @start_of_packet_marker = find_marker(input)
    end

    attr_reader :start_of_packet_marker

    def find_marker(input)
        File.each_char(input) do |char|
        end

    end


end


data = Datastream.new("day6i")
puts data.start_of_packet_marker
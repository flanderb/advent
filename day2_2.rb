class Rpc
    def initialize(input)
        @total_score
        input_file(input)
    end

    attr_reader :total_score

    def input_file(input)
        @total_score = 0
        File.foreach(input) do |line|
            @total_score += self.score_line(line)
        end
    end

    def score_line(line)
        shape = score_shape(line)
        outcome = score_outcome(line)
        return shape + outcome
    end

    def score_shape(line)
        composite = line[0] + line[2]
        case composite
        when 'AY', 'BX','CZ'
            1
        when 'AZ', 'BY', 'CX'
            2
        when 'AX', 'BZ', 'CY'
            3
        end
    end

    def score_outcome(line)
        case line[2]
        when 'X'
            0
        when 'Y'
            3
        when 'Z'
            6
        end
    end
end


today = Rpc.new("strat")
puts today.total_score

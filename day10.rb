class Cpu
    def initialize(input)
        @cycles = [1]
        input_file(input)
        @strength = calculate_strength(@cycles)
    end

    attr_reader :cycles, :register, :strength

    def input_file(input)

        File.foreach(input) do |line|
            process_instruction(line)
        end
    end

    def process_instruction(line)
        instruction, num = line.split

        if instruction == "noop"
            @cycles.push(@cycles.last)
        else
            num = num.to_i
            @cycles.push(@cycles.last)
            @cycles.push(@cycles.last + num)
        end
    end

    def calculate_strength(cycles)
        strength = 0
        [20, 60, 100, 140, 180, 220].each do |cycle|
            cycle = cycle -1
            # p cycles[cycle]
            strength += (cycle + 1) * cycles[cycle]
        end
        return strength
    end

    def write_crt (cycles)
        line = ""
        # line1 = cycles[0..39].join
        # line2 = cycles[40..79].join
        # line3 = cycles[80..119]
        # line4 = cycles[120..159]
        # line5 = cycles[160..199]
        # line6 = cycles[200..239]

        (0..239).step(40) do |i|
            # p cycles[i-40, i].join
            40.times do 
                line << "."
            end
            p line
            line = ""
        end
        return line
    end


end


today = Cpu.new("testi.txt")
# p today.cycles
# puts today.strength
puts today.write_crt(today.cycles)
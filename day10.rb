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
        pixel = 0
        cycles.each do |cycle|
            # p [index, cycle]
            if ((cycle -1)..(cycle + 1)).include?(pixel)
                line << "#"
                p "#{pixel} = #{((cycle -1)..(cycle + 1))} = #"
            else
                line << "."
                p "#{pixel} = #{((cycle -1)..(cycle + 1))} = ."
            end
            pixel += 1
            if pixel % 40 == 0
                pixel = 0
            end
        end

        # p line
        [40,80,120,160,200,240].each do |i|

            p line[i - 40, 40]

        end
        



        # (0..239).step(40) do |i|
        #     # p cycles[i-40, i].join
        #     40.times do 
        #         line << "."
        #     end
        #     p line
        #     line = ""
        # end
        # return line
    end


end


today = Cpu.new("day10i.txt")
p today.cycles
puts today.strength
puts today.write_crt(today.cycles)

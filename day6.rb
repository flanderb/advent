class Datastream
    def initialize(input)
        @contained_pairs = 0
        input_file(input)
    end

    attr_reader :contained_pairs

    def input_file(input)

        File.foreach(input) do |line|
            one_tasks = get_tasks(line, 0)
            two_tasks = get_tasks(line, 1)
            if contained_pair?(one_tasks, two_tasks)
                @contained_pairs += 1
            end
        end
    end

    def get_tasks(line, elf)
        elfs_tasks_string = line.split(",")[elf]
        elfs_tasks = elfs_tasks_string.split("-").map{|a| a.to_i}.to_a
    end

    def contained_pair?(elf1, elf2)
        r1 = Range.new(elf1[0], elf1[1], false)
        r2 = Range.new(elf2[0], elf2[1], false)
        return ((r1.to_a & r2.to_a) == r1.to_a) || ((r2.to_a & r1.to_a) == r2.to_a)
    end


end


today = Jobs.new("day4i")
puts today.contained_pairs
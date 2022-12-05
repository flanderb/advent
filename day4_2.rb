class Jobs
    def initialize(input)
        @overlapped_pairs = 0
        input_file(input)
    end

    attr_reader :overlapped_pairs

    def input_file(input)

        File.foreach(input) do |line|
            one_tasks = get_tasks(line, 0)
            two_tasks = get_tasks(line, 1)
            if overlapped_pair?(one_tasks, two_tasks)
                @overlapped_pairs += 1
            end
        end
    end

    def get_tasks(line, elf)
        elfs_tasks_string = line.split(",")[elf]
        elfs_tasks = elfs_tasks_string.split("-").map{|a| a.to_i}.to_a
    end

    def overlapped_pair?(elf1, elf2)
        r1 = Range.new(elf1[0], elf1[1], false)
        r2 = Range.new(elf2[0], elf2[1], false)
        return r2.begin <= r1.end && r1.begin <= r2.end
    end


end


today = Jobs.new("day4i")
puts today.overlapped_pairs
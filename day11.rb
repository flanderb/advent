class Monkey
    def initialize(name, items, operations, test, true_action, false_action)
        @name = 0
        @items = []
        @operations = []
        @test = 0
        @true_action = 0
        @false_action = 0
    end
end


class KeepAway
    def initialize(input)
        name = 0
        File.foreach(input) do |line|
            if line[0] == 'M'
                @name = line.tr_s('Monkey :', '')
            elsif line[2] == 'S'
                @items = line.tr_s('Starting items: ', '').split(',')
            elsif line[2] == 'O'
                operator = line.tr_s('Operation: new = old', '')[0]
                num = line.tr_s('Operation: new = old', '')[1..-1]
                @operations = [operator, num]
            elsif line[2] == 'T'
                @test = line.split[-1]
            elsif line[7] == 't'
                @true_action = line.split[-1]
            elsif line[7] == 'f'
                @false_action = line.split[-1]
            end
        end
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
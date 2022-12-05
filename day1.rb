class Elf
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    attr_accessor :name, :calories

    
end

class Group
    def initialize()
        @group = Array.new
    end

    attr_reader :group

    def input_file(input)
        elf_name = 1
        elf = Elf.new(elf_name, 0)
        File.foreach(input) do |line| 
            line = line.chomp
            if line.length == 0 then
                self.add_elf(elf)
                elf_name += 1
                elf = Elf.new(elf_name, 0)
            else
                elf.calories = elf.calories + line.to_i
            end
        end
    end

    def add_elf(elf)
        @group<<elf
    end

    def num_of_elves
        @group.length
    end

    def top3
        sorted = @group.sort_by {|elf| elf.calories}.reverse
        sorted[0].calories + sorted[1].calories + sorted[2].calories

    end

    def most_calories
        best_elf = Elf.new("test", 0)
        group.each do |elf|
            if elf.calories > best_elf.calories then
                best_elf = elf
            end
        end
        return best_elf
    end

    def to_s
        temp = ""
        @group.each do |elf|
            temp = temp + "elf name #{elf.name} total calories #{elf.calories}\n"
        end
        return temp
    end

end


my_group = Group.new()
my_group.input_file("input")

puts my_group.to_s

p my_group.most_calories

p my_group.top3
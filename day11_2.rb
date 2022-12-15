class Monkey
    attr_accessor :name, :items, :num_inspections, :div_test, :worry_divisor

    def initialize(name, items, operations, div_test, true_monkey, false_monkey)
        @name = name
        @items = items
        @operations = operations
        @div_test = div_test
        @true_monkey = true_monkey
        @false_monkey = false_monkey
        @num_inspections = 0
        @worry_divisor = 1
    end

    def inspect_items
        temp_item = []
        thrown_items = []
        new_item = 0
        @items.each do |old_item|
            new_item = eval(@operations.gsub("old", old_item.to_s ))
            # p "old_item #{old_item}   new item #{new_item}  "
            if new_item % @div_test == 0
                #pass to true monkey
                temp_item.push(@true_monkey)
            else
                #pass to false monkey
                temp_item.push(@false_monkey)
            end
            temp_item.push(new_item % worry_divisor)
            thrown_items.push(temp_item.clone)
            # p thrown_items
            temp_item.clear
            # item.clear
            @num_inspections += 1
        end
            # p thrown_items 
            @items.clear
            return thrown_items
    end

    def add_item(item)
        @items.push(item)
    end

end


class KeepAway
    def initialize(input, rounds)
        @monkeys = []
        input_file(input)
        update_worry_divisor(@monkeys)
        play(@monkeys, rounds)
    end

    attr_reader :monkeys

    def update_worry_divisor(monkeys)
        worry_divisor = 1
        monkeys.each do |monkey|
            p monkey
            worry_divisor = worry_divisor * monkey.div_test
        end
        monkeys.each do |monkey|
            monkey.worry_divisor = worry_divisor
        end
    end


    def input_file(input)
        name = 0
        items = []
        operations = ""
        line_test = []
        true_monkey = 0
        false_monkey = 0

        File.foreach(input) do |line|
            if line[0] == 'M'
                name = line.tr_s('Monkey :', '').to_i
            elsif line[2] == 'S'
                items = line.tr_s('Starting items: ', '').split(',')
                items = items.map{|item| item.chomp.to_i}
            elsif line[2] == 'O'
                operations = line.partition("= ").last.chomp
            elsif line[2] == 'T'
                line_test = line.split[-1].to_i
            elsif line[7] == 't'
                true_monkey = line.split[-1].to_i
            elsif line[7] == 'f'
                false_monkey = line.split[-1].to_i
            else
                @monkeys.push(Monkey.new(name, items, operations, line_test, true_monkey, false_monkey))
            end
            
        end
        @monkeys.push(Monkey.new(name, items, operations, line_test, true_monkey, false_monkey))
    end

    def play(monkeys, rounds)
        rounds.times do |round|
            monkeys.each do |monkey|
                target_monkeys = monkey.inspect_items
                target_monkeys.each do |target|
                    new_monkey = target[0]
                    new_item = target[1]
                    monkeys[new_monkey].add_item(new_item)
                end
            end
            # p round
            if [1, 20, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000].include?(round+1)
                p "== After round #{round+1} =="
                monkeys.each do |monkey|
                    p "Monkey #{monkey.name} inspected items #{monkey.num_inspections} times"
                end
            end
        end
    end

    def monkey_business
        inspections = []
        monkeys.each do |monkey|
            inspections.push(monkey.num_inspections)
        end
        return inspections.sort.reverse[0] * inspections.sort.reverse[1]
    end
end


today = KeepAway.new("day11.txt", 10000)
m =  today.monkeys

# m.each do |monkey|
#     p "Monkey #{monkey.name} inspected items #{monkey.num_inspections} times"
# end
p "monkey business #{today.monkey_business}"

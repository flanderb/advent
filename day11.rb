class Monkey
    def initialize(name, items, operations, div_test, true_monkey, false_monkey)
        @name = name
        @items = items
        @operations = operations
        @test = div_test
        @true_monkey = true_monkey
        @false_monkey = false_monkey
        @num_inspections = 0
    end

    def inspect_items
        @items.each do |item|
            new_item = eval(@operations.gsub("old", item.to_s ).eval)/3
            if new_item % @div_test == 0
                
            @num_inspections += 1
        end
    end

    def add_item(item)
        @items.push(item)
    end

end


class KeepAway
    def initialize(input, rounds)
        @monkeys = []
        input_file(input)
        play(@monkeys, rounds)
    end

    attr_reader :monkeys

    def input_file(input)
        name = 0
        items = []
        operations = ""
        test = []
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
                test = line.split[-1].to_i
            elsif line[7] == 't'
                true_monkey = line.split[-1].to_i
            elsif line[7] == 'f'
                false_monkey = line.split[-1].to_i
            else
                @monkeys.push(Monkey.new(name, items, operations, test, true_monkey, false_monkey))
            end
            
        end
        @monkeys.push(Monkey.new(name, items, operations, test, true_monkey, false_monkey))
    end

    def play(monkeys, rounds)
        rounds.times do 
            monkeys.each do |monkey|
                monkey.inspect_items
            end
        end
    end
end


today = KeepAway.new("testi.txt", 1)
m =  today.monkeys

m.each do |n|
    p n
end


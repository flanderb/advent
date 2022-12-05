class Elf_Groups
    def initialize(input)
        
        @elves_grouping = input_file(input)
        @common_items = get_list_of_common_items(@elves_grouping)
        @total_priority = pritoritize_items(@common_items)
    end

    attr_reader :total_priority, :common_items, :elves_grouping

    def input_file(input)
        master_temp = Array.new
        input_file = File.read(input).split
        i = 1
        temp = Array.new
        input_file.each do |line|
            temp.push(line)
            if i % 3 == 0
                #we now have 3 lines
                master_temp.push(temp.clone)
                temp.clear
            end
            i += 1
        end
        return master_temp
    end

    def find_dup_items(line1, line2)
        dup_items = Array.new

        line1.each_char do |item|
            if line2.include?(item)
                dup_items.push(item)
            end
        end
        return dup_items.join
    end

    def get_list_of_common_items(groups)
        list = ""
        groups.each do |group|
            list << find_common_item_of_group(group)
        end
        return list
    end

    def find_common_item_of_group(group)
        common1 = find_dup_items(group[0], group[1])
        # puts "common1 = #{common1}"
        common2 = find_dup_items(common1, group[2])
        # puts "Common2 = #{common2}"
        return common2[0]
    end

    def score_item(item)
        priority = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
        priority.index(item) + 1
    end

    def pritoritize_items(items)
        score = 0
        items.each_char do |item|
            score += score_item(item)
        end
        return score
    end
    
end

today = Elf_Groups.new('day3i')

puts today.total_priority

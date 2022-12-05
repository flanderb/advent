# require 'set'

line = "2-20,21-24"

def get_tasks(line, elf)
    elfs_tasks_string = line.split(",")[elf]
    elfs_tasks = elfs_tasks_string.split("-").map{|a| a.to_i}.to_a
end



one =  get_tasks(line, 0)
two =  get_tasks(line, 1)

puts one
puts two

def overlap_pair?(elf1, elf2)
    r1 = Range.new(elf1[0], elf1[1], false)
    r2 = Range.new(elf2[0], elf2[1], false)
    return r2.begin <= r1.end && r1.begin <= r2.end
end

puts overlap_pair?(one, two)
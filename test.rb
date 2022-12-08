# test = {'/': 0} 

# test['this'] = 0

# p test

# puts "-_--_--_--__-__-__-__-__"

# test.each do |dir, size|
#     p "#{dir} -> #{size} "
# end
# puts "-_--------__-__-_--_-__-"
# test.each do |dir, size|
#     test[dir] += 45
# end

# test.each do |dir, size|
#     p "#{dir} -> #{size} "
# end

input_file = "day7i.txt"

def populate(input)
    File.foreach(input) do |line|
        temp =  line.gsub(/[$ ]/, '')[0]
        case temp
        when 'c'
            #cd this is a change directory command update dir_tree
            # self.update_dir_tree(line.gsub(/[cd ]/, ''))
            p "cd #{temp}-#{line}"
        when /\d/
            #this is a file add to current dir_tree entries
            # update_dir_size(line.gsub(/\D/, ''))
            p "file #{temp}-#{line}"
        when 'd'
            #dir this is a directory Ignore
            p "dir#{temp}-#{line}"
        when 'l'
            # ls ignore
            p "ls #{temp}-#{line}"
        end
    end
end

p populate(input_file) 

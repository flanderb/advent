class Node
    attr_accessor :children, :value
        
    def initialize(v)
        @value = v
        @children = []

    end
end

class Filesystem
    def initialize(input)
        @system = populate(input)
        @dir_size = = {'/': 0} 
        @dir_tree = Array.new

    end

    attr_reader :system, :dir_size, :dir_tree

    def populate(input)
        File.foreach(input) do |line|
            case line.gsub(/[$ ]/, '')[0]
            when 'c'
                #cd this is a change directory command update dir_tree
                update_dir_tree(line.gsub(/[cd ]/, ''))
            when match(/[0-9]/)
                #this is a file add to current dir_tree entries
                update_dir_size(line.gsub(/\D/, ''))
            when 'd'
                #dir this is a directory Ignore
            when 'l'
                # ls ignore
            end
    end

    def update_dir_tree(directory)
        case directory
        when "/"
            @dir_tree.clear
            @dir_tree.push('/')
        when ".."
            @dirtree.pop
        else
            @dir_tree.push directory
            @dir_size[diectory] = 0
        end
    end

    def update_dir_size(line)
        @dir_size.each do 
    end


end


today = Datastream.new("day6i.txt")
p today.first_marker
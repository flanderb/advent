class Filesystem

    attr_reader :dir_size, :dir_tree, :total_small_dirs

    def initialize(input)
        
        @dir_size = Hash.new
        @dir_tree = Array.new
        populate(input)
        @total_small_dirs = add_small_directories(@dir_size)

    end

    def populate(input)
        File.foreach(input) do |line|
            line = line.gsub("\n", "").gsub("$ ", "")
            # p line
            case line[0]
            when 'c'
                #cd this is a change directory command update dir_tree
                update_dir_tree(line.gsub("cd ", ''))
            when /\d/
                #this is a file add to current dir_tree entries
                update_dir_size(line.gsub(/\D/, ''))
            when 'd'
                #dir this is a directory Ignore
            when 'l'
                # ls ignore
            end
        end
    end

    def update_dir_tree(dir)
        case dir
        when "/"
            @dir_tree.clear
            @dir_tree.push('/')
            @dir_size[dir] =  0
        when ".."
            @dir_tree.pop
        else
            temp = @dir_tree.join << dir
            @dir_tree.push temp
            @dir_size[temp] = 0
        end
        # p @dir_tree
    end

    def update_dir_size(line)
 
        @dir_tree.each do |dir|
            @dir_size[dir] += line.to_i
        end
        # p @dir_size
    end

    def add_small_directories(all_dir)
        total = 0
        all_dir.each do |dir, size|
            if size <= 100000
                # p dir
                total += size
            end
        end
        return total
    end

    def free_up_space
        space_from_dir = 0
        disk_size = 70000000
        update_needs = 30000000
        used = @dir_size["/"]
        unused_space = disk_size - used
        p unused_space
        need_free_up = update_needs - unused_space
        p need_free_up
        
        size_array = @dir_size.values
        p size_array
        size_array.sort!
        p size_array

        size_array.each do |size|
            if size > need_free_up
                space_from_dir = size
                break
            end
        end
        return space_from_dir

    end


end

# files = Filesystem.new("testi.txt")
files = Filesystem.new("day7i.txt")
# p files.dir_size
p files.total_small_dirs
p "--_--_--_--_--_-__-__-__-_--_"
p files.free_up_space
class Forest
    def initialize(input)
        @forest = input_file(input)
        @viewable_trees = find_viewable_trees(@forest)
    end

    attr_reader :viewable_trees

    def input_file(input)
        forest = Array.new
        i = 0
        File.foreach(input) do |row|
            row = row.gsub("\n", "")
            forest.push(row.split(//).map{|char| char.to_i})
            i += 1
        end
        return forest
    end

    def find_viewable_trees(forest)
        viewable_trees = Array.new
        # x, y = 0, 0

        forest.each_index do |row|
            forest[row].each_index do |column|
                puts "[#{row}, #{column}] = #{forest[row][column]}"
                if viewable_tree(forest, row, column)
                    viewable_trees.push("#{row}#{column}")
                end
            end
        end
        return viewable_trees
    end

    def viewable_tree(forest, x, y)
        return viewable_from_east?(forest, x, y)
    end


    def viewable_from_east?(forest, x, y)
        #get height of tree
        height = forest[x][y]
        height_to_east = 0
        for a in x..0
            if forest[a][y] > height_to_east
                height_to_east = forest[a][y]
            end
        end
        p "forest[#{x}][#{y}]"
        p height
        p height_to_east
        p height > height_to_east
        return height > height_to_east
    end
end


today = Forest.new("testi.txt")
p today.viewable_trees
p today.viewable_trees.length

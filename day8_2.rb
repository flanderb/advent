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

    def find_best_view(forest)
        best_view = 0

        forest.each_index do |row|
            forest[row].each_index do |column|
                puts "[#{row}, #{column}] = #{forest[row][column]}"
                view = view_from_tree(forest, row, column)
                # puts viewable
                if view > best_view
                    best_view = view
                end
            end
        end
        return best_view
    end

    def view_from_tree(forest, row, column)
        east = view_to_east?(forest, row, column)
        west = view_to_west?(forest, row, column)
        north = view_to_north?(forest, row, column)
        south = view_to_south?(forest, row, column)

        p "[#{row},#{column}}] north = #{north}"
        p "[#{row},#{column}}] south = #{south}"
        p "[#{row},#{column}}] east = #{east}"
        p "[#{row},#{column}}] west = #{west}"
        p "#{east * west * north * south}"

        
        return east * west * north * south
    end


    def view_to_east?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        height_to_east = -1
        p "[#{row}][#{column}] east -_---_-_-_-_-_-_-_"
        for a in 0..column-1
            p "forest[#{row}][#{a}] = #{forest[row][a]}"
            if forest[row][a] > height_to_east #&& column != a
                height_to_east = forest[row][a]
            end
        end
        # p "forest[#{x}][#{y}]"
        p height
        p height_to_east
        p height > height_to_east
        return height > height_to_east
    end

    def view_to_west?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        height_to_west = -1
        p "[#{row}][#{column}] west -_---_-_-_-_-_-_-_"
        for a in column+1..forest[0].length-1
            p "forest[#{row}][#{a}] = #{forest[row][a]}"
            if forest[row][a] > height_to_west #&& a != forest[0].length
                height_to_west = forest[row][a]
            end
        end
        # p "forest[#{x}][#{y}]"
        p height
        p height_to_west
        p height > height_to_west
        return height > height_to_west
    end

    def view_to_north?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        height_to_north = -1
        p "[#{row}][#{column}] north -_---_-_-_-_-_-_-_"
        for a in 0..row-1
            p "forest[#{a}][#{column}] = #{forest[a][column]}"
            if forest[a][column] > height_to_north #&& a != forest.length
                height_to_north = forest[a][column]
            end
        end
        # p "forest[#{x}][#{y}]"
        p height
        p height_to_north
        p height > height_to_north
        return height > height_to_north
    end
end

def view_to_south?(forest, row, column)
    #get height of tree
    height = forest[row][column]
    height_to_south = -1
    p "[#{row}][#{column}] south -_---_-_-_-_-_-_-_"
    for a in row+1..forest.length-1
        p "forest[#{a}][#{column}] = #{forest[a][column]}"
        if forest[a][column] > height_to_south #&& a != forest.length
            height_to_south = forest[a][column]
        end
    end
    # p "forest[#{x}][#{y}]"
    p height
    p height_to_south
    p height > height_to_south
    return height > height_to_south
end


today = Forest.new("testi.txt")
p today.viewable_trees
p today.viewable_trees.length

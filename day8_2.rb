class Forest
    def initialize(input)
        @forest = input_file(input)
        @best_view = find_best_view(@forest)
    end

    attr_reader :best_view

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
                # puts "[#{row}, #{column}] = #{forest[row][column]}"
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

        # p "[#{row},#{column}] north = #{north}"
        # p "[#{row},#{column}] south = #{south}"
        # p "[#{row},#{column}] east = #{east}"
        # p "[#{row},#{column}] west = #{west}"
        # p "#{east * west * north * south}"

        
        return east * west * north * south
    end


    def view_to_east?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        range = 0..column - 1
        view_count = 0
        range.reverse_each do |col|
            if forest[row][col] >= height
                view_count += 1
                break
            else
                view_count += 1
            end
        end
        return view_count
    end

    def view_to_west?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        range = (column + 1)..(forest[row].length - 1)
        view_count = 0
        range.each do |col|
            if forest[row][col] >= height
                view_count += 1
                break
            else
                view_count += 1
            end
        end
        return view_count
    end

    def view_to_north?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        range = 0..(row - 1)
        view_count = 0
        range.reverse_each do |row|
            if forest[row][column] >= height
                view_count += 1
                break
            else
                view_count += 1
            end
        end
        return view_count
    end


    def view_to_south?(forest, row, column)
        #get height of tree
        height = forest[row][column]
        range = (row + 1)..(forest.length - 1)
        view_count = 0
        range.each do |row|
            if forest[row][column] >= height
                view_count += 1
                break
            else
                view_count += 1
            end
        end
        return view_count 
    end

end

today = Forest.new("day8i.txt")
p today.best_view


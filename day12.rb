class Node 
    attr_accessor :x, :y, :height, :distance, :parent

    def initialize(x:, y:, height:, distance: Float::INFINITY)
        @x = x
        @y = y
        @height = height
        @distance = distance
        @parent = [0,0]
    end
end


class Maze
    attr_accessor :maze, :m_start, :m_end
    def initialize(input)
        @maze, @m_start, @m_end = MazeFile.new (input)
    end
    # 1. Encapsulate the in-memory maze data here.
    # 2. Provide methods giving read access to the maze data.
    # 3. Provide methods to initialize the maze data. A constructor could work.
end

class MazeFile
    attr_accessor :maze
    def initialize(file)
        @maze = input_file(file)
    end

    def input_file(file)
        line_num = File.foreach(file).inject(0) {|c, line| c+1}
        maze = Hash.new{|h, k| h[k] = []}

        m_start = ""
        m_end = ""
        File.foreach(file) do |line|
            line_num -= 1
            line.split('').each_with_index do |height,index|
                # p "#{line_num} #{index}"
                maze[index][line_num] = Node.new(x: index,y: line_num, height: height)
                if height == 'S'
                    m_start = Node.new(x: index,y: line_num,height: height)
                    p "start #{index} - #{line_num}"
                elsif height == "E"
                    m_end = Node.new(x: index,y: line_num,height: height)
                    p "end #{index} - #{line_num}"
                end
            end
        end
        return [maze, m_start, m_end]
    end
    # 1. Move reading and parsing a maze file here.
    # 2. Parsing a file should produce a Maze object.
end

class MazeSolution
    # 1. Encapsulate data that describes a solution to a maze.
    # 2. Provide methods to initialize and/or build a solution step by step.
    # 3. Provide a method that returns the solution as a formatted string
end

class MazeSolver
    # 1. Move the solve method here. 
    # The method should take a Maze as a parameter and return a MazeSolution.
    # It should not mutate the Maze given as a parameter.
end

# Main program (for command line interface)
    # 1. Read command line
    # 2. Use MazeFile to read a Maze from a file.
    # 3. Use MazeSolver to produce a MazeSolution by calling the solve method
    # 4. Print the solution using MazeSolutions formatting

today = Maze.new("testi.txt")
p today.m_start
p today.m_end
p today.maze
line_num = File.foreach("testi.txt").inject(0) {|c, line| c+1}
p line_num

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

class test
    attr_accessor :x, :y, :z
    def initialize
        @x = 1
        @y = 2
        @z = 3
    end
end






a = Hash.new{|h, k| h[k] = []}

# a = Array.new(Array.new(0))
# a.push [0][0]
# a.push [1][0]
# a.push [0][1]
# a.push [1][1]
# p a

a[1][0] = 0
a[1][1] = Node.new(x: 1, y: 1, height: a)
p a[1][1]
p a

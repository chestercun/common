module Common
  Red = :red
  Black = :black
  Infinity = 1e1000

  class Vertex
    attr_accessor :name, :visited, :prev, :cost, :dist, :path, :adjacent_a, :adjacent_q

    def initialize(n='')
      @name = n
      @adjacent_a = []
      @adjacent_q = nil # for now
    end

    def reset
      @dist = @cost = Infinity
      @path = @prev = nil
      @visited = false
    end

    def addAdj(vertex)
      @adjacent_a.push( vertex )
    end

    def neighbors
      @adjacent_a.dup
    end

    def visited?
      self.visited.eql? true
    end
  end
end

# we need the file utilities
require 'utility/file_utility'
include FileUtility

module Common

  # everybody loves graphs
  class Graph
    attr_reader :directed, :vertices

    def initialize(directed=true)
      @directed = directed
      @vertices = {}
    end

    public

    def addEdge(from,to,weight=0)
      u = getVertex(from)
      w = getVertex(to)
      u.addAdj(w)
      if self.undirected?
        w.addAdj(u)
      end
    end

    def directed?
      @directed
    end
    
    def undirected?
      !self.directed?
    end

    # load up graph from text file
    def load_graph(filename)
      lines = line_arr(filename)
      lines.each do |line|
        data = line.split(' ')
        self.addEdge(data[0],data[1],data[2])
      end
    end

    # depth first searching
    def run_dfs(initial=nil)
      initial = !initial.nil? ? initial : @vertices.keys.first
      u = getVertex( initial )
      dfs( u )
    end

    # shortest path
    def shortest_path(from,to)
      dijkstra(from)
      show_path(to)
    end

    private

    def getVertex(name)
      name_sym = name.to_sym
      if @vertices[name_sym].nil?
        v = Common::Vertex.new(name)
        @vertices[name_sym] = v
      end
      @vertices[name_sym]
    end

    # run Dijkstra's Algorithm
    def dijkstra(name)

    end

    # show path of "previous"
    def show_path(name)

    end

    # run a depth first search
    # starting from
    def dfs(start)

    end

  end
end

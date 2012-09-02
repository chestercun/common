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
      reset
      initial = !initial.nil? ? initial : @vertices.keys.first
      u = getVertex( initial )
      dfs( u )
    end

    # shortest path
    def shortest_path(from,to)
      dijkstra(from)
      show_history(to)
    end

    # show the chain of the path
    def show_history(name)
      u = getVertex(name)
      vertex_array = path_array(u,[])
      puts vertex_array.map{ |v| v.name }.join('->')
    end
    
    private

    def reset
      @vertices.each do |key,vertex|
        vertex.reset
      end
    end

    def getVertex(name)
      name_s = name.to_s
      if @vertices[name_s].nil?
        v = Common::Vertex.new(name)
        @vertices[name_s] = v
      end
      @vertices[name_s]
    end

    # run Dijkstra's Algorithm
    def dijkstra(name)

    end

    # show path of "previous"
    def path_array(vertex,array)
      path_array( vertex.prev, array ) unless vertex.prev.nil?
      array.push(vertex)
    end

    # run a depth first search
    # starting with an initial
    # Common::Vertex object
    def dfs(start_vertex)
      count = 0
      explore( start_vertex, count )
    end

    # recursive "beast"
    def explore(vertex,count)
      # Pre Processing
      p "vertex: #{vertex.name} -> pre: #{count}"
      count += 1
      
      # set "visit" flag, stop recursion
      vertex.visited = true

      # iterate adjacent vertices
      vertex.neighbors.each do |adj_v|
        if not adj_v.visited?
          count = explore(adj_v,count)
        end
        # record previous vertex
        adj_v.prev = vertex
      end

      # Post Processing
      p "vertex: #{vertex.name} -> post: #{count}"
      count += 1

      # i wish i could pass by reference in ruby
      # gotta look into that later
      count
    end
  end
end

module Common
  class Node
    attr_accessor :value
    def initialize(val=nil)
      @value = val
    end
  end

  module BinaryNode
    def initialize(val=nil)
      self.class.class_eval do
        attr_accessor :left, :right
      end
      @left, @right = nil, nil
      super(val)
    end

    def leaf_node?
      childless?
    end

    def childless?
      @left.nil? and @right.nil?
    end
  end

  class HeapNode < Node
    include BinaryNode
  end

  class TreeNode < Node
    include BinaryNode
  end
end

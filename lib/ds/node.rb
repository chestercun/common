module Common
  class Node
    def initialize(val=nil)
      @value = val
    end
  end

  module BinaryNode
    def initialize(val=nil)
      class_eval %Q{
        attr_accessor :left, :right
      }
      @left, @right = nil, nil
      super(val)
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

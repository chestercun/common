module Common
  class Tree
    attr_reader :size

    def initialize
      @head = nil
      @size = 0
    end

    def insert(value)
      node = TreeNode.new(value)
      if @head.nil?
        @head = node
        @size += 1
      else
        place_node(@head,node)
      end
    end


    private
    def place_node(root,node)
      if node<root
        if root.left.nil?
          root.left = node
          @size += 1
        else
          place_node(root.left,node)
        end
      elsif node>root
        if root.right.nil?
          root.right = node
          @size += 1
        else
          place_node(root.right,node)
        end
      else
        return root
      end
    end
    
    public
    def in_order(&blk)
      if block_given?
        traverse(@head,blk)
      end
    end

    private
    # in-order traversal
    def traverse(node,blk)
      unless node.nil?
        traverse(node.left,blk)
        #blk.call(node)
        blk.call(node.value)
        traverse(node.right,blk)
      end
    end

  end
end

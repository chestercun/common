module Common
  class PriorityQueue < Common::Queue
    def initialize
      @heap = Common::Heap.new
    end
  end
end

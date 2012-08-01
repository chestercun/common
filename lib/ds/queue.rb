module Common
  class Queue
    def initialize
      @values = []
    end
    def size
      @values.size
    end
    def push(n)
      @values.push(n)
    end
    def pop
      @values.shift
    end
  end
end

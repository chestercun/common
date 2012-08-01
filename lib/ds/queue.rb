module Common
  class Queue
    def initialize
      @values = []
    end

    def empty?
      @values.size.zero?
    end

    def size
      @values.size
    end

    def push(*args)
      args.each { |n| @values.push(n) }
    end

    def pop
      @values.shift
    end
  end
end

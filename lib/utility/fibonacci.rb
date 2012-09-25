module Fibonacci
  # golden ratios
  ROOT1 = (1+Math.sqrt(5))/2
  ROOT2 = (1-Math.sqrt(5))/2
  # memoized
  @@Sequence = [0,1]

  def fibonacci(n)
    # closed form solution
    # not accurate for large n
    float = (ROOT1**n - ROOT2**n) / Math.sqrt(5)
    float.to_i
  end

  def fibonacci2(n)
    while @@Sequence.length < n+1
      @@Sequence.push(@@Sequence[-1]+@@Sequence[-2])
    end
    @@Sequence[n]
  end

  def debug_fib
    p @@Sequence.inspect
  end

  alias :fib :fibonacci
  alias :fib2 :fibonacci2
end

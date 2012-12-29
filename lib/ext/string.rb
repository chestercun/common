class String
  def palindrome?
    self.reverse.eql? self
  end

  def validate(regex)
    !self.match(regex).nil?
  end

  def edit_distance(str)
    Common.edit_distance(self,str)
  end

  # Sum the digits of a string
  #
  # str = "455"
  # str.digits_sum => 14
  #
  def digits_sum
    self.split('').map {|x| x.to_i}.inject(0) do |res,elt|
      res += elt
      res
    end
  end

  # palantir career fair question
  #
  def reverse_csv
    self.split(',').reverse.join(',')
  end

  # power set
  public

  def power_set
    temp_str = nil
    temp_a = nil
    cache = Hash.new
    (1..self.size).each do |i|
      temp_str = self[self.size-i...self.size]
      #puts "calculating #{temp_str}"
      temp_a = power_set_helper(temp_str, cache)
      #puts "cache has these keys now: #{cache.keys.inspect}"
    end
    result_set = power_set_helper(self,cache)
    clean_result_set( result_set )
    result_set
  end
  
  # helper functions for power set
  private

  def power_set_helper(input_str, cache)
    value = [] # return value

    # check cache first
    if cache.has_key?( input_str.to_sym )
      return cache[ input_str.to_sym ]
    end

    # base case
    if input_str.size == 0
      value.push([])
      return value
    end

    # separate first character and the rest
    character_array = input_str.split(//)
    first_char = character_array.shift

    # recurse
    subset = power_set_helper(character_array.join(''), cache)

    subset.each do |set|
      value.push( set )
      temp = set.dup
      temp.push( first_char )
      value.push( temp )
    end

    # try to add to cache
    unless cache.has_key?( input_str.to_sym )
      cache[input_str.to_sym] = value
    end

    # return
    value
  end

  # helper function for power set
  def clean_result_set(result_set)
    result_set.each do |set|
      set.sort!
    end
    result_set.sort! {|a,b| a.size <=> b.size}
  end

  public

end

if __FILE__ == $0
  test_case = (ARGV[0]) ? ARGV[0] : "abc"
  set = test_case.power_set
  puts set.inspect
end

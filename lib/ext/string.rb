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
end

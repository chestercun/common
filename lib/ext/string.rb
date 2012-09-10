class String
  def palindrome?
    self.reverse.eql? self
  end

  def validate(regex)
    !self.match(regex).nil?
  end
end

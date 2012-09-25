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
end

class String
  def palindrome?
    self.reverse.eql? self
  end
end

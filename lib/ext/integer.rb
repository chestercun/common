class Integer
  def mod_array?(array)
    tmp = array.select { |i| self % i == 0 }
    tmp.length > 0
  end
end

class Hash
  def slice(arr=[])
    tmp = {}
    arr.each do |elt|
      tmp[elt] = self[elt]
    end
    tmp
  end
end

class Array
  # mod-able?
  def % (*args)
    #p args
    self.each do |i|
      args.each do |j|
        next if j == 0
        if i % j == 0
          return true
        end
      end
    end
    false
  end

  def sum
    self.inject(:+)
  end
end

module DynamicProgramming
  
  def empty_matrix(x,y,fill=nil)
    Array.new(x) { Array.new(y,fill) }
  end

  def edit_distance(str1,str2)
    temp = empty_matrix(str1.length+1,str2.length+1,0)
    max = [str1.length,str2.length].max
    (1..max).to_a.each do |i|
      (i..str1.length).to_a.each do |j|
        check = (str1[j]==str2[i]) ? 0 : 1
        temp[i][j] = [check+temp[i-1][j-1],1+temp[i-1][j],1+temp[i][j-1]].min
      end
    end

    temp[-1][-1]
  end
end

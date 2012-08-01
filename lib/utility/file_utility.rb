module FileUtility

  def cat_file(fn)
    line_arr(fn).each do |line|
      p line
    end
  end

  def line_arr(fn)
    # call private
    file = open(fn)
    # build line array
    tmp = []
    file.each do |line|
      next if line =~ /\A\n\Z/
      line.sub! /\n$/, ''
      tmp.push(line)
    end
    tmp
  end

  private

  def open(fn)
    begin
      file =  File.new(fn,'r') # if File.exists?(fn)
      return file
    rescue => e
      p "#{e} Exception Caught."
    end
  end


end


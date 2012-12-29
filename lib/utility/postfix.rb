module Postfix
  def postfix_to_infix(str)
    stack = []
    str.split(/ /).each do |x|
      case x
      when *%w{+ * - /}
        op2 = stack.pop
        op1 = stack.pop
        stack.push "(#{op1} #{x} #{op2})"
      else
        stack.push x
      end
    end
    stack.pop
  end
end

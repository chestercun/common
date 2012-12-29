# ruby core extensions
require 'ext/extensions'

# utilities
require 'utility/file_utility'
require 'utility/dynamic_programming'
require 'utility/fibonacci'
require 'utility/postfix'

# homegrown data structures
require 'ds/data_structures'

# personal DSL's
require 'dsl/dsl'
include Common::DSL

# natural language processing
require 'nlp/nlp_utility'

module Common
  # useful file methods
  extend FileUtility
  # makes it so that you can do
  # Common.function_from_file_utility('a.txt')
  
  # also use extend, be wary of name collisions
  extend DynamicProgramming
  extend Fibonacci
  extend Postfix
end


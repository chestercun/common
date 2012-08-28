# ruby core extensions
require 'ext/extensions'

# utilities
require 'utility/file_utility'

# homegrown data structures
require 'ds/data_structures'

# personal DSL's
require 'dsl/dsl'
include Common::DSL

module Common
  # useful file methods
  extend FileUtility
  # makes it so that you can do
  # Common.function_from_file_utility('a.txt')
end


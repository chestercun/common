# if these ext files ever exceed 4
# i will add an ext.rb file and require
# the extensions in that file
require 'ext/string'
require 'ext/array'
require 'ext/hash'

# utilities
require 'utility/file_utility'

# personal data structures
require 'ds/data_structures'

# person DSL's
require 'dsl/dsl'
include Common::DSL

module Common
  # useful file methods
  extend FileUtility
  # make it so that you can do
  # Common.function_from_file_helpers('a.txt')
end


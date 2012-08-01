require 'rake'

Gem::Specification.new do |s|
	s.name				= 'common'
	s.version			= '0.0.0'
	s.date				= '2012-07-31'
	s.description = %Q{
    This is my personal Ruby toolkit.
    It is used for learning, Project Euler,
    and anything fun on the side.
  }
	s.summary     = 'multi-purpose library'
	s.authors			= ["Chester Cun"]
	s.email				= 'chester.cubed@gmail.com'
	s.files				= Dir['lib/*','lib/*/*']
	s.homepage		= 'http://localhost:3000'
end

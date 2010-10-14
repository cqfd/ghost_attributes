# GhostAttributes is a silly example of how you can write a version of 
# attr_accessor using closures instead of instance variables.
#
# Example usage:
# class Hippo
#   include GhostAttributes
#   ghost_accessor :name
# end
#
# hippo = Hippo.new
# hippo.name = "Humphrey"
# hippo.name # => "Humphrey"

module GhostAttributes
  def self.included klass
    def klass.ghost_accessor var
      ghost_var = nil
      define_method "#{var}" do
        ghost_var
      end
      define_method "#{var}=" do |val|
        ghost_var = val
      end
      nil # so that the call doesn't return a funny-looking proc
    end
  end
end

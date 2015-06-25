class Test1
	def initialize(name)
		@name = name
	end
	def to_s
		@name
	end
end
class Test2
	def initialize(name="UNKNOWN")
		@name = name
	end
	def to_s
		@name
	end
end

puts Test2.new
puts Test1.new "hello"
puts Test2.new "hello2"

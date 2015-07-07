class Roman
	attr_reader :numeral
	def initialize(number)
		if number>3999
			number = 3999
			STDERR.puts "Warning: request too high! reduced to 3999"
		end
		@hash = {
			:Zero=>0,
			:I=>1,
			:V=>5,
			:X=>10,
			:L=>50,
			:C=>100,
			:D=>500,
			:M=>1000
		}
		@hashLargest = @hash.to_a.reverse.to_h
		@number = number

		@THRESHOLD = 3		#can be 3 or 4
	end
	def genNumeral
		tmp = @number.to_s.split("")
		ret = ""
		tmp.each_with_index do |element, index|
		########
			number = element.to_i * 10**(tmp.length-index-1)
			last_largest = :M
			counter = 0
			loop do
				l = findLargest(number)
				if l!=last_largest
					if counter > @THRESHOLD
						(5-counter).times { ret+=last_largest.to_s } 
						ret+=one_higher(last_largest).to_s
					else
						counter.times { ret+=last_largest.to_s }
					end
					last_largest = l
					counter = 0
				end
				break if number == 0
				number -= @hash[l]
				counter+=1
			end
		########
		end
		ret
	end
	def findLargest(number)
		return :Zero if number == 0
		@hashLargest.each do |key, val|
			if number/val > 0
				return key
			end
		end
		val
	end
	def one_higher(sym)
		return :Zero if sym==:M
		keys = @hash.keys
		index = keys.index(sym)
		return keys[index+1] if(index != nil)
		:Zero
	end
end

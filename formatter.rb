require 'erb'

class Formatter
	attr_accessor :string
	def initialize(str="")
		@string = str #set string
	end
	def split
		return @string.split #returns array of strings from string by spaces
	end
	def render(format,array)
		ctrl = Controller.new(array)
		template = ERB.new File.new("partials/"+format+".erb").read,nil,"%"
		template.result(ctrl.getBinding)
	end
end
class Controller
	def initialize(array=nil)
		@array = array
		@maxLength = array.max_by{|x|x.length}.length
	end
	def getBinding
		binding
	end
	def ast
		@array.length.times do |element|
			@array[element] = @array[element].ljust(@maxLength+1," ")+"*"
			@array[element] = "*"+@array[element].rjust(@maxLength+3," ")
		end
	end
end

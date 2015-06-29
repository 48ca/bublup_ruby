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
		ctrl = Controller.new(array) #pass control to Controller
		template = ERB.new File.new("partials/#{format}.erb").read,nil,"%" #initialize template
		template.result(ctrl.getBinding) #render and return template
	end
end
class Controller
	attr_reader :array
	def initialize(array=nil) #initialize values
		@array = array
		@maxLength = array.max_by{|x|x.length}.length
	end
	def getBinding #provide a method for ERB to get binding
		binding
	end
	def ast #be able to format strings for asterisk format (called in partials/asterisk.erb)
		@array.length.times do |element|
			@array[element] = "#{@array[element].ljust(@maxLength+1," ")}*"
			@array[element] = "*#{@array[element].rjust(@maxLength+3," ")}"
		end
	end
end

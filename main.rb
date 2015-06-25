#!/usr/bin/env ruby

require_relative 'formatter'
format = Formatter.new
while true do
	begin
		format.string = gets
		puts format.render("html",format.split)
		#puts format.render("asterisk",format.split)
	rescue Exception => e
		break
	end
end

#!/usr/bin/env ruby

require_relative 'formatter'
format = Formatter.new
if ARGV.length != 1
	puts "usage: main.rb [format]"
	puts "possible formats: asterisk, html"
	exit
end
while true do
	begin
		format.string = STDIN.gets.chomp
		puts format.render(ARGV[0],format.split)
	rescue Exception => e
		break
	end
end

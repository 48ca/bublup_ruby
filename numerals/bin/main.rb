#!/usr/bin/env ruby
require_relative '../lib/roman'

while true do
	begin
		r = Roman.new(gets.to_i)
		puts r.genNumeral
	rescue Exception => e
		puts e
		exit
	end
end

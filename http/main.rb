#!/usr/bin/env ruby
require_relative 'links'

if ARGV.length==1
	l = Links.new(ARGV[0])
	puts l.getLinks
else
	puts "usage: ruby main.rb [URI]"
end
#	while true
#		url = gets
#		body = HTTParty.get(url.to_s).to_s
#		puts getLinks(body)
#	end

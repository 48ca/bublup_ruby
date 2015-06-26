#!/usr/bin/env ruby
require_relative 'links'

if ARGV.length==1
	begin
		l = Links.new(ARGV[0])
		puts l.genLinks
	rescue Exception => e
		puts e
		puts "(Is http:// in front of the URL?)"
	end
else
	puts "usage: ruby main.rb [URI]"
end
#	while true
#		url = gets
#		body = HTTParty.get(url.to_s).to_s
#		puts getLinks(body)
#	end

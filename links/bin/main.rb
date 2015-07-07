#!/usr/bin/env ruby
require_relative '../lib/links'

if ARGV.length==1
	begin
		l = Links.new(ARGV[0])
		puts l.genLinks
	rescue Exception => e
		puts e
		puts "(Is http:// in front of the URL?)"
	end
else
	STDERR.puts "usage: ruby main.rb [URI]"
end

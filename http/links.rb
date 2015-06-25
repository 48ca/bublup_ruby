#!/usr/bin/env ruby
require 'httparty'

class Links
	def initialize(str)
		@link = str
		@content = ""
	end
	def getLinks() #find all links in body of page
		downloadPage()
		la = @content.split("<a ")
		links = []
		return links if la.length == 0
		for i in 1..la.length-1 do
			links[i-1] = la[i].split("href")[1].split("\"")[1]
		end
		links
	end
	def downloadPage()
		@content = HTTParty.get(@link).to_s
	end
end

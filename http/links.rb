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
		for i in 1..la.length-1 do
			tmp = la[i].split("href")[1]
			links[i-1] = tmp.split("\"")[1] if tmp.class != NilClass
		end
		links
	end
	def downloadPage()
		@content = HTTParty.get(@link).to_s
	end
end

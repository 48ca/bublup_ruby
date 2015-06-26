#!/usr/bin/env ruby
require 'httparty'

class Links
	attr_accessor :links
	def initialize(str)
		@URL = str
		@content = ""
		@links = []
		downloadPage()
	end
	def genLinks()
		getATags()
		getLinks()
		@links
	end
	def getATags()
		@links = @content.split("<a ")
		@links.shift
	end
	def getLinks() #find all links in body of page
		tmplinks = []
		@links.each do |element|
			tmp = element.split("href")[1]
			tmplinks << tmp.split("\"")[1] if tmp.class != NilClass
		end
		@links = tmplinks
	end
	def downloadPage()
		@content = HTTParty.get(@URL).to_s
	end
end

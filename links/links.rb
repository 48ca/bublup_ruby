#!/usr/bin/env ruby
require 'httparty'

class Links
	attr_accessor :links
	def initialize(str)
		@URL = str
		@content = download()
		@links = []
	end
	def genLinks() #call two methods to parse links
		getATags() #get all a tags first
		getLinks() #with a tags, get all href attrs
		@links #optional return
	end
	def getATags()
		@links = @content.split("<a ") #split content on a tags
		@links.shift #remove garbage data in front
	end
	def getLinks() #find all links in body of page
		tmplinks = []
		@links.each do |element| #for all a tags
			tmp = element.split("href")[1] #find href attribute
			tmplinks << tmp.split("\"")[1] if tmp.class != NilClass #and if no error occurs, add what's between the immediate quotes
		end
		@links = tmplinks #set links to the tmp array
	end
	def download()
		HTTParty.get(@URL).to_s #get URL. to_s gives page without headers
	end
end

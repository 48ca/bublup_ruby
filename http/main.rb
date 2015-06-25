#!/usr/bin/env ruby
require 'httparty'
def getLinks(body) #find all links in body of page
	la = body.split("<a ")
	links = []
	for i in 1..la.length-1 do
		links[i-1] = la[i].split("href")[1].split("\"")[1]
	end
	links
end
def main
	if ARGV.length==1
		puts getLinks(HTTParty.get(ARGV[0]).to_s)
		exit
	end
	while true
		url = gets
		body = HTTParty.get(url.to_s).to_s
		puts getLinks(body)
	end
end
main

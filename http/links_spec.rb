require_relative 'links'

describe Links do
	it "should return 10 links from tjhsst.edu" do
		l = Links.new("http://tjhsst.edu")
		expect(l.getLinks.length).to eq(88)
	end
end
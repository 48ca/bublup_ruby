require 'links'

describe Links do
	it "should return 10 links from tjhsst.edu" do
		l = Links.new("http://tjhsst.edu")
		expect(l.genLinks.length).to eq(88)
	end
end

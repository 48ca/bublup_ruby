require 'roman'

describe Roman do
	it "should find 1000 in 2000" do
		expect(Roman.new(2000).findLargest(2000)).to eq(:M)
	end
	it "should convert 2 to II" do
		r = Roman.new(2)
		expect(r.genNumeral).to eq("II")
	end
	it "should convert 4 to IV" do
		r = Roman.new(4)
		expect(r.genNumeral).to eq("IV")
	end
	it "should know the demon higher than :I is :V" do
		r = Roman.new(1)
		expect(r.one_higher(:I)).to eq(:V)
	end
	it "should eval 1000 to M" do
		r = Roman.new(1000)
		expect(r.genNumeral).to eq("M")
	end
end

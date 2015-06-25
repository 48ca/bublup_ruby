require_relative 'formatter'

describe Formatter do
	before :each do
		@formatter = Formatter.new "default String"
	end
	it "should read the string" do
		expect(@formatter.string).to eq("default String")
	end
	it "should modify the string" do
		@formatter.string = "modified"
		expect(@formatter.string).to eq("modified")
	end
	it "should split the string" do
		expect(@formatter.split).to eq(['default','String'])
	end
	it "should format the file to html" do
		expect(@formatter.render("html",@formatter.split)).to eq("<html>\n\n<p>default</p>\n\n<p>String</p>\n\n</html>\n")
	end
	it "should format the file to asterisk" do
		expect(@formatter.render("asterisk",@formatter.split)).to eq("\n***********\n\n* default *\n\n* String  *\n\n***********\n")
	end
end
describe Controller do
	before :each do
		@ctrl = Controller.new(['default','String'])
	end
	it "should ast-ify the string" do
		@ctrl.ast
		expect(@ctrl.array).to eq(['* default *','* String  *'])
	end
end

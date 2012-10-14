# encoding: utf-8
require 'rspec'
require 'idn_ffi'
require 'test_vectors'
  
describe "IDNFFI" do
  describe "to_unicode" do
    it "should pass all test cases" do
      TESTCASES_JOSEFSSON.sort.each do |testcase, vector|
        IDNFFI.to_unicode(vector[1]).should == vector[0]
      end
    end
    
    it "should respect * and not try to decode it" do
      IDNFFI.to_unicode("*.xn--mllerriis-l8a.com").should == "*.møllerriis.com"
    end
    
    it "should respect leading _ and not try to encode it" do
		  IDNFFI.to_unicode("_something.xn--mllerriis-l8a.com").should == "_something.møllerriis.com"
	  end
  
    it "should return nil for nil" do
      IDNFFI.to_unicode(nil).should be_nil
    end
  
  end
  
  describe "to_ascii" do
    it "should pass all test cases" do
      TESTCASES_JOSEFSSON.sort.each do |testcase, vector|
				IDNFFI.to_ascii(vector[0]).should == vector[1].downcase
      end
    end
    
    it "should respect * and not try to encode it" do
			IDNFFI.to_ascii("*.hello.com").should == "*.hello.com"
		end
		
		it "should respect leading _ and not try to encode it" do
		  IDNFFI.to_ascii("_something.example.org").should == "_something.example.org"
	  end
		
    it "should return nil for nil" do
      IDNFFI.to_ascii(nil).should be_nil
    end
  end
end

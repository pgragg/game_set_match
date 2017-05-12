require 'spec_helper'

describe Matcher do
  it "should match up things which are similar" do
    array1 = ['01 - Lana Del Rey.mp4', '04 - The Heebee Jeeby Experience', '05 - Woodstock: What I learned']
    array2 = ['the_ heebee jeeby experience', 'lana del ray', 'woodstok what I learned']
    expect(Matcher.new(array1, array2).match.sort.to_h).to eq({
    	"the_ heebee jeeby experience"=>"04 - The Heebee Jeeby Experience", 
    	"lana del ray"=>"01 - Lana Del Rey.mp4", 
    	"woodstok what I learned"=>"05 - Woodstock: What I learned"
    	})
  end
end
require 'spec_helper'

describe Item do  
  it "should return true for gorcery item" do
  	item = Item.new('G', 100)
  	item.is_grocery?.should be_true
  end

  it "should return false for non grocery item" do
  	item = Item.new('NG',100)
  	item.is_grocery?.should be_false
  end
end